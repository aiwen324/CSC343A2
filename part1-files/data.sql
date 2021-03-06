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
INSERT INTO MarkusUser VALUES ('t1', 'tln1', 'tfn1', 'TA');
--Extra data for User
INSERT INTO MarkusUser VALUES ('s1', 's1n1', 'sfn1', 'student');
INSERT INTO MarkusUser VALUES ('s2', 's2n2', 'sfn2', 'student');
INSERT INTO MarkusUser VALUES ('s3', 's3n3', 'sfn3', 'student');
INSERT INTO MarkusUser VALUES ('s4', 's4n4', 'sfn4', 'student');
INSERT INTO MarkusUser VALUES ('s5', 's5n5', 'sfn5', 'student');
INSERT INTO MarkusUser VALUES ('s6', 's6n6', 'sfn6', 'student');
INSERT INTO MarkusUser VALUES ('s7', 's7n7', 'sfn7', 'student');
INSERT INTO MarkusUser VALUES ('s8', 's8n8', 'sfn8', 'student');
INSERT INTO MarkusUser VALUES ('s9', 's9n9', 'sfn9', 'student');
INSERT INTO MarkusUser VALUES ('s10', 's10n10', 'sfn10', 'student');
INSERT INTO MarkusUser VALUES ('s11', 's11n11', 'sfn11', 'student');
INSERT INTO MarkusUser VALUES ('s12', 's12n12', 'sfn12', 'student');
INSERT INTO MarkusUser VALUES ('s13', 's13n13', 'sfn13', 'student');
INSERT INTO MarkusUser VALUES ('s14', 's14n14', 'sfn14', 'student');
INSERT INTO MarkusUser VALUES ('s15', 's15n15', 'sfn15', 'student');
INSERT INTO MarkusUser VALUES ('s16', 's16n16', 'sfn16', 'student');
INSERT INTO MarkusUser VALUES ('s17', 's17n17', 'sfn17', 'student');
INSERT INTO MarkusUser VALUES ('s18', 's18n18', 'sfn18', 'student');
INSERT INTO MarkusUser VALUES ('s19', 's19n19', 'sfn19', 'student');


INSERT INTO Assignment VALUES (1000, 'A1', '2017-02-10 20:00', 1, 2);
INSERT INTO Assignment VALUES (1001, 'a2', '2017-02-01 20:00', 1, 2);
INSERT INTO Assignment VALUES (1002, 'a3', '2017-02-02 20:00', 1, 2);
INSERT INTO Assignment VALUES (1003, 'a4', '2017-02-03 20:00', 1, 2);
INSERT INTO Assignment VALUES (1004, 'a5', '2017-02-04 20:00', 1, 2);
INSERT INTO Assignment VALUES (1005, 'a6', '2017-02-05 20:00', 1, 2);
INSERT INTO Assignment VALUES (1006, 'a7', '2017-02-06 20:00', 1, 2);
INSERT INTO Assignment VALUES (1007, 'a8', '2017-02-07 20:00', 1, 2);
INSERT INTO Assignment VALUES (1008, 'a9', '2017-02-08 20:00', 1, 2);
INSERT INTO Assignment VALUES (1009, 'a10', '2017-02-09 20:00', 1, 2);


INSERT INTO Required VALUES (1000, 'A1.pdf');

