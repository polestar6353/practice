<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <title>  </title>
 
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
 </style>
</head>
<body>
   <h1>gugudan.jsp</h1>
   
   <%
	 int dan = 12 ;
	 for(int i=1; i<10; i++){
	     //System.out.println(dan+"*"+i+"="+(dan*i));
	     out.println(dan+"*"+i+"="+(dan*i) +"<br>");
	 }
   %>
   <p>
   <%
       Date dt = new Date();
   	   ArrayList<String>  alist = new ArrayList<String>();
   	   out.println("date : " + dt.toLocaleString()); // 웹화면 
   	   System.out.println("date : " + dt.toLocaleString()); //자바의콘솔 고전적인방법
   %>
   	<p>
	<a href="gugudan.jsp">[gugudan]</a>
	<a href="guestWrite.jsp">[guestWrite]</a>
</body>
</html>