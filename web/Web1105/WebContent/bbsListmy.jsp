<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>bbsList.jsp</title>
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none;  font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
 </style>
</head>

<body>
<h2>bbsList.jsp전체출력</h2>	
<%
Bpage=Integer.parseInt(request.getParameter("pageNum"));
msg = "select count(*) as cnt from bbs";
ST=CN.createStatement();
RS=ST.executeQuery(msg);
if(RS.next()){Gtotal=RS.getInt("cnt");}
%>

<table border="1" width="900" cellspacing="0" cellpadding="5px">
<tr>
   <td colspan=7 align="right">
        <a href="#">[로그인]</a>
        <a href="bbsWrite.jsp">[bbs글쓰기]</a>
   		총레코드갯수: <%= Gtotal %> &nbsp; &nbsp;
   </td>
</tr>
<tr bgcolor="yellow">
	<td>행번호</td>  <td>사 번</td>  <td>이 름</td>  <td>제 목</td>  <td>날 짜</td>  <td>조회수</td>    
</tr>	
<%
try{
 
 msg = "select rownum, b.* from bbs b";
 ST=CN.createStatement();
 RS=ST.executeQuery(msg);
 while(RS.next()){
	 Brn = RS.getInt("rownum");
	 Bsabun = RS.getInt("sabun");
	 Bname = RS.getString("name");
	 Btitle = RS.getString("title");
	 Bdate = RS.getDate("wdate");
	 Bhit = RS.getInt("hit");
 	if(Brn>(Bpage-1)*10&&Brn<Bpage*10+1){
%>    	
  <tr>
  	<td>  <%=Brn %> </td>
    <td>  <%=Bsabun %> </td>
    <td>  <%=Bname %>  </td>
    <td>  <a href="bbsDetail.jsp?pageNum=<%=Bsabun%>"> <%=Btitle%> </a> </td>
    <td>  <%=Bdate%> </td>
    <td>  <%=Bhit%> </td>
  </tr>  
<%  
 }//if end
 }//while end
 }//try end
 catch(Exception e){
 }
%>	
	<tr>
	  <td colspan="7">
<%
for(int pagenumber=1;pagenumber<((int)Gtotal/10)+2;pagenumber++){
	 if(pagenumber>((Bpage-1)/10)*10&&pagenumber<((Bpage-1)/10)*10+11){
		 if(pagenumber!=1&&pagenumber%10==1){
%>
	<a href="bbsList.jsp?pageNum=<%=pagenumber-10%>">[이전] ... </a>
<%
		 }//이전 if end
%>
			<a href="bbsList.jsp?pageNum=<%=pagenumber%>">[<%=pagenumber%>]</a>
<%
		if(pagenumber%10==0){
%>
	<a href="bbsList.jsp?pageNum=<%=pagenumber+1%>">... [다음]</a>
<%
   }//다음 if end
  }//main ifend
 }//for end
%>
	  </td>
	</tr>
	<tr>
	  <td colspan="7">	
		<p>
		  <a href="bbsWrite.jsp">[bbs등록]</a>
		  <a href="bbsList.jsp?pageNum=1">[bbs전체출력]</a>
		  <a href="testList.jsp">[testList]</a>
		</p>
   	 </td>
	</tr>
</table>
</body>
</html>








