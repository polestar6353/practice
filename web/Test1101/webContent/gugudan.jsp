<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> </title>
<style type = "text/css">
	*{ font-size:20pt;}
	.link{
	text-align: center;
}
</style>
</head>
<body>
	<h1>gugudan.jsp</h1>
	
	<%
	int dan = 7;
	for(int i=1; i<10; i++){
		out.println(dan+"*"+i+"="+(dan*i)+"<br>");
	}
	 %>
	<p>
	<%
		Date dt = new Date();
		ArrayList<String> alist = new ArrayList<String>();
		out.println("오늘날짜 : "+dt.toLocaleString()); //웹 화면
		System.out.println("오늘날짜 : "+dt.toLocaleString()); //자바의 콘솔
	%>
	<p>
	<div class="link">
	<a href="gugudan.jsp">[gugudan]</a> 
	<a href="guestWrite.jsp">[방명록등록]</a> 
	<a href="list.jsp">[확인]</a>
	</div>
</body>
</html>