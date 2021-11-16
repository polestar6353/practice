<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>guestList.jsp</title>
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none;  font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
 </style>
</head>

<body>
<h2>guestList.jsp전체출력</h2>

<table border="1" width="900" cellspacing="0" cellpadding="5px">
<tr>
   <td colspan=4 align="right">
        <a href="guestList">[guestList서블릿]</a>
        <a href="guestWrite.jsp">[방명록등록]</a>
   		총레코드갯수: ${Gtotal} &nbsp; &nbsp;
   </td>
</tr>
<tr bgcolor="yellow">
	<td>code</td> <td>제목</td>  <td>급여</td>  <td>메일주소</td>  
</tr>	

<c:catch>
 <c:forEach var="bean" items="${LG}">   	
	<tr>
	   <td> ${bean.code} </td>
	   <td> <a href="gDetail.camp?idx=${bean.code}"> ${bean.title} </a> </td>
	   <td> ${bean.pay} </td>
	   <td> ${bean.email} </td>
	</tr>
  </c:forEach>  
</c:catch>
</table>
		
	<p>
	<a href="guestWrite.jsp">[방명록등록]</a>
	<a href="guestList">[guestList서블릿]</a>
</body>
</html>








