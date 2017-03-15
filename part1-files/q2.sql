-- Getting soft

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q2;

-- You must not change this table definition.
CREATE TABLE q2 (
	ta_name varchar(100),
	average_mark_all_assignments real,
	mark_change_first_last real
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)
DROP VIEW IF EXISTS intermediate_step CASCADE;

-- Define views for your intermediate steps here.

-- View for all assignment id
CREATE VIEW all_assignment AS
	select assignment_id, due_date
	from Assignment;
	
-- View for grader with ast id and group id
CREATE VIEW grader_ast AS
	select username, group_id, assignment_id
	from (select username, group_id, assignment_id 
		  from Grader natural join AssignmentGroup) g1
	where g1.assignment_id is not NULL;
/*
-- View for grader with ast_id
CREATE VIEW grader_ast2 AS
	select distinct username, assignment_id
	from grader_ast;

-- View for grader have been assigned to every assignment
CREATE VIEW grader_filter1 AS
	select username
	from grader_ast2
	group by username
	having count(assignment_id) = 
	(select count(assignment_id) from all_assignment);
	
-- View for filtered grader_ast with grader in above filter
CREATE VIEW grader_ast3 AS
	select username, group_id, assignment_id
	from grader_ast
	where username in (select username from grader_filter1);
*/
-- View for grader, g_id, ast_id and mark
CREATE VIEW grader_ast2 AS
	select username, group_id, assignment_id, mark
	from grader_ast natural LEFT join Result
	where group_id is not null;

-- View for total_grade
CREATE VIEW total_grade AS
	SELECT sum(out_of * weight) as mark, assignment_id
	From RubricItem
	GROUP BY assignment_id;
	
-- View for grader, g_id, ast_id and percent_mark
CREATE VIEW grader_ast_percent AS
	select username, group_id, assigned_id,
	g.mark/t.mark as mark
	from grader_ast2 g natural join total_grade t;
	
	
CREATE VIEW grader_ast3 AS
	select distinct username, assignment_id
	from grader_ast_percent;

-- View for grader has marked every assignment
CREATE VIEW grader_filter AS
	select username
	from grader_ast3
	group by username
	having count(assignment_id) = 
	(select count(assignment_id) from all_assignment);
	
-- View for satisfied graders' tuple in grader_ast_percent
CREATE VIEW grader_ast4 AS
	select username, group_id, assignment_id, mark
	from grader_ast_percent
	where username in (select username from grader_filter);
	
-- View for grader who has graded at least 10 groups for each ast
CREATE VIEW grader_ast5 AS
	select username, assignment_id, avg(mark) as avg_mark
	from grader_ast4
	group by (username, assignment_id)
	having count(group_id) >= 10;
	
-- View for grader with ast_id, mark and date
CREATE VIEW grader_ast6 AS
	select username, assignment_id, avg_mark, due_date
	from grader_ast5 natural join all_assignment
	order by due_date ASC;

-- View for grader not with increasing mark
CREATE VIEW not_fatigue AS
	select distinct username
	from grader_ast6 g2
	where exists (
		select *
		from grader_ast6
		where
			username = g2.username AND
			due_date < g2.due_date AND
			avg_mark > g2.avg_mark);
			
CREATE VIEW 


-- View for earlist ast mark
CREATE VIEW AS grader_ast_first AS
	select username, avg_mark as first_mark
	from grader_ast6
	where due_date = min(due_date);

-- View for latest ast mark
CREATE VIEW AS grader_ast_latest AS
	select username, avg_mark as last_mark
	from grader_ast6
	where due_date = max(due_date);
	
-- View for grader with mark_change_first_last
CREATE VIEW AS grader_mark_change AS
	select username, first_ma







-- Final answer.
INSERT INTO q2 
	-- put a final query here so that its results will go into the table.
