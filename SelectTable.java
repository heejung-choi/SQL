package jdbcsrc;

import java.sql.*; 
public class SelectTable { 
	public static void main (String args []) throws Exception { 
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "jdbctest", "jdbctest");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * from product");
		while (rs.next()) {		
			System.out.print(rs.getString(1) + "   ");
			System.out.print(rs.getString(2) + "   ");
			System.out.print(rs.getString(3) + "   ");
			System.out.print(rs.getInt(4) + "   ");
			System.out.println(rs.getFloat(5));	
			System.out.print(rs.getString("id") + "   ");
			System.out.print(rs.getString("classid") + "   ");
			System.out.print(rs.getString("name") + "   ");
			System.out.print(rs.getInt("balance") + "   ");
			System.out.println(rs.getFloat("price"));	
		}
		rs.close();
		stmt.close();
		conn.close();
         }
}
