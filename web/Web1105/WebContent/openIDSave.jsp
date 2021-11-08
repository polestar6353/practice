<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>  
<%@ include file="ssi.jsp" %>       

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [openIDSave.jsp] </title>
  <style type="text/css">
	*{ font-size: 26pt; }
	a{ font-size: 26pt; color:green; text-decoration:none; }
	a:hover{ font-size:30pt; color:blue; text-decoration:underline; }
  </style>
	
	<script type="text/javascript">
	</script>
</head>
<body bgcolor="yellow">

  <div align="center"> 
   <img src="images/bar.gif" width="350"> <br>
   <img src="images/bar.gif" width="350"> <br>
  </div> 
  
<%
  String data = request.getParameter("userid");
  System.out.println("openIDSave.jsp문서" );
  System.out.println("넘어온userid = " + data);
  
  msg ="select count(*) as cnt from guest where code = " + data;
  ST = CN.createStatement();
  RS = ST.executeQuery(msg);
  if(RS.next()==true){
	Gtotal = RS.getInt("cnt");  
  }
  
  if(Gtotal>0){
	System.out.println(data +" 사용중인 코드=아이디입니다");
%>
  <script type="text/javascript">
      alert("<%=data%> 코드데이터는 사용중 코드아이디입니다\n다시 아이디코드 데이터를 입력하세요");
      location.href="openID.jsp?idx="+"" ;
  </script>		
<%	
  }else{
	System.out.println(data +" 사용가능한 코드=아이디입니다");
%>
  <script type="text/javascript">
 	alert("<%=data%> 코드데이터는 사용가능한 코드아이디입니다");
 	opener.myform.code.value="<%=data %>" ;
 	opener.myform.title.focus();
 	self.close();
  </script>	
<% } %>
</body>
</html>









