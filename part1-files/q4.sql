-- Grader report

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q4;

-- You must not change this table definition.
CREATE TABLE q4 (
	assignment_id integer,
	username varchar(25), 
	num_marked integer, 
	num_not_marked integer,
	min_mark real,
	max_mark real
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)
DROP VIEW IF EXISTS intermediate_step CASCADE;

-- Define views for your intermediate steps here.
CREATE VIEW grader_with_astid AS
	select username, group_id, assignment_id
	from Grader natural join AssignmentGroup;

-- View for grader with astid and mark
CREATE VIEW grader_with_mark_astid AS
	select username, group_id, assignment_id, mark
	from grader_with_astid natural left join Result;
	
-- View for total grade
CREATE VIEW total_grade AS
	select assignment_id, sum(out_of * weight) as total_mark
	from RubricItem
	where assignment_id in (select * from grader_with_mark_astid)
	group by assignment_id;

-- View for grader_with_mark_astid with percentage mark
CREATE VIEW grader_with_percent_mark_astid AS
	select username, group_id, assignment_id, (mark * 100) / total_mark
	as percent_mark
	from grader_with_mark_astid natural left join total_grade;

-- View for final results
CREATE VIEW final_result AS
	select assignment_id, username, count(percent_mark) as num_marked,
	count(*) - count(percent_mark) as num_not_marked, min(percent_mark) as
	min_mark, max(percent_mark) as max_mark
	from grader_with_percent_mark_astid
	group by assignment_id, username;

	





-- Final answer.
INSERT INTO q4 (select * from final_result);
	-- put a final query here so that its results will go into the table.