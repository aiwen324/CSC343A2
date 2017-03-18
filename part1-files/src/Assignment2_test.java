import java.sql.*;
import java.io.*;

// Remember that part of your mark is for doing as much in SQL (not Java) 
// as you can. At most you can justify using an array, or the more flexible
// ArrayList. Don't go crazy with it, though. You need it rarely if at all.
import java.util.ArrayList;

public class Assignment2_test {

    // A connection to the database
    Connection connection;

    Assignment2_test() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    /**
     * Connects to the database and sets the search path.
     * 
     * Establishes a connection to be used for this session, assigning it to the
     * instance variable 'connection'. In addition, sets the search path to
     * markus.
     * 
     * @param url
     *            the url for the database
     * @param username
     *            the username to be used to connect to the database
     * @param password
     *            the password to be used to connect to the database
     * @return true if connecting is successful, false otherwise
     */
    public boolean connectDB(String URL, String username, String password) {
        try {
        	System.out.println("At least come here");
        	connection = DriverManager.getConnection(URL, username, password);
        	System.out.println("Did not catch any error during getconnection");
            String qs = "set search_path to markus";
            PreparedStatement p = connection.prepareStatement(qs);
            p.execute();
            System.out.println("have been executed.");
        	return true;
        } catch (SQLException e){
        	return false;
        }
    }

    /**
     * Closes the database connection.
     * 
     * @return true if the closing was successful, false otherwise
     */
    public boolean disconnectDB() {
        try {
        	connection.close();
        	return true;
        } catch (SQLException e) {
        return false;
        }
    }

    /**
     * Assigns a grader for a group for an assignment.
     * 
     * Returns false if the groupID does not exist in the AssignmentGroup table,
     * if some grader has already been assigned to the group, or if grader is
     * not either a TA or instructor.
     * 
     * @param groupID
     *            id of the group
     * @param grader
     *            username of the grader
     * @return true if the operation was successful, false otherwise
     */
    public boolean assignGrader(int groupID, String grader) {
        // First, we check if the group_id is in the AssignmentGroup Table
    	String queryString = "select group_id from Assignment where group_id = ?";
    	try {
			PreparedStatement ps = connection.prepareStatement(queryString);
			ps.setInt(1, groupID);
			ResultSet rs = ps.executeQuery();
			if (rs.next()){
				// If group_id is in the assignment table, we will go to Grader table to find some more information
				// In the grader table, we will check if group_id is in the Grader table
				// 1 ---- if group_id is in the Grader table, we will check if its corresponding value is null
				// 2 ---- if group_id is not in the Grader table, we can just simply add it
				// But we check if that grader is really an instructor or TA
				queryString = "select username, type from MarKusUser where username = ?";
				ps = connection.prepareStatement(queryString);
				ps.setString(1, grader);
				rs = ps.executeQuery();
				if (rs.next()){
					// We will check if type of username is 'TA' or 'instructor'
					if (rs.getString("type").equals("student")){
						return false;
					}
					else {
						// This is the case that type of grader is a TA or instructor
						queryString = "select group_id, username from Grader where group_id = ?";
						ps = connection.prepareStatement(queryString);
						ps.setInt(1, groupID);
						rs = ps.executeQuery();
						if (rs.next()){
							// This is the case that groupID already in the Grader table, need to check
							// whether the corresponding username is null or has been assigned
							if (rs.getString("username") != null) {
								return false;
							}
							else {
								rs.updateString("username", grader);
								return true;
							}
							
						}
						else {
							// This case since groupID is not in the table and username type is qualified, 
							// We can just simply insert the data to table
							queryString = "insert into Grader values (?, ?)";
							ps = connection.prepareStatement(queryString);
							ps.setInt(1, groupID);
							ps.setString(2, grader);
							ps.execute();
                            return true;
						}
					}
				}
				else {
					// This is the case that username of grader is not in the MarkusUser table
					return false;
				}
			}
			else {
                // This is the case that group_id is not in the AssignmentGroup Table
				return false;
			}
		} catch (SQLException e) {
			return false;
		}
    }

    /**
     * Adds a member to a group for an assignment.
     * 
     * Records the fact that a new member is part of a group for an assignment.
     * Does nothing (but returns true) if the member is already declared to be
     * in the group.
     * 
     * Does nothing and returns false if any of these conditions hold: - the
     * group is already at capacity, - newMember is not a valid username or is
     * not a student, - there is no assignment with this assignment ID, or - the
     * group ID has not been declared for the assignment.
     * 
     * @param assignmentID
     *            id of the assignment
     * @param groupID
     *            id of the group to receive a new member
     * @param newMember
     *            username of the new member to be added to the group
     * @return true if the operation was successful, false otherwise
     */
    
