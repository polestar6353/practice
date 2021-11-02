<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> </title>
<style>
.link{
	text-align: center;
}
</style>
</head>
<body>
	<img src="images/bar.gif"><br>
	<img src="images/bar.gif"><br>
	<img src="images/bar.gif"><br>
	
	<%
		//단독실행시 에러 발생.
		//web에서 데이터를 넘기면 무조건 문자열로 인식

		out.println("<h2>guestSave.jsp</h2>");
	try{
		String Gtitle =request.getParameter("title");
		Gpay = Integer.parseInt(request.getParameter("pay"));
		Gcode = Integer.parseInt(request.getParameter("code"));
		
		out.println("넘어온 제목 = " +Gtitle+"<br>");
		out.println("넘어온 금액 = " +Gpay+"<br>");
		
		msg = "insert into guest values(?,?,?)";
		PST = CN.prepareStatement(msg);
		PST.setInt(1,Gcode);
		PST.setString(2,Gtitle);
		PST.setInt(3,Gpay);
		System.out.println("안녕");
		int OK=PST.executeUpdate();
		if(OK>0){
			System.out.println("성공적으로 저장");
		}
		
		
	}catch(Exception ex){
		System.out.println("저장에러"+ex);
		}
	%>
	넘어온 코드 = <%=Gcode %>
	

	<p>
	<div class="link">
	<a href="gugudan.jsp">[gugudan]</a> 
	<a href="guestWrite.jsp">[방명록등록]</a> 
	<a href="list.jsp">[확인]</a>
	</div>
</body>
</html>