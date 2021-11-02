<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Iterator" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> </title>
</head>
<body>
<%!
	int Gpay, Gcode;
	String Gtitle, msg;
	Connection CN;
	Statement ST;
	PreparedStatement PST;
	ResultSet RS;
	
	
%>

<%
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		CN = DriverManager.getConnection(url, "system", "1234");
		ST = CN.createStatement();
		System.out.println("DB서버 연결35");
	} catch (Exception e) { 
		System.out.println("DB서버 연결 실패 "+ e.toString());
	}
%>
</body>
</html>