-- Inseparable

SET SEARCH_PATH TO markus;
DROP TABLE IF EXISTS q9;

-- You must not change this table definition.
CREATE TABLE q9 (
	student1 varchar(25),
	student2 varchar(25)
);

-- You may find it convenient to do this for each of the views
-- that define your intermediate steps.  (But give them better names!)
DROP VIEW IF EXISTS Ast_member CASCADE;

-- Define views for your intermediate steps here.
CREATE VIEW Ast_member AS
	select assignment_id, group_max, group_id, num_mem, username
	from Assignment natural join Membership natural join 
	(select group_id, count(username) as num_mem
	 from Membership group by group_id) m9;

-- View for students have soloed in unnecessary solo work
CREATE VIEW have_soloed AS
	select distinct username
	from Ast_member
	where num_mem = 1 and group_max <> 1;

-- View for students haven't soloed with astid and gid for non solo group
CREATE VIEW never_solo_ast AS
	select distinct username, group_id
	from Ast_member
	where username not in (select username from have_soloed)
		  and num_mem > 1;

-- View for never solo students member ship
CREATE VIEW nosolo_Membership AS
	select username, group_id
	from never_solo_ast natural join Membership;

-- View for cross join for 2 Membership
CREATE VIEW Membership_pair AS
	select m1.group_id, m1.username as student1, m2.username as student2
	from nosolo_Membership m1, nosolo_Membership m2
	where m1.group_id = m2.group_id
	and m1.username < m2.username;

-- View for total ast pair of students do
CREATE VIEW pair_work_num AS
	select count(group_id) as num_work_pair, student1, student2
	from Membership_pair
	group by student1, student2;

-- VIEW FOR each non solo student, 
-- have the total number of non solo group they are in
CREATE VIEW nosolo_groupnum AS
	select username, count(group_id) as total_num_group
	from nosolo_Membership
	group by username;

-- Join pair_work_num and nosolo_groupnum
CREATE VIEW pair_with_groupnum AS
	select student1, student2, num_work_pair, total_num_group as total_num_group1
	from pair_work_num p1 join nosolo_groupnum n1
	on p1.student1 = n1.username;

-- Join above with nosolo_groupnum again
CREATE VIEW pair_with_groupnum2 AS
	select student1, student2, num_work_pair, total_num_group1, 
	total_num_group as total_num_group2
	from pair_with_groupnum p2 join nosolo_groupnum n2
	on p2.student2 = n2.username;

-- Find the final result
CREATE VIEW final_result AS
	select student1, student2
	from pair_with_groupnum2
	where num_work_pair = total_num_group1
	and num_work_pair = total_num_group2;









-- Final answer.
INSERT INTO q9 (select * from final_result);
	-- put a final query here so that its results will go into the table.
