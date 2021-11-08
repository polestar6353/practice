<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<%@ page import="net.bitcamp.guest.GuestDAO" %>
<%@ page import="net.bitcamp.guest.GuestDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>guestDeleteSave.jsp</title>
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
 </style>
</head>
<body>

<!-- guestDeleteSave.jsp단독실행하면 에러발생 -->
<div align="center">
	<h2>guestDeleteSave.jsp</h2>
	<img src="images/tulips.png" width=500 height=300>
	<p>
	<a href="guestWrite.jsp">[방명록등록]</a>
	<a href="guestList.jsp">[전체출력]</a>
</div>

<%
 String ob = (String)session.getAttribute("naver");
 System.out.println("11-08-monday 세션값 확인 = " + ob); 
 if(ob == null  || ob.equals("") || ob ==""){
%>	
  <script type="text/javascript">
    alert("인증된 유저가 아닙니다\n삭제권한이 없습니다 다시 로그인 하세요");
    location.href="login.jsp";
  </script>
<%	 
 }else{
	 GuestDAO mydao = new GuestDAO();
	 int data = Integer.parseInt(request.getParameter("idx"));
	 mydao.dbDelete(data);
	 response.sendRedirect("guestList.jsp");
 }
%>
</body>
</html>















