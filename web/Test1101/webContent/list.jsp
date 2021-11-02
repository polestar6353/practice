<%@page import="javax.naming.StringRefAddr"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="./ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

	<%
		ArrayList arr = new ArrayList();
		msg="select * from guest";
		PST=CN.prepareStatement(msg);
		RS=PST.executeQuery();
		while(RS.next()){
			arr.add(RS.getInt("code"));
			arr.add(RS.getString("title"));
			arr.add(RS.getInt("pay"));
		}
	%>

<style>

table{
	text-align: center;
}
img { display: block; margin: 0px auto; }
.link{
	text-align: center;
}
</style>


<title> </title>
</head>
<body>
	
	<%
	for(int i=0;i<arr.size();i++){
		System.out.println(arr.get(i));
		}
	
	%>

<img src="images/1.jpg">

<p>

<table border='1' width=300 height=500 align="center">
	<tr>
	<td>번호</td>
	<td>코드</td>
	<td>타이틀</td>
	<td>페이</td>
	</tr>
	<%for(int i=0;i<arr.size()/3;i++){ %>
		<tr>
			<td><%=i+1 %></td>
			
			<%for(int j=0;j<3;j++){ %>
				<td><%=arr.get(i*3+j)%></td>
			<%} %>
		</tr>
		<%} %>
</table>
	
	<p>
	<div class="link">
	<a href="gugudan.jsp">[gugudan]</a> 
	<a href="guestWrite.jsp">[방명록등록]</a> 
	<a href="list.jsp">[확인]</a>
	</div>
</body>
</html>