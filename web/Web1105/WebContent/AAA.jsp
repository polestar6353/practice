<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>AAA</title>
  
   <style type="text/css">
     *{font-size:16pt;}
     a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
     a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
   
   <script type="text/javascript">
   </script>
</head>
<body>
	<img src="images/a1.png"><p>
	Web1105플젝 a태그으로 값 전달 테스트 <br>
	Web1105플젝 a태그으로 값 전달 테스트 <br>
	<%
	    //AAA.jsp문서=guestList.jsp문서
		int Gcode = 5567 ;
		String Gtitle = "bitcamp" ;
	%>
	<a href="BBB.jsp?idx=<%=Gcode%>">[BBB]</a>
	<a href="guestList.jsp">[guestList]</a>
</body>
</html>














