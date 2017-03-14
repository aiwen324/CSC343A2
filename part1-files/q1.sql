-- Distributions

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q1;

-- You must not change this table definition.
CREATE TABLE q1 (
	assignment_id integer,
	average_mark_percent real, 
	num_80_100 integer, 
	num_60_79 integer, 
	num_50_59 integer, 
	num_0_49 integer
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)
DROP VIEW IF EXISTS ast_groupid CASCADE;

-- Define views for your intermediate steps here.

-- Create the view of assignment_id and group_id
CREATE VIEW ast_groupid AS
	SELECT assignment_id, group_id, mark
	From Assignment LEFT JOIN Result;


CREATE VIEW total_grade AS
	SELECT sum(out_of * weight) as mark, assignment_id
	From RubricItem
	GROUP BY assignment_id;

CREATE VIEW total_grade_percent AS
	SELECT (a.mark / t.mark) as mark_per, assignment_id, group_id
	From ast_groupid a LEFT JOIN total_grade t
	ON a.assignment_id = t.assignment_id;

CREATE VIEW grade_gt_80 AS
	SELECT count(mark_per) as num_80_100, assignment_id
	FROM (
		SELECT mark_per, assignment_id, group_id
		FROM total_grade_percent
		WHERE 80 <= mark_per <= 100;
		)
	GROUP BY assignment_id;

-- View for grade between 60 and 79
CREATE VIEW grade_gt_60 AS
	SELECT count(mark_per) as num_60_79, assignment_id
	FROM (
		SELECT mark_per, assignment_id, group_id
		FROM total_grade_percent
		WHERE 60 <= mark_per < 80;
		)
	GROUP BY assignment_id;
	
-- View for grade between 50 and 59
CREATE VIEW grade_gt_50 AS
	SELECT count(mark_per) as num_50_59, assignment_id
	FROM (
		SELECT mark_per, assignment_id, group_id
		FROM total_grade_percent
		WHERE 50 <= mark_per < 60;
		)
	GROUP BY assignment_id;
	
	
-- View for grade not greater than 49
CREATE VIEW grade_lt_50 AS
	SELECT count(mark_per) as num_0_49, assignment_id
	FROM (
		SELECT mark_per, assignment_id, group_id
		FROM total_grade_percent
		WHERE mark_per < 50;
		)
	GROUP BY assignment_id;
	
-- View for avg of each assignment
CREATE VIEW grade_avg AS
	SELECT avg(mark_per) as average_mark_percent, assignment_id
	FROM total_grade_percent
	GROUP BY assignment_id;
	
-- Make joint of some VIEWS above
CREATE VIEW final_result AS
	grade_avg lEFT JOIN grade_gt_80
	LEFT JOIN grade_gt_60
	LEFT JOIN grade_gt_50
	LEFT JOIN grade_lt_50;

	
-- Make the value of null equals 0;
UPDATE final_result SET average_mark_percent = 0, 
grade_gt_80 = 0, grade_gt_60 = 0, grade_gt_50 = 0,
grade_lt_50 = 0 WHERE average_mark_percent = NULL;

-- Final answer.
INSERT INTO q1 (SELECT * FROM final_result);
	-- put a final query here so that its results will go into the table.