-- Extra data for AssignmentGroup
INSERT INTO AssignmentGroup VALUES (2001, 1000, 'repo_url0');
INSERT INTO AssignmentGroup VALUES (2002, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2003, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2004, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2005, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2006, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2007, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2008, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2009, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2010, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2011, 1001, 'repo_url1');
INSERT INTO AssignmentGroup VALUES (2012, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2013, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2014, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2015, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2016, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2017, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2018, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2019, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2020, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2021, 1002, 'repo_url2');
INSERT INTO AssignmentGroup VALUES (2022, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2023, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2024, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2025, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2026, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2027, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2028, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2029, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2030, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2031, 1003, 'repo_url3');
INSERT INTO AssignmentGroup VALUES (2032, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2033, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2034, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2035, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2036, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2037, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2038, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2039, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2040, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2041, 1004, 'repo_url4');
INSERT INTO AssignmentGroup VALUES (2042, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2043, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2044, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2045, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2046, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2047, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2048, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2049, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2050, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2051, 1005, 'repo_url5');
INSERT INTO AssignmentGroup VALUES (2052, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2053, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2054, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2055, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2056, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2057, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2058, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2059, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2060, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2061, 1006, 'repo_url6');
INSERT INTO AssignmentGroup VALUES (2062, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2063, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2064, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2065, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2066, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2067, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2068, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2069, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2070, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2071, 1007, 'repo_url7');
INSERT INTO AssignmentGroup VALUES (2072, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2073, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2074, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2075, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2076, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2077, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2078, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2079, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2080, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2081, 1008, 'repo_url8');
INSERT INTO AssignmentGroup VALUES (2082, 1009, 'repo_url9');
INSERT INTO AssignmentGroup VALUES (2084, 1009, 'repo_url9');
INSERT INTO AssignmentGroup VALUES (2086, 1009, 'repo_url9');


