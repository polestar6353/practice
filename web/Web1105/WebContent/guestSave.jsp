<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="net.bitcamp.guest.GuestDAO" %>
<%@ page import="net.bitcamp.guest.GuestDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title></title>
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
 </style>
</head>
<body>

<!-- guestSave.jsp단독실행하면 에러발생 -->
<h2>guestSave.jsp</h2>
<%
try{
	int dcode =  Integer.parseInt(request.getParameter("code"));
	String dtitle =  request.getParameter("title");
	int dpay =  Integer.parseInt(request.getParameter("pay"));
	String demail =  request.getParameter("email");
 
  GuestDAO  mydao = new GuestDAO();
  mydao.dbInsert(dcode, dtitle, dpay, demail);
  response.sendRedirect("guestList.jsp"); 
}catch(Exception ex){  }
%>

</body>
</html>




