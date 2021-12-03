package package_db;

import java.sql.*;

public class DriverTest{
	public static void main(String[] args){
		Connection con;

		try{
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/teatimecccdb", "root", "1234");
			System.out.println("Success");
		}
		catch(SQLException ex){ System.out.println("SQLException" + ex);}
		catch(Exception ex){ System.out.println("Exception:" + ex);}
	}
}