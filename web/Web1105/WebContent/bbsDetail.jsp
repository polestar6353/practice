<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %><%@ page import="net.bitcamp.guest.GuestDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title> guestDetail.jsp </title>
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
 </style>
</head>
<body>
	
<table border="1" width="900"  cellspacing="0" cellpadding="20px">

  	<tr>
  		<td width="250"  rowspan="4" align="center" >
  		  <img src="images/bbb.gif" width="350" height="200"> 
  		</td> 
  		<td> 사번:  ${detail.sabun}  </td>
  	</tr> 	
  	<tr>
  	   <td> 제목: ${detail.title}  </td>
  	</tr>
  	<tr>
  	   <td> 급여: ${detail.pay}  </td>
  	</tr>
   	<tr>  
  	   <td> 메일: ${detail.email}  </td>
  	</tr>
  	
  	<tr align="center">
  	   <td colspan="2"> 
  	   	    <a href="login.jsp">[login]</a>
  			<a href="bbsInsert.bit">[bbs등록]</a>
		    <a href="bbsSelect.bit">[bbs전체출력]</a>
			<a href="index.jsp">[index]</a>  	   
		</td>
  	</tr>
 </table>
 
  <p>
  <jsp:include page="bbsReply.jsp">
  	<jsp:param value="${detail.sabun}" name="Ridx"/>
  </jsp:include> 
</body>
</html>




