--Extra data for Membership
INSERT INTO Membership VALUES ('s1', 2001);
INSERT INTO Membership VALUES ('s1', 2002);
INSERT INTO Membership VALUES ('s11', 2002);
INSERT INTO Membership VALUES ('s2', 2003);
INSERT INTO Membership VALUES ('s3', 2004);
INSERT INTO Membership VALUES ('s13', 2004);
INSERT INTO Membership VALUES ('s4', 2005);
INSERT INTO Membership VALUES ('s5', 2006);
INSERT INTO Membership VALUES ('s15', 2006);
INSERT INTO Membership VALUES ('s6', 2007);
INSERT INTO Membership VALUES ('s7', 2008);
INSERT INTO Membership VALUES ('s17', 2008);
INSERT INTO Membership VALUES ('s8', 2009);
INSERT INTO Membership VALUES ('s9', 2010);
INSERT INTO Membership VALUES ('s19', 2010);
INSERT INTO Membership VALUES ('s10', 2011);
INSERT INTO Membership VALUES ('s1', 2012);
INSERT INTO Membership VALUES ('s11', 2012);
INSERT INTO Membership VALUES ('s2', 2013);
INSERT INTO Membership VALUES ('s3', 2014);
INSERT INTO Membership VALUES ('s13', 2014);
INSERT INTO Membership VALUES ('s4', 2015);
INSERT INTO Membership VALUES ('s5', 2016);
INSERT INTO Membership VALUES ('s15', 2016);
INSERT INTO Membership VALUES ('s6', 2017);
INSERT INTO Membership VALUES ('s7', 2018);
INSERT INTO Membership VALUES ('s17', 2018);
INSERT INTO Membership VALUES ('s8', 2019);
INSERT INTO Membership VALUES ('s9', 2020);
INSERT INTO Membership VALUES ('s19', 2020);
INSERT INTO Membership VALUES ('s10', 2021);
INSERT INTO Membership VALUES ('s1', 2022);
INSERT INTO Membership VALUES ('s11', 2022);
INSERT INTO Membership VALUES ('s2', 2023);
INSERT INTO Membership VALUES ('s3', 2024);
INSERT INTO Membership VALUES ('s13', 2024);
INSERT INTO Membership VALUES ('s4', 2025);
INSERT INTO Membership VALUES ('s5', 2026);
INSERT INTO Membership VALUES ('s15', 2026);
INSERT INTO Membership VALUES ('s6', 2027);
INSERT INTO Membership VALUES ('s7', 2028);
INSERT INTO Membership VALUES ('s17', 2028);
INSERT INTO Membership VALUES ('s8', 2029);
INSERT INTO Membership VALUES ('s9', 2030);
INSERT INTO Membership VALUES ('s19', 2030);
INSERT INTO Membership VALUES ('s10', 2031);
INSERT INTO Membership VALUES ('s1', 2032);
INSERT INTO Membership VALUES ('s11', 2032);
INSERT INTO Membership VALUES ('s2', 2033);
INSERT INTO Membership VALUES ('s3', 2034);
INSERT INTO Membership VALUES ('s13', 2034);
INSERT INTO Membership VALUES ('s4', 2035);
INSERT INTO Membership VALUES ('s5', 2036);
INSERT INTO Membership VALUES ('s15', 2036);
INSERT INTO Membership VALUES ('s6', 2037);
INSERT INTO Membership VALUES ('s7', 2038);
INSERT INTO Membership VALUES ('s17', 2038);
INSERT INTO Membership VALUES ('s8', 2039);
INSERT INTO Membership VALUES ('s9', 2040);
INSERT INTO Membership VALUES ('s19', 2040);
INSERT INTO Membership VALUES ('s10', 2041);
INSERT INTO Membership VALUES ('s1', 2042);
INSERT INTO Membership VALUES ('s11', 2042);
INSERT INTO Membership VALUES ('s2', 2043);
INSERT INTO Membership VALUES ('s3', 2044);
INSERT INTO Membership VALUES ('s13', 2044);
INSERT INTO Membership VALUES ('s4', 2045);
INSERT INTO Membership VALUES ('s5', 2046);
INSERT INTO Membership VALUES ('s15', 2046);
INSERT INTO Membership VALUES ('s6', 2047);
INSERT INTO Membership VALUES ('s7', 2048);
INSERT INTO Membership VALUES ('s17', 2048);
INSERT INTO Membership VALUES ('s8', 2049);
INSERT INTO Membership VALUES ('s9', 2050);
INSERT INTO Membership VALUES ('s19', 2050);
INSERT INTO Membership VALUES ('s10', 2051);
INSERT INTO Membership VALUES ('s1', 2052);
INSERT INTO Membership VALUES ('s11', 2052);
INSERT INTO Membership VALUES ('s2', 2053);
INSERT INTO Membership VALUES ('s3', 2054);
INSERT INTO Membership VALUES ('s13', 2054);
INSERT INTO Membership VALUES ('s4', 2055);
INSERT INTO Membership VALUES ('s5', 2056);
INSERT INTO Membership VALUES ('s15', 2056);
INSERT INTO Membership VALUES ('s6', 2057);
INSERT INTO Membership VALUES ('s7', 2058);
INSERT INTO Membership VALUES ('s17', 2058);
INSERT INTO Membership VALUES ('s8', 2059);
INSERT INTO Membership VALUES ('s9', 2060);
INSERT INTO Membership VALUES ('s19', 2060);
INSERT INTO Membership VALUES ('s10', 2061);
INSERT INTO Membership VALUES ('s1', 2062);
INSERT INTO Membership VALUES ('s11', 2062);
INSERT INTO Membership VALUES ('s2', 2063);
INSERT INTO Membership VALUES ('s3', 2064);
INSERT INTO Membership VALUES ('s13', 2064);
INSERT INTO Membership VALUES ('s4', 2065);
INSERT INTO Membership VALUES ('s5', 2066);
INSERT INTO Membership VALUES ('s15', 2066);
INSERT INTO Membership VALUES ('s6', 2067);
INSERT INTO Membership VALUES ('s7', 2068);
INSERT INTO Membership VALUES ('s17', 2068);
INSERT INTO Membership VALUES ('s8', 2069);
INSERT INTO Membership VALUES ('s9', 2070);
INSERT INTO Membership VALUES ('s19', 2070);
INSERT INTO Membership VALUES ('s10', 2071);
INSERT INTO Membership VALUES ('s1', 2072);
INSERT INTO Membership VALUES ('s11', 2072);
INSERT INTO Membership VALUES ('s2', 2073);
INSERT INTO Membership VALUES ('s3', 2074);
INSERT INTO Membership VALUES ('s13', 2074);
INSERT INTO Membership VALUES ('s4', 2075);
INSERT INTO Membership VALUES ('s5', 2076);
INSERT INTO Membership VALUES ('s15', 2076);
INSERT INTO Membership VALUES ('s6', 2077);
INSERT INTO Membership VALUES ('s7', 2078);
INSERT INTO Membership VALUES ('s17', 2078);
INSERT INTO Membership VALUES ('s8', 2079);
INSERT INTO Membership VALUES ('s9', 2080);
INSERT INTO Membership VALUES ('s19', 2080);
INSERT INTO Membership VALUES ('s10', 2081);
INSERT INTO Membership VALUES ('s1', 2082);
INSERT INTO Membership VALUES ('s2', 2082);
INSERT INTO Membership VALUES ('s3', 2084);
INSERT INTO Membership VALUES ('s4', 2084);
INSERT INTO Membership VALUES ('s5', 2086);
INSERT INTO Membership VALUES ('s6', 2086);

