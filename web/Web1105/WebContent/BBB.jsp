<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>BBB</title>
  
   <style type="text/css">
     *{font-size:16pt;}
     a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
     a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
   
   <script type="text/javascript">
   </script>
</head>
<body>
	<h2> BBB.jsp=데이터받는입장 </h2>
	<img src="images/aaa.gif"> <img src="images/aaa.gif">
	<img src="images/aaa.gif"> <img src="images/aaa.gif"> 
	<img src="images/aaa.gif"> <p>
	<%
	   //BBB.jsp문서=guestDetail.jsp문서
		String a=request.getParameter("idx");
	    out.println("넘어온 code = " + a + "<br>");
	%>
	    <br>
		넘어온코드 = <%= a %> <br>
	<p></p>
	<a href="AAA.jsp">[AAA]</a>
	<a href="guestList.jsp">[guestList]</a>
	<a href="guestWrite.jsp">[guestWrite]</a>
</body>
</html>






