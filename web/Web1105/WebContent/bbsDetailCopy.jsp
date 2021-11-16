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

<%
//bbsDetail.jsp단독실행금지 
int data = Integer.parseInt(request.getParameter("idx"));
msg = "select * from bbs where sabun = " + data ;
ST = CN.createStatement();
RS = ST.executeQuery(msg);
if(RS.next()==true) {
  Gsabun = RS.getInt("sabun");
  Gname = RS.getString("name");
  Gtitle = RS.getString("title");
  Gwdate = RS.getDate("wdate");
  Ghit = RS.getInt("hit");
  Gemail = RS.getString("email");
}

msg = "update bbs set hit=hit +1 where  sabun = " + data;
ST.executeUpdate(msg);
//System.out.println("bbs테이블 조회수 1증가 성공") ;

%>	    
	
<table border="1" width="900"  cellspacing="0" cellpadding="20px">

  	<tr>
  		<td width="250"  rowspan="4" align="center" >
  		  <img src="images/bbb.gif" width="350" height="200"> 
  		</td> 
  		<td> 사번:  <%= Gsabun %>  </td>
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
  			<a href="bbsWrite.jsp">[bbs등록]</a>
		    <a href="bbsList.jsp">[bbs전체출력]</a>
			<a href="index.jsp">[index]</a>  	   
		</td>
  	</tr>
 </table>
 
  <p>
  <jsp:include page="bbsReply.jsp">
  	<jsp:param value="<%=Gsabun%>" name="Ridx"/>
  </jsp:include> 
</body>
</html>




