INSERT INTO Submissions VALUES (3000, 'A1.pdf', 's1', 2001, '2017-02-08 19:59');

--Extra data for Grader
INSERT INTO Grader VALUES (2001, 't1');
INSERT INTO Grader VALUES (2002, 't1');
INSERT INTO Grader VALUES (2003, 't1');
INSERT INTO Grader VALUES (2004, 't1');
INSERT INTO Grader VALUES (2005, 't1');
INSERT INTO Grader VALUES (2006, 't1');
INSERT INTO Grader VALUES (2007, 't1');
INSERT INTO Grader VALUES (2008, 't1');
INSERT INTO Grader VALUES (2009, 't1');
INSERT INTO Grader VALUES (2010, 't1');
INSERT INTO Grader VALUES (2011, 't1');
INSERT INTO Grader VALUES (2012, 't1');
INSERT INTO Grader VALUES (2013, 't1');
INSERT INTO Grader VALUES (2014, 't1');
INSERT INTO Grader VALUES (2015, 't1');
INSERT INTO Grader VALUES (2016, 't1');
INSERT INTO Grader VALUES (2017, 't1');
INSERT INTO Grader VALUES (2018, 't1');
INSERT INTO Grader VALUES (2019, 't1');
INSERT INTO Grader VALUES (2020, 't1');
INSERT INTO Grader VALUES (2021, 't1');
INSERT INTO Grader VALUES (2022, 't1');
INSERT INTO Grader VALUES (2023, 't1');
INSERT INTO Grader VALUES (2024, 't1');
INSERT INTO Grader VALUES (2025, 't1');
INSERT INTO Grader VALUES (2026, 't1');
INSERT INTO Grader VALUES (2027, 't1');
INSERT INTO Grader VALUES (2028, 't1');
INSERT INTO Grader VALUES (2029, 't1');
INSERT INTO Grader VALUES (2030, 't1');
INSERT INTO Grader VALUES (2031, 't1');
INSERT INTO Grader VALUES (2032, 't1');
INSERT INTO Grader VALUES (2033, 't1');
INSERT INTO Grader VALUES (2034, 't1');
INSERT INTO Grader VALUES (2035, 't1');
INSERT INTO Grader VALUES (2036, 't1');
INSERT INTO Grader VALUES (2037, 't1');
INSERT INTO Grader VALUES (2038, 't1');
INSERT INTO Grader VALUES (2039, 't1');
INSERT INTO Grader VALUES (2040, 't1');
INSERT INTO Grader VALUES (2041, 't1');
INSERT INTO Grader VALUES (2042, 't1');
INSERT INTO Grader VALUES (2043, 't1');
INSERT INTO Grader VALUES (2044, 't1');
INSERT INTO Grader VALUES (2045, 't1');
INSERT INTO Grader VALUES (2046, 't1');
INSERT INTO Grader VALUES (2047, 't1');
INSERT INTO Grader VALUES (2048, 't1');
INSERT INTO Grader VALUES (2049, 't1');
INSERT INTO Grader VALUES (2050, 't1');
INSERT INTO Grader VALUES (2051, 't1');
INSERT INTO Grader VALUES (2052, 't1');
INSERT INTO Grader VALUES (2053, 't1');
INSERT INTO Grader VALUES (2054, 't1');
INSERT INTO Grader VALUES (2055, 't1');
INSERT INTO Grader VALUES (2056, 't1');
INSERT INTO Grader VALUES (2057, 't1');
INSERT INTO Grader VALUES (2058, 't1');
INSERT INTO Grader VALUES (2059, 't1');
INSERT INTO Grader VALUES (2060, 't1');
INSERT INTO Grader VALUES (2061, 't1');
INSERT INTO Grader VALUES (2062, 't1');
INSERT INTO Grader VALUES (2063, 't1');
INSERT INTO Grader VALUES (2064, 't1');
INSERT INTO Grader VALUES (2065, 't1');
INSERT INTO Grader VALUES (2066, 't1');
INSERT INTO Grader VALUES (2067, 't1');
INSERT INTO Grader VALUES (2068, 't1');
INSERT INTO Grader VALUES (2069, 't1');
INSERT INTO Grader VALUES (2070, 't1');
INSERT INTO Grader VALUES (2071, 't1');
INSERT INTO Grader VALUES (2072, 't1');
INSERT INTO Grader VALUES (2073, 't1');
INSERT INTO Grader VALUES (2074, 't1');
INSERT INTO Grader VALUES (2075, 't1');
INSERT INTO Grader VALUES (2076, 't1');
INSERT INTO Grader VALUES (2077, 't1');
INSERT INTO Grader VALUES (2078, 't1');
INSERT INTO Grader VALUES (2079, 't1');
INSERT INTO Grader VALUES (2080, 't1');
INSERT INTO Grader VALUES (2081, 't1');
INSERT INTO Grader VALUES (2082, 't1');
INSERT INTO Grader VALUES (2084, 't1');
INSERT INTO Grader VALUES (2086, 't1');

