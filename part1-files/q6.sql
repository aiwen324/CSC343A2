-- Steady work

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q6;

-- You must not change this table definition.
CREATE TABLE q6 (
	group_id integer,
	first_file varchar(25),
	first_time timestamp,
	first_submitter varchar(25),
	last_file varchar(25),
	last_time timestamp, 
	last_submitter varchar(25),
	elapsed_time interval
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)
DROP VIEW IF EXISTS gid CASCADE;

-- Define views for your intermediate steps here.
-- View for group_id for A1
CREATE VIEW gid AS
	select group_id
	from AssignmentGroup natural join Assignment
	where description = 'A1';

-- View for gid with submission, need every group appear,
-- So we will use the natural join
CREATE VIEW a1group_submission AS
	select group_id, submission_id, file_name,
	username, submission_date
	from gid natural left join submissions;

-- View for first submit for each group
CREATE VIEW group_submission_first AS
	select group_id, min(submission_date) as submission_date
	from a1group_submission
	group by group_id;

-- View for last submit for each group
CREATE VIEW group_submission_last AS
	select group_id, max(submission_date) as submission_date
	from a1group_submission
	group by group_id;

-- View for View for first submit for each group with details
CREATE VIEW group_submission_first_details AS
	select group_id, file_name as first_file, submission_date
	as first_time, username as first_submitter
	from a1group_submission natural join group_submission_first;

CREATE VIEW group_submission_last_details AS
	select group_id, file_name as last_file, submission_date
	as last_time, username as last_submitter
	from a1group_submission natural join group_submission_last;

CREATE VIEW group_submission_details AS
	select group_id, first_file, first_time, first_submitter,
	last_file, last_time, last_submitter, (last_time - first_time)
	as elapsed_time
	from group_submission_first_details natural join 
	group_submission_last_details;


-- Final answer.
INSERT INTO q6 (select * from group_submission_details);
	-- put a final query here so that its results will go into the table.