	public boolean recordMember(int assignmentID, int groupID, String newMember) {
    	// FIrst we, check if the assignment exists
    	try {
    		String qs = "select group_max from Assignment where assignment_id = ?";
    		PreparedStatement p = connection.prepareStatement(qs);
    		p.setInt(1, assignmentID);
    		ResultSet rs = p.executeQuery();
    		if (rs.next()){
    			// Case that astid exists
    			int capacity = rs.getInt("group_max");
    			// Check if newMember is valid
    			qs = "select type from MarkusUser where username = ?";
    			p = connection.prepareStatement(qs);
    			p.setString(1, newMember);
    			rs = p.executeQuery();
    			if (rs.next()){
    				// Case that username of newMember exists, proceed to check if it's student
    				if (rs.getString("type").equals("student")) {
    					// Case that this newMember is a student
    					// Now let's check if the groupID has been assigned to that astid
    					qs = "select * from AssignmentGroup where group_id = ? and assignment_id = ?";
    					p = connection.prepareStatement(qs);
    					p.setInt(1, groupID);
    					p.setInt(2, assignmentID);
    					rs = p.executeQuery();
    					if (rs.next()){
    						// Case that groupID has been clared for this ast
    						// Proceed to finc if group_id is in Membership
    						// 1 --- groupID not exists, it's fine, we can generate new group for it
    						// 2 --- groupID exists, we need to check if it has reach the capacity
    						qs = "select group_id, count(username) as num_mem from Membership where group_id = ? group by group_id";
    						p = connection.prepareStatement(qs);
    						p.setInt(1, groupID);
    						rs = p.executeQuery();
    						if (rs.next()){
    							// Case that we find such groupID in the Member tabel
    							int num_mem = rs.getInt("num_mem");
								// But we still need to check if that newMember has already in that group
    							qs = "select group_id, username from Membership where group_id = ? and username = ?";
								p = connection.prepareStatement(qs);
								p.setInt(1, groupID);
								p.setString(2, newMember);
								rs = p.executeQuery();
								if (rs.next()) {
									// Case that newMember has been inserted into the groupID
									return true;
								}
								else {
									if (num_mem >= capacity) {
										// newMember is not in that group but reach limit
										return false;
									}
									else {
										// We will insert a new value to this table
										qs = "insert into Membership values (?, ?)";
										p = connection.prepareStatement(qs);
										p.setString(1, newMember);
										p.setInt(2, groupID);
										p.execute();
										return true;
									}
								}
    						}
    						else {
    							// Case that we find such groupID not in the Member table
    							qs = "insert into Membership values (?, ?)";
								p = connection.prepareStatement(qs);
								p.setString(1, newMember);
								p.setInt(2, groupID);
								p.execute();
								return true;
    						}
    					}
    					else {
    						// Case that groupID hasn't been 
    						return false;
    					}
    					
    				}
    				else {
    					// Case that this newMember is not a student
    					return false;
    				}
    			}
    			else {
    				// Case that username not exists
    				return false;
    			}
    			
    		}
    		else {
    			// This is the case that assignmentID does not exist
    			return false;
    		}
    	} catch (SQLException e) {
    		return false;
    	}
    }

    /**
     * Creates student groups for an assignment.
     * 
     * Finds all students who are defined in the Users table and puts each of
     * them into a group for the assignment. Suppose there are n. Each group
     * will be of the maximum size allowed for the assignment (call that k),
     * except for possibly one group of smaller size if n is not divisible by k.
     * Note that k may be as low as 1.
     * 
     * The choice of which students to put together is based on their grades on
     * another assignment, as recorded in table Results. Starting from the
     * highest grade on that other assignment, the top k students go into usernameone
     * group, then the next k students go into the next, and so on. The last n %
     * k students form a smaller group.
     * 
     * In the extreme case that there are no students, does nothing and returns
     * true.
     * 
     * Students with no grade recorded for the other assignment come at the
     * bottom of the list, after students who received zero. When there is a tie
     * for grade (or non-grade) on the other assignment, takes students in order
     * by username, using alphabetical order from A to Z.
     * 
     * When a group is created, its group ID is generated automatically because
     * the group_id attribute of table AssignmentGroup is of type SERIAL. The
     * value of attribute repo is repoPrefix + "/group_" + group_id
     * 
     * Does nothing and returns false if there is no assignment with ID
     * assignmentToGroup or no assignment with ID otherAssignment, or if any
     * group has already been defined for this assignment.
     * 
     * @param assignmentToGroup
     *            the assignment ID of the assignment for which groups are to be
     *            created
     * @param otherAssignment
     *            the assignment ID of the other assignment on which the
     *            grouping is to be based
     * @param repoPrefix
     *            the prefix of the URL for the group's repository
     * @return true if successful and false otherwise
     */
    public boolean createGroups(int assignmentToGroup, int otherAssignment,
            String repoPrefix) {
        // Replace this return statement with an implementation of this method!
        return false;
    }

    public static void main(String[] args) throws SQLException {
        Assignment2_test a2= new Assignment2_test();
        if (a2.connectDB("jdbc:postgresql://localhost:5432/csc343h-aiyifei", "aiyifei", "")) {
        	System.out.println("We are inside the block.");
        	boolean a = a2.recordMember(1000, 2001, "s2");
        	System.out.println(a);
        }
        a2.disconnectDB();
        System.out.println("Boo!");
    }
}
