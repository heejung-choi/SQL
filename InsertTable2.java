package jdbcsrc;

import java.sql.*;

public class InsertTable2 {
	public static void main(String args[]) throws Exception {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "jdbctest", "jdbctest");
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("INSERT into product values"+
						"('"+args[0]+"', '"+args[1]+"', '"+args[2]+"',"+
					          args[3]+","+ args[4]+")");
			System.out.println("�����͵��� �߰��Ͽ����ϴ�.");
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println("���� �߻� : " + e);
		}
	}
}