INSERT INTO RubricItem VALUES (4000, 1000, 'style', 4, 0.25);
INSERT INTO RubricItem VALUES (4001, 1000, 'tester', 12, 0.75);
INSERT INTO RubricItem VALUES (4002, 1001, 'style', 4, 0.25);
INSERT INTO RubricItem VALUES (4003, 1001, 'tester', 12, 0.75);
INSERT INTO RubricItem VALUES (4004, 1002, 'style', 4, 0.25);
INSERT INTO RubricItem VALUES (4005, 1002, 'tester', 12, 0.75);
INSERT INTO RubricItem VALUES (4006, 1003, 'style', 4, 0.25);
INSERT INTO RubricItem VALUES (4007, 1003, 'tester', 12, 0.75);
INSERT INTO RubricItem VALUES (4008, 1004, 'style', 4, 0.25);
INSERT INTO RubricItem VALUES (4009, 1004, 'tester', 12, 0.75);
INSERT INTO RubricItem VALUES (4010, 1005, 'style', 4, 0.25);
INSERT INTO RubricItem VALUES (4011, 1005, 'tester', 12, 0.75);
INSERT INTO RubricItem VALUES (4012, 1006, 'style', 4, 0.25);
INSERT INTO RubricItem VALUES (4013, 1006, 'tester', 12, 0.75);
INSERT INTO RubricItem VALUES (4014, 1007, 'style', 4, 0.25);
INSERT INTO RubricItem VALUES (4015, 1007, 'tester', 12, 0.75);
INSERT INTO RubricItem VALUES (4016, 1008, 'style', 4, 0.25);
INSERT INTO RubricItem VALUES (4017, 1008, 'tester', 12, 0.75);
INSERT INTO RubricItem VALUES (4018, 1009, 'style', 4, 0.25);
INSERT INTO RubricItem VALUES (4019, 1009, 'tester', 12, 0.75);

INSERT INTO Grade VALUES (2001, 4000, 3);
INSERT INTO Grade VALUES (2001, 4001, 9);

