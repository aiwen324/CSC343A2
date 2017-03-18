-- A1 report

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q10;

-- You must not change this table definition.
CREATE TABLE q10 (
	group_id integer,
	mark real,
	compared_to_average real,
	status varchar(5)
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)
DROP VIEW IF EXISTS gid CASCADE;
DROP VIEW IF EXISTS total_grade CASCADE;
-- Define views for your intermediate steps here.
-- View for A1 group
CREATE VIEW gid AS
	select group_id, assignment_id
	from AssignmentGroup natural join Assignment
	where description = 'A1';



-- View for total grade
CREATE VIEW total_grade AS
	select sum(out_of * weight) as total_mark, assignment_id
	from RubricItem
	group by assignment_id;

-- View for astid with gid
CREATE VIEW ast_gid AS
	select assignment_id, group_id, total_mark
	from gid natural left join total_grade;


-- View for gid with percent mark in A1 
CREATE VIEW gid_percent_mark AS
	select group_id, (mark * 100)/ total_mark as percent_mark
	from ast_gid natural left join Result;

-- View for avg grade
-- forget if avg will count null, so just do in this way
CREATE VIEW avg_mark AS
	select sum(percent_mark) / count(group_id) as average
	from gid_percent_mark;

-- View gid that mark is under average 
CREATE VIEW gid_avg AS
	select group_id, percent_mark as mark, 
	percent_mark - average as compared_to_average, (CAST(NULL as varchar(5)))
	as status
	from gid_percent_mark, avg_mark;





-- Final answer.
INSERT INTO q10 (select * from gid_avg);
UPDATE q10 set status = 'above' where compared_to_average > 0;
UPDATE q10 set status = 'at' where compared_to_average = 0;
UPDATE q10 set status = 'below' where compared_to_average < 0;
UPDATE q10 set status = NULL where compared_to_average is NULL;
	-- put a final query here so that its results will go into the table.
