<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>testList.jsp</title>
  
   <style type="text/css">
     *{font-size:16pt;}
     a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
     a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
   
   <script type="text/javascript">
   </script>
</head>
<body>
<h2> testList.jsp </h2>
<%
 msg="select count(*) as cnt from test "; 
 RS=ST.executeQuery(msg); 
 if(RS.next()==true){ Gtotal = RS.getInt("cnt"); }
	 
%>

 <table border="1" width="900"  cellspacing="0">
  	<tr align="center">
  		<td colspan="5"> <img src="images/bar.gif">  </td> 
  	</tr>
  	<tr align="right">
  		<td colspan="5"> 레코드갯수: <%= Gtotal %> &nbsp;  </td> 
  	</tr>
  	
  	<tr bgcolor="yellow">
  		<td>제 목</td>  <td>급 여</td>   <td>성 별</td>  <td>날 짜</td>  <td>이미지</td> 
  	</tr>  	 	
<%
String path="C:\\Users\\jh\\Desktop\\자바자료\\workspaceJSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Web1105\\storage\\";
String Ttitle="";
int Tpay=0;
String Tgender="";
Date Tdate;
String Timage="";

try{
	msg="select * from test";
	RS=ST.executeQuery(msg);
	while(RS.next()){
		Ttitle=RS.getString("title");
		Tpay=RS.getInt("pay");	
		Tgender=RS.getString("gender");
		Tdate=RS.getDate("wdate");
		Timage=RS.getString("img_file_name");	
	
%>	
	<tr>
	<td><%=Ttitle %></td>
	<td><%=Tpay %></td>
	<td><%=Tgender %></td>
	<td><%=Tdate %></td>
	<td><img src=<%=request.getContextPath()%>/storage/<%=Timage %> width=100 height=50></td>
	</tr>
<%  	 
	}
 }catch(Exception ex){ System.out.println("이미지게시판조회에러 " + ex.toString());}
 %> 	
 </table>
  <p>
  <a href="testWrite.jsp">[testWrite]</a>
  <a href="testList.jsp">[testList]</a>
  <a href="testListImage.jsp">[이미지게시판]</a>
  <a href="#">[index]</a>
  <a href="login.jsp">[로그인]</a>
</body>
</html>