<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>bbsReply_insert.jsp</title>
  
   <style type="text/css">
     *{font-size:16pt;}
     a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
     a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
   
   <script type="text/javascript">
   </script>
</head>
<body>
<h2> bbsReply_insert.jsp </h2>
<%
String iwriter = request.getParameter("writer");
String icontent = request.getParameter("content");
int isabun = Integer.parseInt(request.getParameter("sabun"));
 //bbsReply_insert.jsp=bbsReply_insertSave.jsp같은역할
 try{
   msg ="insert into bbsreply values(bbsreply_seq.nextval,?,?,?)";
   PST=CN.prepareStatement(msg);
   PST.setString(1,iwriter);
   PST.setString(2,icontent);
   PST.setInt(3, isabun);
   PST.executeQuery();
   response.sendRedirect("bbsDetail.bit?idx="+isabun);
   
   //response.sendRedirect("bbsReply.jsp?Ridx=");
 }catch(Exception ex){System.out.println("bbsreply_insert.jsp 댓글등록에러:" + ex.toString());}
%>	

</body>
</html>





