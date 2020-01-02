package jdbcsrc;

import java.sql.*;

public class InsertTable3 {
	public static void main(String args[]) throws Exception {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "jdbctest", "jdbctest");
			PreparedStatement pstmt = conn.prepareStatement(
					     "INSERT into product values (?,?,?,?,?)");
			pstmt.setString(1, args[0]);
			pstmt.setString(2, args[1]);
			pstmt.setString(3, args[2]);
			pstmt.setInt(4, Integer.parseInt(args[3]));
			pstmt.setFloat(5, Float.parseFloat(args[4]));
			pstmt.executeUpdate();
			System.out.println("데이터들을 추가하였습니다.");
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println("오류 발생 : " + e);
		}
	}
}
