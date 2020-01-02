package jdbcsrc;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;

public class ConnectDB {
	public static void main(String[] args) throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection(
				                  "jdbc:oracle:thin:@localhost:1521:XE",
				                  "jdbctest", "jdbctest");
		System.out.println(conn.getClass().getName());
		DatabaseMetaData mdata = conn.getMetaData();
		System.out.println(mdata.getClass().getName());
		System.out.println("���ӵ� DB ���� : "+
		                        mdata.getDatabaseProductName());
		conn.close();
	}
}
