<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> zoompigSave.jsp </title>

 <style type="text/css">
   *{ font-size: 16pt; }
   a{ font-size: 16pt; text-decoration: none; }
   a:hover{ font-size: 20pt; text-decoration: underline; }
 </style>
 
 <script type="text/javascript">
 </script>
 
</head>
<body>
  <h2> zoompigSave.jsp </h2> <hr>
  <%
  	//zoompigSave.jsp문서
     String[] hy=request.getParameterValues("hobby"); 
	 for(String data:hy){
	    out.println("<img src=images/"+data+".png width=200 height=150>");
  	 }
  %>
  
  
  <p>
  <a href="zoompig.jsp">[zoompig등록]</a>
  <a href="guestWrite.jsp">[guestWrite]</a>
</body>
</html>






