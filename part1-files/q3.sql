-- Solo superior

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q3;

-- You must not change this table definition.
CREATE TABLE q3 (
	assignment_id integer,
	description varchar(100), 
	num_solo integer, 
	average_solo real,
	num_collaborators integer, 
	average_collaborators real, 
	average_students_per_submission real
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)
DROP VIEW IF EXISTS gid_num CASCADE;
DROP VIEW IF EXISTS total_grade CASCADE;
DROP VIEW IF EXISTS group_mark CASCADE;



-- Define views for your intermediate steps here.

-- View for group_id and num of group members
CREATE VIEW gid_num AS
	select group_id, count(username) as num_mem
	from Membership
	group by group_id;
	
-- View for group_id and num of members
-- with ast_id
CREATE VIEW gid_num_astid AS
	select group_id, num_mem, assignment_id
	from gid_num natural join AssignmentGroup;

-- View for gid_num_astid with description
CREATE VIEW gid_num_astid2 AS
	select group_id, num_mem, assignment_id, description
	from Assignment natural left join gid_num_astid;
	
-- View for total grades
CREATE VIEW total_grade AS
	SELECT sum(out_of * weight) as total_mark, assignment_id
	From RubricItem
	GROUP BY assignment_id;
	
-- View for grades
CREATE VIEW group_mark AS
	select assignment_id, group_id, mark
	from gid_num_astid natural join Result;

-- View for percent grades
CREATE VIEW total_percent_grade AS
	select assignment_id, group_id, 
	(mark * 100)/total_mark as mark_percent
	From total_grade natural join group_mark;
	
-- View for gid_num_astid2 with pecent_grade
CREATE VIEW gid_num_astid3 AS
	select assignment_id, description, group_id, num_mem, mark_percent
	from gid_num_astid2 natural left join total_percent_grade;
	
-- View for solo group
CREATE VIEW solo_group AS
	select assignment_id, description, group_id, num_mem, mark_percent
	from gid_num_astid3
	where num_mem = 1;
	
CREATE VIEW solo_group2 AS
	select g.assignment_id, description, group_id, num_mem, mark_percent
	from (select distinct assignment_id from gid_num_astid3) g natural left join solo_group s;

-- View for collab groups
CREATE VIEW collab_group AS
	select assignment_id, description, group_id, num_mem, mark_percent
	from gid_num_astid3
	where num_mem > 1;
	
CREATE VIEW collab_group2 AS
	select g.assignment_id, description, group_id, num_mem, mark_percent
	from (select distinct assignment_id from gid_num_astid3) g natural left join collab_group c;
	
-- View for avg grade for solo_group
CREATE VIEW solo_group_avg AS
	select assignment_id, avg(mark_percent) as average_solo, count(group_id) as num_solo
	from solo_group2
	group by assignment_id;

-- View for avg grade for collab group
CREATE VIEW collab_group_avg AS
	select assignment_id, avg(mark_percent) as average_collaborators, sum(num_mem) as num_collaborators
	from collab_group2
	group by assignment_id;
	
-- View for all assignment with solo group
CREATE VIEW ast_group_avg AS
	select assignment_id, sum(num_mem * mark_percent) / sum(num_mem) as average_students_per_submission, 
	description
	from gid_num_astid3
	group by assignment_id,description;
	
-- View for final results
CREATE VIEW final_result AS
	select assignment_id, description, num_solo, average_solo, num_collaborators, 
	average_collaborators, average_students_per_submission
	from ast_group_avg natural join collab_group_avg natural join solo_group_avg;





-- Final answer.
INSERT INTO q3 (select * from final_result);
	-- put a final query here so that its results will go into the table.
