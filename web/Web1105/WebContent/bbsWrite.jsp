<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>bbsWrite.jsp</title>
  
<style type="text/css">
  *{font-size:16pt;}
  a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
  a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
</style>
   
<script type="text/javascript">
	
</script>
</head>
<body>
<h2> bbsWrite.jsp </h2>
  <form name="myform"  action="bbsSave.jsp"    >
      제목:  <input type="text"  >  <br>
      급여:  <input type="text" >  <br>

       <input type="submit" value="bbd저장" > &nbsp;
       <input type="reset" value="취소">  
  </form>
  

<p>
<a href="bbsWrite.jsp">[bbs등록]</a>
<a href="bbsList.jsp?pageNum=1">[bbs전체출력]</a>
<a href="testList.jsp">[testList]</a>
</body>
</html>