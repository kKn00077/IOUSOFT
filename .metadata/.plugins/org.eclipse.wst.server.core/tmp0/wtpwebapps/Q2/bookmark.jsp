<%@page import="Connection.Mysql.MysqlConnectJDBC.MySQLConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>북마크 사이트</title>
<link rel= "stylesheet" type="text/css" href="but.css">
<style>
	body{
		margin:0;
		padding:0;
	}

	#my-iframe{
		display:block;
		border:none;
		border-left:2px solid lightblue;
		height:90vh;
		margin-top:20px;
		margin-bottom:20px;
	}
	
	table{
		width:100%;
	}
	
	
	table tr td{
		text-align:center;
		padding:0;
		margin:0;
	}
	
	ul{
		padding:0;
		margin:auto;
		width:80%;
	}
	
	li{
		margin:10px;
	}
</style>

</head>
<body>

<table>
<tr>

<td>
<ul>

<%



Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
conn=MySQLConnection.GetMySQLConnection();

request.setCharacterEncoding("utf-8");

String sql="select * from bookmark";
pstmt=conn.prepareStatement(sql);

rs=pstmt.executeQuery();


while(rs.next()){
	int num=rs.getInt(1);
	String getName=rs.getString(2);
	String getURL=rs.getString(3);
	%>
	
	<li><a href="<%=getURL%>" target="view"><%=getName%></a> [<a href="delete.jsp?num=<%=num%>" style="color:black" target="view">삭제</a>]</li>
<%
}

MySQLConnection.close(conn);
MySQLConnection.close(pstmt);
MySQLConnection.close(rs);
%>

</ul>

<br><br><a href="add.jsp" id="add_but" style="width:80%; margin:auto;" target="view">추가</a>

</td>

<td style="width:80%;">
<iframe id="my-iframe" name="view" style="width:100%;" scrolling="yes"/>
</td>

</tr>

</table>

</body>
</html>