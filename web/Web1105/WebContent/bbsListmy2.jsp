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
<h2>bbsList.jsp문서 페이지&검색</h2>
<%
 int startRow,endRow;//where rn between  start시작행번호  and  끝행end번호
 String pnum;
 int pageNUM;  //pageNum문자열을 숫자로 변화
 int pageCount, startpage, endpage ;  //pageCount=32페이지  startpage=1  endpage=10
 int tmp ;
 String returnpage; 
 
 pnum = request.getParameter("pageNum");//<a href=bbsList.jsp?pageNum=i
 if(pnum==null || pnum==""){ pnum="1"; }  //저장및삭제 
 System.out.println("넘어온 문자페이지번호 = " + pnum);
 pageNUM = Integer.parseInt(pnum); //숫자화 
 
 startRow = (pageNUM-1)*10 + 1;  //시작행번호
 endRow  = pageNUM*10 ;  //끝행번호
%>

<%
 msg = "select count(*) as cnt from bbs "; //guest기술하면 bbs
 ST=CN.createStatement();
 RS=ST.executeQuery(msg);
 if(RS.next()==true){Gtotal=RS.getInt("cnt"); }
%>

<table border="1" width="900" cellspacing="0" cellpadding="3px">
<tr>
   <td colspan=7 align="right">
        <a href="#">[로그인]</a>
        <a href="bbsWrite.jsp">[bbs글쓰기]</a>
   		총레코드갯수: <%= Gtotal %> &nbsp; &nbsp;
   </td>
</tr>
<tr bgcolor="yellow">
	<td>행번호</td> <td>사 번</td>  <td>이 름</td>  <td>제 목</td>  
	<td>날 짜</td> <td>조회수</td>  <td>조회수</td>    
</tr>	
<%
try{
 //msg="select rownum, b.* from bbs b ";
 msg="select * from (select rownum rn, b.* from bbs b)  where rn between " + startRow +" and "+ endRow;
   System.out.println(msg);
   ST = CN.createStatement();
   RS = ST.executeQuery(msg);
  while(RS.next()==true) {
	 Grn = RS.getInt("rn"); //가짜행번호 rn 기술
     Gsabun = RS.getInt("sabun");
     Gname = RS.getString("name");
     Gtitle = RS.getString("title");
     Gwdate = RS.getDate("wdate");
     Ghit = RS.getInt("hit");
     Gemail = RS.getString("email");
%>    	
  <tr>
    <td>  <%= Grn %> </td>
    <td>  <%= Gsabun %> </td>
    <td>  <%= Gname %>  </td>
    <td>  <%= Gtitle %>  </td>
    <td>  <%= Gwdate %> </td>
    <td>  <%= Ghit %> </td>
    <td>  <%= Gemail %> </td>
  </tr>  
<%  
  } //while end
}catch(Exception ex){System.out.println("bbs데이터전체출력 에러" + ex);}
%>	
 <tr align="center">
 	<td colspan="7">
 	  <%
 	 startpage=(Integer.parseInt(pnum)-1)/10 * 10;
 	  endpage=0;
 	  if(startpage!=0){
 		 out.println("<a href=bbsList.jsp?pageNum="+((pageNUM/10)*10-9)+">[이전]");  
 	  }
 	   for(int i=1; i<11; i++){
 		   if((startpage+i)>(Gtotal/10)+1){	 
 			   break;
 		   }
 		 out.println("<a href=bbsList.jsp?pageNum="+(startpage+i)+">["+(startpage+i)+"]</a>");
 		 endpage=startpage+i;
 	   }
 	   if(endpage!=(Gtotal/10)+1){
 	   out.println("<a href=bbsList.jsp?pageNum="+(endpage+1)+">[다음]");
 	   }
 	  %>  
 	</td>
 </tr>
 
  <tr align="center">
 	<td colspan="7">
 	    <a href="bbbWrite.jsp">[bbs등록]</a>
		<a href="bbsList.jsp?pageNum=1">[bbs전체출력]</a>
		<a href="testList.jsp">[testList]</a>
 	</td>
 </tr>
</table>
		


</body>
</html>








