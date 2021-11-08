<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="net.bitcamp.guest.GuestDAO" %>
<%@ page import="net.bitcamp.guest.GuestDTO" %>
<%@ page import="net.bitcamp.guest.GuestSQL" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title></title>
  
   <style type="text/css">
     *{font-size:16pt;}
     a{font-size:16pt; text-decoration:none;  font-family: Comic Sans MS ; }
     a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
   
   <script type="text/javascript">
   </script>
</head>
<body>
	<%!
       //자바클래스의 non-static메소드접근을 위해서 객체생성
       GuestDTO dto = new GuestDTO();
       GuestDAO dao = new GuestDAO();
       GuestSQL sql = new GuestSQL();
	%>
</body>
</html>









