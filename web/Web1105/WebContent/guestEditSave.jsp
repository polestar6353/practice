<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>guestEditSave.jsp</title>
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
 </style>
</head>
<body>

<!-- guestEditSave.jsp단독실행하면 에러발생 -->
<%
try{
  dcode = Integer.parseInt(request.getParameter("code"));
  dtitle = request.getParameter("title");
  dpay = Integer.parseInt(request.getParameter("pay"));
  demail = request.getParameter("email");
  
  System.out.println("수정 코드 = " + dcode ); 
  System.out.println("수정 제목 = " + dtitle );
  System.out.println("수정 급여 = " + dpay );
  System.out.println("수정 메일 = " + demail );
  
  msg ="update  guest  set  title=?, pay=?, email=? where code = ?";
  PST = CN.prepareStatement(msg); //데이터없는상태에서 쿼리문문장을 미리서 해석...  
  	    PST.setString(1, dtitle);
  	    PST.setInt(2, dpay);
  	    PST.setString(3, demail);
  	    PST.setInt(4, dcode);
  int OK = PST.executeUpdate(); //진짜수
}catch(Exception ex){ 
	System.out.println("수정실패이유 : " + ex); //ex.toString()
	out.print("<h2>데이터수정작업 실패했습니다</h2>"); 
}
%>
	
<div align="center">
	<h2>guestEditSave.jsp</h2>
	<img src="images/tulips.png" width=500 height=300>
	<p>
	<% out.print("<h2>데이터수정작업 성공했습니다</h2>"); %>
	<a href="guestWrite.jsp">[방명록등록]</a>
	<a href="guestList.jsp">[전체출력]</a>
</div>


<script type="text/javascript">
   setTimeout("location.href='guestList.jsp'" , 1000); 
</script>	

</body>
</html>




