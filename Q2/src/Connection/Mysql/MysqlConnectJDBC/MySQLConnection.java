package Connection.Mysql.MysqlConnectJDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySQLConnection {
public static Connection GetMySQLConnection() {
		
		Connection conn=null;
		
		try{
			 String jdbcDriver = "jdbc:mysql://localhost:3306/mysql?useUnicode=true&characterEncoding=utf8&verifyServerCertificate=false&useSSL=false&serverTimezone=UTC";
			 String dbUser = "root";
			 String dbPass = "1234";
			 System.out.println("잘옴");
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 
			 System.out.println("클래스찾음");
			 conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			 System.out.println("연결됨");
			 
			 
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버가 없음");
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("사용자 계정 혹은 비번 불일치");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static void close(Connection conn) {
		try{if(conn!=null) {conn.close();}}catch(Exception e) {e.printStackTrace();}
	}
	
	public static void close(Statement stmt) {
		try{if(stmt!=null) {stmt.close();}}catch(Exception e) {e.printStackTrace();}
	}
	
	public static void close(PreparedStatement pstmt) {
		try{if(pstmt!=null) {pstmt.close();}}catch(Exception e) {e.printStackTrace();}
	}
	
	public static void close(ResultSet rs) {
		try{if(rs!=null) {rs.close();}}catch(Exception e) {e.printStackTrace();}
	}
}
