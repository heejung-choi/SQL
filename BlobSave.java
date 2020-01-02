package jdbcsrc;

import java.sql.*;
import java.io.*;
public class BlobSave {
	public static void main(String args[]) throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "jdbctest", "jdbctest");
		File file = new File("c:/iotest/totoro.png");
		InputStream is = new FileInputStream(file);
		PreparedStatement pstmt = conn.prepareStatement
		   ("insert into imgtest values (?, ?)");
		pstmt.setString(1, "totoro.png");
		pstmt.setBinaryStream(2, is, file.length());
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		System.out.println("저장 성공!!");
	}
}





