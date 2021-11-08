<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<%@ page import="net.bitcamp.guest.GuestDAO" %>
<%@ page import="net.bitcamp.guest.GuestDTO" %>
<%@ page import="java.util.ArrayList" %>

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
<%
  GuestDAO  mydao = new GuestDAO();
  int Gtotal = mydao.dbCountAll();
%>

<table border="1" width="900" cellspacing="0" cellpadding="5px">
<tr>
   <td colspan=4 align="right">
        <a href="login.jsp">[로그인]</a>
        <a href="guestWrite.jsp">[방명록등록]</a>
   		총레코드갯수: <%= Gtotal %> &nbsp; &nbsp;
   </td>
</tr>
<tr bgcolor="yellow">
	<td>code</td> <td>제목</td>  <td>급여</td>  <td>메일주소</td>  
</tr>	
<%
   ArrayList<GuestDTO> LG = mydao.dbSelectAll();
   /*for(int i=0 ; i<LG.size(); i++) {
	   GuestDTO dto = (GuestDTO)LG.get(i); 
	   int Gcode = dto.getCode();
	   String Gtitle = dto.getTitle();*/
	   
  for(GuestDTO dto : LG){
	 int Gcode = dto.getCode();
	 String Gtitle = dto.getTitle();  	   
%>    	
  <tr>
    <td> <%= Gcode %> </td>
    <td> <a href="guestDetail.jsp?idx=<%=Gcode%>"> <%= Gtitle %> </a> </td>
    <td> <%= dto.getPay() %> </td>
    <td> <%= dto.getEmail() %> </td>
  </tr>  
<%  
   }//for end 
%>	
</table>
		
	<p>
	<a href="gugudan.jsp">[gugudan]</a>
	<a href="guestWrite.jsp">[방명록등록]</a>
	<a href="guestList.jsp">[전체출력]</a>
</body>
</html>








