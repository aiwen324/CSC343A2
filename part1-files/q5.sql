-- Uneven workloads

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q5;

-- You must not change this table definition.
CREATE TABLE q5 (
	assignment_id integer,
	username varchar(25), 
	num_assigned integer
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)
DROP VIEW IF EXISTS grader_with_aid_num CASCADE;

-- Define views for your intermediate steps here.

-- View for 
CREATE VIEW grader_with_aid_num AS
	select assignment_id, username, count(group_id) as num_assigned
	from Grader natural join AssignmentGroup
	group by assignment_id, username;

-- Find the ast id that are out of range
CREATE VIEW gid_aid_num AS
	select assignment_id
	from grader_with_aid_num
	group by assignment_id
	having max(num_assigned) - min(num_assigned) > 10;

-- View for final result
CREATE VIEW grader_aid_num_out_of_range AS
	select assignment_id, username, num_assigned
	from grader_with_aid_num
	where assignment_id in (select assignment_id from gid_aid_num);





-- Final answer.
INSERT INTO q5 (select * from grader_aid_num_out_of_range);
	-- put a final query here so that its results will go into the table.