<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title> openID.jsp </title>
  
   <style type="text/css">
     *{font-size:16pt;}
     a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
     a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
   
    <script type="text/javascript">
      function  first(){
    	open_form.userid.focus();  
      }//first end
    </script>
</head>
<body bgcolor="yellow" onload="first();">
    <%
      String data = request.getParameter("idx");
      System.out.println("openID.jsp문서" );
      System.out.println("넘어온code = " + data);
    %>
    <p>
	<img src="images/bar.gif" width=400><br>
		<form  name="open_form"  action="openIDSave.jsp">
		   userid: <input type="text" name="userid" value="<%= data %>">
		   <input type="submit" value="중복처리"> 
		</form>
	<img src="images/bar.gif" width=400><br>
</body>
</html>






