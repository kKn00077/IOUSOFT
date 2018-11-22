<%@page import="java.sql.PreparedStatement"%>
<%@page import="Connection.Mysql.MysqlConnectJDBC.MySQLConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>링크 저장</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	
	String name=request.getParameter("name");
	String url=request.getParameter("url");
	
	Connection conn=null;
	conn=MySQLConnection.GetMySQLConnection();
	
	String sql="insert into bookmark (name, url) values(?, ?)";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	
	pstmt.setString(1, name);
	pstmt.setString(2, url);
	
	pstmt.executeUpdate();
	
	MySQLConnection.close(conn);
	MySQLConnection.close(pstmt);

	
%>

<script>
parent.document.location.reload();
</script>

</body>
</html>