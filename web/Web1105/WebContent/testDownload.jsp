<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testDownload.jsp</title>
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none;  font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
 </style>
 
 <script type="text/javascript">
 </script>
 
</head>
<body>
 
<%
 try{
   String path = application.getRealPath("storage");
   String data = request.getParameter("idx"); 
   String fname = request.getParameter("fname"); 
   File file = new File(path,fname);
   System.out.println(path);
   
   response.setHeader("content-Disposition","attachment;filename="+fname);
   
   InputStream is = new FileInputStream(file);
   OutputStream os = response.getOutputStream();
   
   byte[] bt = new byte[(int)file.length()];
   is.read(bt,0,bt.length);
   os.write(bt);
   
   is.close();
   os.close();
   
   
  }catch(Exception ex){ System.out.println("testDownload에러 " + ex.toString()); }
 %> 
  
<a href="testWrite.jsp">[testWrite]</a>
<a href="testList.jsp">[testList]</a>

</body>
</html>