package jdbcsrc;

import java.sql.*;
import java.io.*;
class BlobRead {
	public static void main(String args[]) throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "jdbctest", "jdbctest");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery
				("select imgcontent ic from imgtest "
						+ "where name ='totoro.png'");
		if (rset.next()) {
			Blob blob = rset.getBlob("ic");
			System.out.println(blob.length());
			InputStream is = blob.getBinaryStream();
			FileOutputStream fo = 
					new FileOutputStream("c:/iotest/totoro2.png");
			int c = 0;
			while ((c = is.read()) != -1)
				fo.write(c);
			if (fo != null) fo.close();
			if (is != null) is.close();
			Runtime.getRuntime().exec
			("C:/Program Files (x86)/Google/Chrome/Application"
					+ "/chrome.exe c:/iotest/totoro2.png");
		} else {
			System.out.println("추출된 데이터가 없습니다!!");
		}
		if (rset != null) rset.close();
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
	}
}
