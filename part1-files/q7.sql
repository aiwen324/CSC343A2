-- High coverage

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q7;

-- You must not change this table definition.
CREATE TABLE q7 (
	ta varchar(100)
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)
DROP VIEW IF EXISTS grader_with_astid CASCADE;
DROP VIEW IF EXISTS all_students CASCADE;

-- Define views for your intermediate steps here.

CREATE VIEW grader_with_astid AS
	select username, group_id, assignment_id
	from AssignmentGroup natural join Grader;

-- Distinct combination of TA and astid
CREATE VIEW grader_distinct_astid AS
	select distinct username, assignment_id
	from grader_with_astid;

-- Find the TA who has been assigned to at least one group for every assignment
CREATE VIEW satisfied_TA AS
	select username
	from grader_distinct_astid
	group by username
	having count(assignment_id) = (select count(assignment_id) as num 
								   from Assignment);

-- grader_with_astid after filter
CREATE VIEW grader_with_astid_filter AS
	select username, group_id, assignment_id
	from grader_with_astid
	where username in (select username from satisfied_TA);

-- list of all students
CREATE VIEW all_students AS
	select username 
	from MarkusUser
	where type = 'student';

-- grader_with_astid_filter with student username
CREATE VIEW grader_with_astid_students AS
	select g.username as TA, g.group_id, assignment_id, m.username as student_id
	from grader_with_astid_filter g join Membership m on 
	g.group_id = m.group_id;

-- grader with distinct student in case same student can be in different groups
-- for same assignment from the schema, it is possible
CREATE VIEW distinct_tuple AS
	select distinct TA, assignment_id, student_id
	from grader_with_astid_students;

CREATE VIEW better_TA AS
	select distinct TA
	from distinct_tuple
	group by TA, assignment_id
	having count(student_id) = (select count(username) from all_students);





-- Final answer.
INSERT INTO q7 (select * from better_TA);
	-- put a final query here so that its results will go into the table.