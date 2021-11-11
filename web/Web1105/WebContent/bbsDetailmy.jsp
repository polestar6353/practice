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
<p></p>
<%
  //bbsDetail.jsp단독실행금지 
  int data = Integer.parseInt(request.getParameter("idx"));
  String hitmsg = "update bbs set hit=hit+1 where sabun="+data;
  ST=CN.createStatement();
  RS=ST.executeQuery(hitmsg);
  msg = "select * from bbs where sabun="+data;
  ST=CN.createStatement();
  RS=ST.executeQuery(msg);
  if(RS.next()){
	  Bsabun=RS.getInt("sabun");
	  Bname=RS.getString("name");
	  Btitle=RS.getString("title");
	  Bhit=RS.getInt("hit");
	  
  }
%>	    
	
<table border="1" width="900"  cellspacing="0" cellpadding="20px">
   <tr align="center">
   	 <td colspan="2">
   	 	<font style="font-size:26pt;color:blue; font-weight:bold;"> bbsDetail.jsp 상세페이지 </font> 
   	  </td>
   </tr>
  	<tr>
  		<td width="250"  rowspan="4" align="center" >
  		  <img src="images/bbb.gif" width="350" height="200"> 
  		</td> 
  		<td> 사번:  <%= Bsabun %>  </td>
  	</tr> 	
  	<tr>
  	   <td> 이름: <%= Bname %>  </td>
  	</tr>
  	<tr>
  	   <td> 제목: <%= Btitle %>  </td>
  	</tr>
   	<tr>  
  	   <td> 조회수: <%= Bhit %>  </td>
  	</tr>
  	
  	<tr align="center">
  	   <td colspan="2"> 
  	   	    <a href="login.jsp">[login]</a>
  			<a href="bbsWrite.jsp">[bbs등록]</a>
			<a href="bbsList.jsp?pageNum=1">[bbs전체출력]</a>
			<a href="testList.jsp">[testList]</a>  	   
		</td>
  	</tr>
 </table>

</body>
</html>




















