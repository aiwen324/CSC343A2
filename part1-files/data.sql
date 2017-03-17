-- If there is already any data in these tables, empty it out.

TRUNCATE TABLE Result CASCADE;
TRUNCATE TABLE Grade CASCADE;
TRUNCATE TABLE RubricItem CASCADE;
TRUNCATE TABLE Grader CASCADE;
TRUNCATE TABLE Submissions CASCADE;
TRUNCATE TABLE Membership CASCADE;
TRUNCATE TABLE AssignmentGroup CASCADE;
TRUNCATE TABLE Required CASCADE;
TRUNCATE TABLE Assignment CASCADE;
TRUNCATE TABLE MarkusUser CASCADE;


-- Now insert data from scratch.

INSERT INTO MarkusUser VALUES ('i1', 'iln1', 'ifn1', 'instructor');
INSERT INTO MarkusUser VALUES ('s1', 'sln1', 'sfn1', 'student');
INSERT INTO MarkusUser VALUES ('s2', 'sln2', 'sfn2', 'student');
INSERT INTO MarkusUser VALUES ('t1', 'tln1', 'tfn1', 'TA');

INSERT INTO Assignment VALUES (1000, 'a1', '2017-02-08 20:00', 1, 2);
INSERT INTO Assignment VALUES (1001, 'a1', '2017-02-01 20:00', 1, 2);
INSERT INTO Assignment VALUES (1002, 'a2', '2017-02-02 20:00', 1, 2);
INSERT INTO Assignment VALUES (1003, 'a3', '2017-02-03 20:00', 1, 2);
INSERT INTO Assignment VALUES (1004, 'a4', '2017-02-04 20:00', 1, 2);
INSERT INTO Assignment VALUES (1005, 'a5', '2017-02-05 20:00', 1, 2);
INSERT INTO Assignment VALUES (1006, 'a6', '2017-02-06 20:00', 1, 2);
INSERT INTO Assignment VALUES (1007, 'a7', '2017-02-07 20:00', 1, 5);
INSERT INTO Assignment VALUES (1008, 'a8', '2017-02-08 20:00', 1, 4);
INSERT INTO Assignment VALUES (1009, 'a9', '2017-02-09 20:00', 1, 3);


INSERT INTO Required VALUES (1000, 'A1.pdf');

-- Extra data for AssignmentGroup
INSERT INTO AssignmentGroup VALUES (2000, 1000, 'repo_url0');
INSERT INTO AssignmentGroup VALUES (2001, 1000, 'repo_url0');
INSERT INTO AssignmentGroup VALUES (2002, 1000, 'repo_url0');
INSERT INTO AssignmentGroup VALUES (2003, 1000, 'repo_url0');
INSERT INTO AssignmentGroup VALUES (2004, 1000, 'repo_url0');
INSERT INTO AssignmentGroup VALUES (2005, 1000, 'repo_url0');
INSERT INTO AssignmentGroup VALUES (2006, 1000, 'repo_url0');
INSERT INTO AssignmentGroup VALUES (2007, 1000, 'repo_url0');
INSERT INTO AssignmentGroup VALUES (2008, 1000, 'repo_url0');
INSERT INTO AssignmentGroup VALUES (2009, 1000, 'repo_url0');
INSERT INTO AssignmentGroup VALUES (2000, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2001, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2002, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2003, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2004, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2005, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2006, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2007, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2008, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2009, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2000, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2001, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2002, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2003, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2004, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2005, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2006, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2007, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2008, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2009, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2000, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2001, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2002, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2003, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2004, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2005, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2006, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2007, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2008, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2009, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2000, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2001, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2002, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2003, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2004, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2005, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2006, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2007, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2008, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2009, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2000, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2001, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2002, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2003, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2004, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2005, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2006, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2007, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2008, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2009, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2000, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2001, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2002, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2003, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2004, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2005, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2006, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2007, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2008, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2009, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2000, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2001, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2002, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2003, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2004, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2005, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2006, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2007, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2008, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2009, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2000, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2001, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2002, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2003, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2004, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2005, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2006, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2007, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2008, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2009, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2000, 1009, 'repo_url9');
INSERT INTO AssignmentGroup VALUES (2001, 1009, 'repo_url9');
INSERT INTO AssignmentGroup VALUES (2002, 1009, 'repo_url9');
INSERT INTO AssignmentGroup VALUES (2003, 1009, 'repo_url9');
INSERT INTO AssignmentGroup VALUES (2004, 1009, 'repo_url9');
INSERT INTO AssignmentGroup VALUES (2005, 1009, 'repo_url9');
INSERT INTO AssignmentGroup VALUES (2006, 1009, 'repo_url9');
INSERT INTO AssignmentGroup VALUES (2007, 1009, 'repo_url9');
INSERT INTO AssignmentGroup VALUES (2008, 1009, 'repo_url9');
INSERT INTO AssignmentGroup VALUES (2009, 1009, 'repo_url9');



--Extra data for Membership
INSERT INTO Membership VALUES ('s1', 1000);
INSERT INTO Membership VALUES ('s2', 1000);
INSERT INTO Membership VALUES ('s1', 1001);
INSERT INTO Membership VALUES ('s1', 1002);
INSERT INTO Membership VALUES ('s2', 1002);
INSERT INTO Membership VALUES ('s1', 1003);
INSERT INTO Membership VALUES ('s1', 1004);
INSERT INTO Membership VALUES ('s2', 1004);
INSERT INTO Membership VALUES ('s1', 1005);
INSERT INTO Membership VALUES ('s1', 1006);
INSERT INTO Membership VALUES ('s2', 1006);
INSERT INTO Membership VALUES ('s1', 1007);
INSERT INTO Membership VALUES ('s1', 1008);
INSERT INTO Membership VALUES ('s2', 1008);
INSERT INTO Membership VALUES ('s1', 1009);

INSERT INTO Submissions VALUES (3000, 'A1.pdf', 's1', 2000, '2017-02-08 19:59');

INSERT INTO Grader VALUES (2000, 't1');
INSERT INTO Grader VALUES (3000, 't1');
INSERT INTO Grader VALUES (4000, 't1');
INSERT INTO Grader VALUES (5000, 't1');
INSERT INTO Grader VALUES (6000, 't1');
INSERT INTO Grader VALUES (7000, 't1');
INSERT INTO Grader VALUES (8000, 't1');
INSERT INTO Grader VALUES (9000, 't1');
INSERT INTO Grader VALUES (10000, 't1');
INSERT INTO Grader VALUES (11000, 't1');

INSERT INTO RubricItem VALUES (4000, 1000, 'style', 4, 0.25);
INSERT INTO RubricItem VALUES (4001, 1000, 'tester', 12, 0.75);

INSERT INTO Grade VALUES (2000, 4000, 3);
INSERT INTO Grade VALUES (2000, 4001, 9);

INSERT INTO Result VALUES (2000, 12, true);
INSERT INTO Result VALUES (3000, 12, true);
INSERT INTO Result VALUES (4000, 12, true);
INSERT INTO Result VALUES (5000, 12, true);
INSERT INTO Result VALUES (6000, 12, true);
INSERT INTO Result VALUES (7000, 12, true);
INSERT INTO Result VALUES (8000, 12, true);
INSERT INTO Result VALUES (9000, 12, true);
INSERT INTO Result VALUES (10000, 12, true);
INSERT INTO Result VALUES (11000, 12, true);