--Extra data for Result
INSERT INTO Result VALUES (2001, 6, true);
INSERT INTO Result VALUES (2002, 2, true);
INSERT INTO Result VALUES (2003, 3, true);
INSERT INTO Result VALUES (2004, 4, true);
INSERT INTO Result VALUES (2005, 5, true);
INSERT INTO Result VALUES (2006, 6, true);
INSERT INTO Result VALUES (2007, 7, true);
INSERT INTO Result VALUES (2008, 8, true);
INSERT INTO Result VALUES (2009, 9, true);
INSERT INTO Result VALUES (2010, 0, true);
INSERT INTO Result VALUES (2011, 1, true);
INSERT INTO Result VALUES (2012, 2, true);
INSERT INTO Result VALUES (2013, 3, true);
INSERT INTO Result VALUES (2014, 4, true);
INSERT INTO Result VALUES (2015, 5, true);
INSERT INTO Result VALUES (2016, 6, true);
INSERT INTO Result VALUES (2017, 7, true);
INSERT INTO Result VALUES (2018, 8, true);
INSERT INTO Result VALUES (2019, 9, true);
INSERT INTO Result VALUES (2020, 0, true);
INSERT INTO Result VALUES (2021, 1, true);
INSERT INTO Result VALUES (2022, 2, true);
INSERT INTO Result VALUES (2023, 3, true);
INSERT INTO Result VALUES (2024, 4, true);
INSERT INTO Result VALUES (2025, 5, true);
INSERT INTO Result VALUES (2026, 6, true);
INSERT INTO Result VALUES (2027, 7, true);
INSERT INTO Result VALUES (2028, 8, true);
INSERT INTO Result VALUES (2029, 9, true);
INSERT INTO Result VALUES (2030, 0, true);
INSERT INTO Result VALUES (2031, 1, true);
INSERT INTO Result VALUES (2032, 2, true);
INSERT INTO Result VALUES (2033, 3, true);
INSERT INTO Result VALUES (2034, 4, true);
INSERT INTO Result VALUES (2035, 5, true);
INSERT INTO Result VALUES (2036, 6, true);
INSERT INTO Result VALUES (2037, 7, true);
INSERT INTO Result VALUES (2038, 8, true);
INSERT INTO Result VALUES (2039, 9, true);
INSERT INTO Result VALUES (2040, 0, true);
INSERT INTO Result VALUES (2041, 1, true);
INSERT INTO Result VALUES (2042, 2, true);
INSERT INTO Result VALUES (2043, 3, true);
INSERT INTO Result VALUES (2044, 4, true);
INSERT INTO Result VALUES (2045, 5, true);
INSERT INTO Result VALUES (2046, 6, true);
INSERT INTO Result VALUES (2047, 7, true);
INSERT INTO Result VALUES (2048, 8, true);
INSERT INTO Result VALUES (2049, 9, true);
INSERT INTO Result VALUES (2050, 0, true);
INSERT INTO Result VALUES (2051, 1, true);
INSERT INTO Result VALUES (2052, 2, true);
INSERT INTO Result VALUES (2053, 3, true);
INSERT INTO Result VALUES (2054, 4, true);
INSERT INTO Result VALUES (2055, 5, true);
INSERT INTO Result VALUES (2056, 6, true);
INSERT INTO Result VALUES (2057, 7, true);
INSERT INTO Result VALUES (2058, 8, true);
INSERT INTO Result VALUES (2059, 9, true);
INSERT INTO Result VALUES (2060, 0, true);
INSERT INTO Result VALUES (2061, 1, true);
INSERT INTO Result VALUES (2062, 2, true);
INSERT INTO Result VALUES (2063, 3, true);
INSERT INTO Result VALUES (2064, 4, true);
INSERT INTO Result VALUES (2065, 5, true);
INSERT INTO Result VALUES (2066, 6, true);
INSERT INTO Result VALUES (2067, 7, true);
INSERT INTO Result VALUES (2068, 8, true);
INSERT INTO Result VALUES (2069, 9, true);
INSERT INTO Result VALUES (2070, 0, true);
INSERT INTO Result VALUES (2071, 1, true);
INSERT INTO Result VALUES (2072, 2, true);
INSERT INTO Result VALUES (2073, 3, true);
INSERT INTO Result VALUES (2074, 4, true);
INSERT INTO Result VALUES (2075, 5, true);
INSERT INTO Result VALUES (2076, 6, true);
INSERT INTO Result VALUES (2077, 7, true);
INSERT INTO Result VALUES (2078, 8, true);
INSERT INTO Result VALUES (2079, 9, true);
INSERT INTO Result VALUES (2080, 0, true);
INSERT INTO Result VALUES (2081, 1, true);
INSERT INTO Result VALUES (2082, 6, true);
INSERT INTO Result VALUES (2084, 7, true);
INSERT INTO Result VALUES (2086, 8, true);
