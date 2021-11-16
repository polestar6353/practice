<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>bbsReply_edit.jsp</title>
  
   <style type="text/css">
     *{font-size:16pt;}
     a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
     a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
   
   <script type="text/javascript">
   </script>
</head>
<body>
<h2> bbsReply_edit.jsp </h2>
<%
 //bbsReply_edit.jsp=bbsReply_editSave.jsp같은역할
 try{
	 String iwriter = request.getParameter("writer");
	 String icontent = request.getParameter("content");
	 int isabun = Integer.parseInt(request.getParameter("sabun"));
	 int inum = Integer.parseInt(request.getParameter("num"));
	 System.out.println(iwriter+" "+icontent+" "+inum+" "+isabun);
     msg ="update bbsreply set writer=?, content=? where num=?";
     PST=CN.prepareStatement(msg);
     PST.setString(1,iwriter);
     PST.setString(2,icontent);
     PST.setInt(3,inum);
     PST.executeQuery();
     
     response.sendRedirect("bbsDetail.bit?idx="+isabun);
 }catch(Exception ex){System.out.println("bbsreply_edit.jsp 댓글수정에러:" + ex.toString());}
%>	

</body>
</html>





