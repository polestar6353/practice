<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> testListImage.jsp </title>

 <style type="text/css">
   *{ font-size: 16pt; font-weight: bold; }
   a{ font-size: 16pt; text-decoration: none;  font-family: Comic Sans MS; }
   a:hover{ font-size: 20pt; text-decoration: underline; }
   .my{ font-size: 12pt;  font-weight: bold;}
 </style>
 
 <script type="text/javascript">
 </script> 
</head>
<body>

<%!
 //전역변수 선언
 String Ggender,Gimage;
%>

<%
 msg="select count(*) as cnt from test "; 
 RS=ST.executeQuery(msg); 
 if(RS.next()==true){ Gtotal = RS.getInt("cnt"); }
%>
 <p style="margin-top:10px;"> 
 
  
 <table  width="700"  cellspacing="0" border="1" cellpadding="10">
   testListImage.jsp 레코드갯수: <%= Gtotal %> &nbsp;<p>
   
 <tr>
 <%
 try{
   //testListImage.jsp문서이미지게시판 구현   1행에 5개그림열출력 
   int i=0;
   msg = "select * from test  order by title asc" ;  //asc생략가능해요
   RS = ST.executeQuery( msg ); //RS=~~~(); 기술하면 우리는 RS.next()필수기술 
   while(RS.next()==true){
  	 Gtitle = RS.getString("title");
  	 Gpay = RS.getInt("pay");
  	 Ggender = RS.getString("gender");
  	 Gwdate = RS.getDate("wdate");
  	 Gcode = RS.getInt("code");  
  	 Gimage = RS.getString("img_file_name"); 
  	 if(i%5==0){ //System.out.println() 1~30출력 5개씩출력참고
 %>
   <tr></tr>
<%  } %>
 
  	<td align="center">  
  	 <a href="testDetail.jsp?idx=<%=Gcode%>"> 
  	  <img src="<%=request.getContextPath()%>/storage/<%=Gimage%>" width="250"  height="100"  
  	       onMouseOver="this.width=300; this.height=150"  onMouseOut="this.width=150; this.height=100"> 
  	 </a><p>
  	    <span class="my">상품:<%= Gtitle %></span>  
  	    <span class="my">가격:<%= Gpay %></span>   
  	</td>	 
 <%  	
   i=i+1;  //1씩증가 
   }//while end
 }catch(Exception ex){ System.out.println("조회에러 " + ex.toString());}
 %> 
  </tr>	
 </table>
  

  <p>  <!-- testListImage.jsp -->
  <a href="testWrite.jsp">[testWrite]</a>
  <a href="testList.jsp">[testList]</a>
  <a href="#">[index]</a>
  <a href="login.jsp">[로그인]</a>
</body>

</html>






