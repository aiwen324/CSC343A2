-- Never solo by choice

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q8;

-- You must not change this table definition.
CREATE TABLE q8 (
	username varchar(25),
	group_average real,
	solo_average real
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)
DROP VIEW IF EXISTS Ast_member CASCADE;
DROP VIEW IF EXISTS total_grade CASCADE;
DROP VIEW IF EXISTS gid_astid CASCADE;





-- Define views for your intermediate steps here.
CREATE VIEW Ast_member AS
	select assignment_id, group_max, group_id, num_mem, username
	from Assignment natural join Membership natural join 
	(select group_id, count(username) as num_mem
	 from Membership group by group_id) m9;

-- View for students have soloed
CREATE VIEW have_soloed AS
	select distinct username
	from Ast_member
	where num_mem = 1 and group_max <> 1;

-- View for students haven't soloed with astid and gid
CREATE VIEW never_solo_ast AS
	select assignment_id, username, group_id, group_max
	from Ast_member
	where username NOT IN (select username from have_soloed);

-- View for solo_ast with submission
CREATE VIEW never_solo_ast_submission AS
	select assignment_id, username, group_id, submission_id, group_max
	from never_solo_ast natural left join Submissions;


-- View for never solo students but not contribute to every ast
CREATE VIEW not_contributing AS
	select username
	from never_solo_ast_submission
	where submission_id is NULL;

-- View for students that is contributing
CREATE VIEW never_solo_but_contribute AS
	select assignment_id, username, group_id, group_max
	from never_solo_ast_submission
	where username not in (select username from not_contributing);

-- View for total grade
CREATE VIEW total_grade AS
	select assignment_id, sum(out_of * weight) as total_mark
	from RubricItem
	group by assignment_id;

-- VIew for percent grade
CREATE VIEW gid_astid AS
	select assignment_id, group_id, mark
	from Result natural join AssignmentGroup;

-- View for percent grade
CREATE VIEW percent_grade AS
	select assignment_id, group_id, mark * 100 / total_mark as percent_mark
	from gid_astid natural join total_grade;

-- View for never solo but contributes students mark
CREATE VIEW nosolo_contributer AS
	select assignment_id, username, group_id, group_max, percent_mark
	from never_solo_but_contribute natural join percent_grade;

-- View for non solo group
CREATE VIEW nonsolo_group AS
	select assignment_id, username, group_id, percent_mark
	from nosolo_contributer
	where group_max <> 1;

-- View for non solo group with avg
CREATE VIEW nonsolo_group_avg AS
	select username, avg(percent_mark) as group_average
	from nonsolo_group
	group by username;

-- View for solo group
CREATE VIEW solo_group AS
	select assignment_id, username, group_id, percent_mark
	from nosolo_contributer
	where group_max = 1;

-- View for solo group with avg
CREATE VIEW solo_group_avg AS
	select username, avg(percent_mark) as solo_average
	from solo_group
	group by username;


CREATE VIEW final_result AS
	select username, group_average, solo_average
	from nonsolo_group_avg natural join solo_group_avg;




-- Final answer.
INSERT INTO q8 (select * from final_result);
	-- put a final query here so that its results will go into the table.