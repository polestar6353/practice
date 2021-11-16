<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>index.jsp</title>
  
   <style type="text/css">
     #pline{ margin-top:70px; }
   </style>
   
   <script type="text/javascript">
     setTimeout("location.href='bbsWrite.jsp'", 3000);
   </script>
</head>
<body>
<%
String data ="";
data=request.getParameter("idx");
String display="";
Cookie[] ck = request.getCookies();
if(ck != null){
	for(int i=0; i<ck.length; i++){
	   System. out.print("bit501쿠키 "+ ck[i].getName() + ":" + ck[i].getValue());
	   if(data.equals(ck[i].getValue())){
	      display = ck[i].getValue();
	   }
	}
}
%>

	<p id="pline">
	<div align="center">
		<video width="600" autoplay muted loop  controls>
	  	  <source src="images/scuba.mp4" type="video/mp4"></source>
	  	</video>

	    <br>
	  	<font color="green" size=6> 
	  	  <b> Waiting...Loading... </b> <br>
	  	  <b> <%= data %>고객님!!! 대환영합니다  </b>
	  	</font> <br>	
	</div>
</body>
</html>














