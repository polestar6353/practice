<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title></title>
  
   <style type="text/css">
     *{font-size:16pt;}
     a{font-size:16pt; text-decoration:none;  font-family: Comic Sans MS ; }
     a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
   
   <script type="text/javascript">
   </script>
</head>
<body>
	<%!
	   //server side include .jsp문서 
	   Connection CN ;
	   Statement ST ;
	   PreparedStatement PST;
	   ResultSet RS ;
	   
	   int Grn, Grow, Gsabun, Gcode, Gpay, Ghit, Gtotal, GStotal ;   
       String Gname, Gtitle, Gemail, Gmemo, GID, GPWD ; 
       java.util.Date Gdate, Gwdate ;
       String Gmsg, msg, Gdata;
       
       int Rrn, Rnum, Rsabun, Rcode;
       String Rwriter, Rcontent;
       
       int dcode, dpay ;  
       String dtitle,demail ;  
       
       int Bsabun, Bhit, Brn, Bpage;
       String Bname, Btitle;
       Date Bdate;
       
	%>
	
	<%
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
    	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
    	CN=DriverManager.getConnection(url, "system", "1234");
    	//System.out.println("ssi문서 DB서버연결성공 OKOK "); //한번성공후 주석처리 권장
        ST = CN.createStatement();
	}catch (Exception e) {System.out.println("ssi문서 DB서버연결실패 " + e.toString());}
	%>
</body>
</html>









