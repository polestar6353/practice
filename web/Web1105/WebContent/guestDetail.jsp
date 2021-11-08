<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<%@ page import="net.bitcamp.guest.GuestDAO" %>
<%@ page import="net.bitcamp.guest.GuestDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title> guestList.jsp </title>
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
 </style>
</head>
<body>
<p></p>
<%
  //guestDetail.jsp단독실행금지 
  int data = Integer.parseInt(request.getParameter("idx"));
  
  GuestDAO mydao = new GuestDAO();
  GuestDTO  dto = mydao.dbDetail(data);
  int Gcode = dto.getCode();
  String Gtitle = dto.getTitle();
  int Gpay = dto.getPay() ;
  String Gemail = dto.getEmail();
%>	    
	
<table border="1" width="900"  cellspacing="0" cellpadding="20px">
   <tr align="center">
   	 <td colspan="2">
   	 	<font style="font-size:26pt;color:blue; font-weight:bold;"> guestDetail.jsp 상세페이지 </font> 
   	  </td>
   </tr>
  	<tr>
  		<td width="250"  rowspan="4" align="center" >
  		  <img src="images/bbb.gif" width="350" height="200"> 
  		</td> 
  		<td> 코드:  <%= Gcode %>  </td>
  	</tr> 	
  	<tr>
  	   <td> 제목: <%= Gtitle %>  </td>
  	</tr>
  	<tr>
  	   <td> 급여: <%= Gpay %>  </td>
  	</tr>
   	<tr>  
  	   <td> 메일: <%= Gemail %>  </td>
  	</tr>
  	
  	<tr align="center">
  	   <td colspan="2"> 
  	   	    <a href="login.jsp">[login]</a>
  			<a href="guestList.jsp">[guestList]</a>
  			<a href="guestDeleteSave.jsp?idx=<%= Gcode %>">[삭제]</a>
  			<a href="guestWrite.jsp">[등록화면]</a>
  			 <a href="guestEdit.jsp?code=<%= Gcode %>&title=<%=Gtitle%>&pay=<%=Gpay%>&email=<%=Gemail%>">[수정]</a>
  	   </td>
  	</tr>
 </table>

</body>
</html>




















