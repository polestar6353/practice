<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>guestEdit.jsp</title>
  
<style>
    *{font-size:16pt;}
    a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
    a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; } }
    #email_ch{
       color: red;
       font-size: 14pt;
    }
</style>
</head>
<body>
<%
 dcode = Integer.parseInt(request.getParameter("code"));
 dtitle = request.getParameter("title");
 dpay = Integer.parseInt(request.getParameter("pay"));
 demail = request.getParameter("email");
%>
<h2> guestEdit.jsp=단독실행금지 </h2>
<form name="myform" method="get" action="guestEditSave.jsp">
    코드: <input type="text" name="code" value="<%=dcode%>" readonly>   <span></span> <br>    
    제목: <input type="text" name="title" value="<%=dtitle%>"> <span></span> <br>
    급여: <input type="text" name="pay" value="<%=dpay%>"> <span></span> <br>
    메일: <input type="text" name="email" id="email"  value="<%=demail%>"> <span id="email_ch"></span> <br>
    <input type="reset" value="수정취소">
    <input type="submit" value="서브밋수정">
</form>
	
<p>
<a href="gugudan.jsp">[gugudan]</a>
<a href="guestWrite.jsp">[방명록등록]</a>
<a href="guestList.jsp">[전체출력]</a>
</body>
</html>















