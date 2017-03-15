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
DROP VIEW IF EXISTS all_assignment CASCADE;
DROP VIEW IF EXISTS grader_ast CASCADE;
DROP VIEW IF EXISTS total_grade CASCADE;

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
	select username, group_id, assignment_id,
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
	group by username, assignment_id
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

-- View for fatigue graders
CREATE VIEW fatigue AS
	select distinct username
	from grader_ast6
	except 
	select username
	from not_fatigue;
	
-- View for fatigue graders with marks and ids
CREATE VIEW grader_ast7 AS
	select username, assignment_id, avg_mark, due_date
	from grader_ast6
	where username in
	(select username from fatigue);


-- View for fatigue graders earlist ast mark
CREATE VIEW grader_ast_first AS
	select g1.username, g1.avg_mark as first_mark
	from grader_ast7 g1 join (select username, min(due_date) as due_date
						   from grader_ast7
						   group by username) g2
	on g1.username = g2.username and g1.due_date = g2.due_date;

-- View for fatigue graders latest ast mark
CREATE VIEW grader_ast_latest AS
	select g1.username, g1.avg_mark as last_mark
	from grader_ast7 g1 join (select username, max(due_date) as due_date
						   from grader_ast7
						   group by username) g2
	on g1.username = g2.username and g1.due_date = g2.due_date;
	
-- View for fatigue grader with mark_change_first_last
CREATE VIEW grader_mark_change AS
	select username, first_mark - last_mark as mark_change_first_last
	from grader_ast_first natural join grader_ast_latest;
	
-- View for grader with avg_mark on all ast
CREATE VIEW grader_mark_avg AS
	select username, avg(avg_mark) as average_mark_all_assignments
	from grader_ast7
	group by username;

-- View for grader with names
CREATE VIEW grader_name AS
	select username, surname, firstname
	from fatigue natural join MarkusUser;
	
-- View for final results
CREATE VIEW final_result AS
	select firstname||' '||surname as ta_name,
	average_mark_all_assignments, mark_change_first_last
	from grader_name natural join grader_mark_avg
	natural join grader_mark_change;



-- Final answer.
INSERT INTO q2 (select * from final_result);
	-- put a final query here so that its results will go into the table.
