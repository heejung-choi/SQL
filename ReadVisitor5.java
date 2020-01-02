package jdbcsrc;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
public class ReadVisitor5 {
	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		String sql = "select name, to_char(writedate, 'yyyy\"��\" mm\"��\" dd\"��\"') writedate, memo from"+
		                                 " visitor"; 
		try (	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "jdbctest", "jdbctest");
				Statement stmt = conn.createStatement();			
				ResultSet rs = stmt.executeQuery(sql);) {	
			if(rs.next() ) {				
				do {
					System.out.print(rs.getString("name")+"\t");
					System.out.print(rs.getString("writedate")+"\t");
					System.out.println(rs.getString("memo"));
				} while (rs.next());
			} else {
				System.out.println("����� ���� ����!!");
			}			
		} catch (Exception e) {
			System.err.println("���� �߻� : " + e);
		} 
	}
}
