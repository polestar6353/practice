<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title></title>
   
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
	<h2> guestWrite.jsp </h2>
	<form name="myform" method="get" action="guestInsert.do">
	    코드: <input type="text" name="code"  >  <br>
	    제목: <input type="text" name="title" value="tea">  <br>
	    급여: <input type="text" name="pay" value="91">  <br>
	    메일: <input type="text" name="email" id="email"  value="bc@LK.net"> <br>
	    <input type="reset" value="입력취소">
	    <input type="submit" value="서브밋mvc2저장">
	</form>

	<p>
	<a href="login.jsp">[login]</a>
	<a href="guestWrite.jsp">[방명록등록]</a>
	<a href="guestList">[guestList서블릿]</a>
</body>
</html>















