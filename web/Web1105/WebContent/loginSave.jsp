<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="./ssi.jsp" %>

<html>
<head><title> [loginSave.jsp] </title></head>
<body>		
<%
  
  String usera=request.getParameter("userid");
  String userb=request.getParameter("pwd");
  msg="select count(*) as cnt from login where userid=? and pwd=? ";
  System.out.println( "loginSave.jsp msg = " + msg);
  PST=CN.prepareStatement(msg); //Statement명령어 아닙니다
  	PST.setString(1, usera);
  	PST.setString(2, userb);
  RS=PST.executeQuery(); 
  if(RS.next()==true){ Gtotal=RS.getInt("cnt"); }
		  
  if(Gtotal>0){
   	 //jsp에서 쿠키는 내장클래스, 쿠키등록 response
  	 session.setAttribute("naver", usera); //세션   
  	 
  	 Cookie ck = new Cookie("google", usera); //쿠키  
  	 response.addCookie(ck); //쿠키추가등록
  	 System.out.println("login처리 성공 세션값 , 쿠키값 설정 성공");
  	 response.sendRedirect("index.jsp?idx="+usera);
  %>
   <font size=7 color=blue>
     <b><%= usera %>님 로그인 성공!!!</b> <br>
   </font><p>
	<img src="images/bt_login.gif" width=450 height=70><p>
	<img src="images/bar.gif" width=450 >
 <%  
  }else{
  	 out.println("<font size=7 color=red><b></b>"+usera+"님 로그인실패</font><br>");
     out.println("<font size=7><a href='login.jsp'>[로그인]</a></font>");
     out.println("<font size=7><a href='guestList.jsp'>[guestList]</a></font><br>"); 
 %> 	
  	<img src="images/tulips.png" width=450 ><p>
  	 <script type="text/javascript">
        setTimeout("location.href='login.jsp'", 3000); //3초후에 login.jsp
    </script>
<% } %>
	
	
</body>
</html>





