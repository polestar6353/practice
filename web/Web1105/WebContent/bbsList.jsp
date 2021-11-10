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
String searchKey=request.getParameter("keyfield");
String searchWord=request.getParameter("keyword");
msg= "select count(*) as cnt from bbs";

if(searchKey!=null){
	if(searchKey.equals("")){
		response.sendRedirect("bbsList.jsp");
	}
	 if(searchKey.equals("name")){
		 msg+=" where name like '%"+searchWord+"%'";
	 }else if(searchKey.equals("title")){
		 msg+=" where title like '%"+searchWord+"%'";
	 }else if(searchKey.equals("email")){
		 msg+=" where email like '%"+searchWord+"%'";
	 }
	 }
 ST=CN.createStatement();
 RS=ST.executeQuery(msg);
 if(RS.next()==true){Gtotal=RS.getInt("cnt"); }
%>

<%

 int startRow,endRow;//where rn between  start시작행번호  and  끝행end번호
 String pnum;
 int pageNUM;  //pageNum문자열을 숫자로 변화
 int pageCount, startpage, endpage ;  //pageCount=32페이지  startpage=1  endpage=10
 int tmp ; //시작페이지구할때 편하게 사용할 변수 
 String returnpage; 
 
 pnum = request.getParameter("pageNum");   //문자화[7]
 if(pnum==null || pnum==""){ pnum="1"; }   //저장및삭제 
 pageNUM = Integer.parseInt(pnum); //숫자화 
 
 startRow = (pageNUM-1)*10 + 1;  //시작행번호
 endRow  = pageNUM*10 ;  //끝행번호
 //System.out.println("몫계산 6/10="+ (6/10));  //0
 //System.out.println("나머지 6%10="+ (6%10));  //6
 //전체레코드갯수 316갯수/10=32, 만약에 310/10=31
 if(Gtotal%10==0){ pageCount = Gtotal/10; }
 else{ pageCount = (Gtotal/10)+ 1; }  //총페이지갯수 32
 
 tmp = (pageNUM-1)%10 ;  //[1][2] ~[7선택] [9][10][다음] 결과나머지값 6  
 startpage = pageNUM-tmp; //1
 endpage = startpage+9 ; //10
 System.out.println("pageNUM="+pageNUM+" pageCount="+pageCount+" startpage="+startpage+" endpage=" + endpage);
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
 
 if(searchKey!=null){
 if(searchKey.equals("name")){
	 msg="select * from (select rownum rn, b.* from bbs b where name like '%"+searchWord+"%')  where rn between " + startRow +" and "+ endRow;
 }else if(searchKey.equals("title")){
	 msg="select * from (select rownum rn, b.* from bbs b where title like '%"+searchWord+"%')  where rn between " + startRow +" and "+ endRow;
 }else if(searchKey.equals("email")){
	 msg="select * from (select rownum rn, b.* from bbs b where email like '%"+searchWord+"%')  where rn between " + startRow +" and "+ endRow;
 }}else{
	 msg="select * from (select rownum rn, b.* from bbs b)  where rn between " + startRow +" and "+ endRow; 
 }
 
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
    <td><a href="bbsDetail.jsp?idx=<%=Gsabun %>"> <%= Gsabun %> </a></td>
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
 	  
 	  if(startpage>10){
 		  if(searchKey!=null){
 			out.println("<a href=bbsList.jsp?pageNum=1&keyfield="+searchKey+"&keyword="+searchWord+">[처음으로]</a>");
 	 		out.println("<a href=bbsList.jsp?pageNum="+(startpage-10)+"&keyfield="+searchKey+"&keyword="+searchWord+">[이전]</a>");
 		  }else{
	 		out.println("<a href=bbsList.jsp?pageNum=1>[처음으로]</a>");
	 		out.println("<a href=bbsList.jsp?pageNum="+(startpage-10)+">[이전]</a>");
 	  }}
 	  
 	   for(int i=startpage; i<=endpage; i++){
 		  if(searchKey!=null){
 			 out.println("<a href=bbsList.jsp?pageNum="+i+"&keyfield="+searchKey+"&keyword="+searchWord+">["+i+"]</a>");  
 		  }
 		  else{
 		 out.println("<a href=bbsList.jsp?pageNum="+i+">["+i+"]</a>");}
 		 if(i==pageCount){
 			 break;
 		 }
 	   }
 	  
 	  //다음 endpage<pageCount적으면  10<32  20<32  30<32
 	  if(endpage<pageCount){
 		  if(searchKey!=null){
 			 out.println("<a href=bbsList.jsp?pageNum="+(startpage+10)+"&keyfield="+searchKey+"&keyword="+searchWord+">[다음]</a>");
 		  }else{
 		out.println("<a href=bbsList.jsp?pageNum="+(startpage+10)+">[다음]</a>");  
 	  }}
 	  %>  
 	</td>
 </tr>
 <tr align="center">
 	<td colspan="7">
 	  <form name="myform" action="bbsList.jsp">
 	    검색:
 	      <select name="keyfield">
 	      	<option value="">---검색필드---</option>
 	      	<option value="name">이름필드</option>
 	      	<option value="title">제목필드</option>
 	      	<option value="email">메일필드</option>
 	      </select>
 	      <input type="text" name="keyword">
 	      <input type="submit" value="bbs검색">
 	  </form>
 	</td>
 </tr>
 
  <tr align="center">
 	<td colspan="7">
 	    <a href="bbsWrite.jsp">[bbs등록]</a>
		<a href="bbsList.jsp">[bbs전체출력]</a>
		<a href="testList.jsp">[testList]</a>
 	</td>
 </tr>
</table>
		


</body>
</html>








