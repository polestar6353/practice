<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>guestListCopy.jsp</title>
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none;  font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
 </style>
</head>

<body>
<h2>guestListCopy.jsp복사본</h2>	
<%
try{
	msg = "select count(*) as cnt from guest ";
	ST = CN.createStatement(); 
    RS = ST.executeQuery(msg);
    if(RS.next()==true){Gtotal = RS.getInt("cnt"); }
}catch(Exception ex){ }
%>

<table border="1" width="900" cellspacing="0" cellpadding="5px">
<tr>
   <td colspan=4 align="right">
        <a href="#">[로그인]</a>
        <a href="guestWrite.jsp">[방명록등록]</a>
   		총레코드갯수: <%= Gtotal %> &nbsp; &nbsp;
   </td>
</tr>
<tr bgcolor="pink">
	<td>code</td> <td>제목</td>  <td>급여</td>  <td>메일주소</td>  
</tr>	
<%
try{
	msg = "select * from guest order by code ";
	ST = CN.createStatement(); 
    RS = ST.executeQuery(msg);
    while(RS.next()==true){
    	Gcode = RS.getInt("code");
    	Gtitle = RS.getString("title");
    	Gpay = RS.getInt("pay");
    	Gemail = RS.getString("email");	
%>    	
  <tr>
    <td> <%= Gcode %> </td>
    <td> <a href="guestDetail.jsp?idx=<%= Gcode %>"> <%= Gtitle %> </a> </td>
    <td> <%= Gpay %> </td>
    <td> <%= Gemail %> </td>
  </tr>  
<%    	
    }//while end
}catch(Exception ex){ System.out.println("전체출력에러 11월03일 " + ex.toString());}
%>	
</table>
		
	<p>
	<a href="gugudan.jsp">[gugudan]</a>
	<a href="guestWrite.jsp">[방명록등록]</a>
	<a href="guestListCopy.jsp">[guestListCopy]</a>
</body>
</html>








