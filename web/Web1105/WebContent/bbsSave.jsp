<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>bbsSave.jsp</title>
  
   <style type="text/css">
     *{font-size:16pt;}
     a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
     a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
   
   <script type="text/javascript">
   </script>
</head>
<body>
<h2> bbsSave.jsp </h2>
<%

 try{
   msg ="insert into bbs values( ?~~~ )";
   PST = CN.prepareStatement(msg);
   // PST.executeUpdate(); //괄호안의 매개인자 없어요
   System.out.println("bbsSave.jsp test테이블 데이터 저장성공했습니다");
   response.sendRedirect("bbsList.jsp");
 }catch(Exception ex){System.out.println("bbsSave.jsp 저장에러:" + ex.toString());}
%>	

<p>
<a href="bbsWrite.jsp">[bbs등록]</a>
<a href="bbsList.jsp?pageNum=1">[bbs전체출력]</a>
<a href="testList.jsp">[testList]</a>
 <a href="#">[index]</a>	
</body>
</html>





