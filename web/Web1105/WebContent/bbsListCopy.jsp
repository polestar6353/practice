<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>bbsList.jsp</title>
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none;   font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline;  font-family: Comic Sans MS ; }
 </style>
</head>

<body>
<jsp:include page="bbsHeader.jsp" />

<%
 msg = "select count(*) as cnt from bbs "; //guest기술하면 bbs
 ST=CN.createStatement();
 RS=ST.executeQuery(msg);
 if(RS.next()==true){ GGtotal=RS.getInt("cnt"); }
%>

<%
 int startRow,endRow;
 String pnum;
 int pageNUM; 
 int pageCount, startpage, endpage , tmp ; 
   
 //검색관련 4개 변수
 String sqry="";
 String skey="", sval="";
 String returnpage;
  
 skey = request.getParameter("keyfield"); //검색키=필드  name
 sval = request.getParameter("keyword");  //검색어키워드  b
 if(skey=="" || sval=="" || skey==null || sval==null){
	 skey="title";
	 sval="";
 }
 
 //이름조회  name like  '%b%'  [1][2클릭][3][4][5][6]
 //http://localhost:8080/Web1105/bbsList.jsp?pageNum=2&keyfield=name&keyword=b
 //http://localhost:8080/Web1105/bbsList.jsp?pageNum=2
 returnpage="&keyfield="+skey+"&keyword="+sval;
 
 sqry = " where " + skey +" like '%"+sval+"%' "; 
 String find="select count(*) as cnt from bbs  where " + skey +" like '%"+sval+"%' ";
 //System.out.println(find);
 ST = CN.createStatement();
 RS = ST.executeQuery(find);
 if(RS.next()==true){ Gtotal = RS.getInt("cnt"); }
 
 pnum = request.getParameter("pageNum");  //[이전][21][22][25연식씨선택] ~ [29][30][다음]
 if(pnum==null || pnum==""){ pnum="1"; }   
 pageNUM = Integer.parseInt(pnum);  //문자25를 숫자25로 변환
 
 startRow = (pageNUM-1)*10 + 1;  //25-1*10+1 ==> 241
 endRow  = pageNUM*10 ;   //25*10 ==> 250

 if(Gtotal%10==0){ pageCount = Gtotal/10; }
 else{ pageCount = (Gtotal/10)+ 1; }  //32pageCount = 316/10+1 
 
 tmp = (pageNUM-1)%10;   //25-1%10 ==> 4
 startpage=pageNUM-tmp;  //25-4 ==> 21
 endpage=startpage+9;    //21+9 ==> 30 
 if(endpage>pageCount){ endpage=pageCount ; } //[이전][31][32] 출력이 됨 
%>


<table border="1" width="900" cellspacing="0" cellpadding="3px">
<tr>
   <td colspan=7 align="right">
        <a href="#">[로그인]</a>
        <a href="bbsList.jsp">[bbs리스트]</a>
   		레코드갯수: <%=Gtotal %>/<%= GGtotal %> &nbsp; &nbsp;
   </td>
</tr>
<tr bgcolor="yellow">
	<td>행번호</td> <td>사 번</td>  <td>이 름</td>  <td>제 목</td>  
	<td>날 짜</td> <td>조회수</td>  <td>메 일</td>    
</tr>	
<%
try{
SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd EEE요일 aaa");
java.util.Date dt = new java.util.Date();
String display = sdf.format(dt);  //현재날짜로 테스트 
//System.out.println(display);
int Rcount=0;
String a ="select * from ( " ;
String b =" select rownum  rn,  b.* ,  (select count(*) from bbsreply r  where b.sabun=r.sabun) as rcnt  from " ;
String y = " ( select * from bbs " + sqry + " order by sabun )  b " ;
String c =" ) where rn between " + startRow + "  and  " + endRow  ;

 msg = a+b+y+c;
   //System.out.println(msg);
   ST = CN.createStatement();
   RS = ST.executeQuery(msg);
  while(RS.next()==true) {
	 Grn = RS.getInt("rn"); //가짜행번호 rn 기술
     Gsabun = RS.getInt("sabun");
     Gname = RS.getString("name");
     Gtitle = RS.getString("title");
     Gwdate = RS.getTimestamp("wdate");
     display= sdf.format(Gwdate);
     Ghit = RS.getInt("hit");
     Gemail = RS.getString("email");
	 Rcount = RS.getInt("rcnt");
	 
%>    	
  <tr>
    <td>  <%= Grn %> </td>
    <td>  <%= Gsabun %> </td>
    <td>  <%= Gname %>  </td>
    <td> <a href="bbsDetail.jsp?idx=<%=Gsabun%>"><%=Gtitle %> <% if (Rcount>0){ out.println("<span style=font-size:10px; color=red>["+Rcount+"]</span>"); }%> </a></td>
    <td>  <%= display %> </td>
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
 	  	//이전표시 startpage>10
 	    if(startpage>10){
 		  out.println("<a href=bbsList.jsp?pageNum="+(startpage-10)+">[이전]</a>");
 	    }
 	  	
 	    // [1] ~ [10]	 
 	    for(int i=startpage; i<=endpage; i++){
 	    	if(i==pageNUM){
 	    	  out.println("<font style='font-size:26pt; color:red'>["+i+"]</font>");	
 	    	}else{
 		      out.println("<a href=bbsList.jsp?pageNum="+(i+returnpage)+">["+i+"]</a>");
 	    	}
 	    }
 	  
 	  //다음표시 endpage<32
 	  if(endpage<pageCount){
 		out.println("<a href=bbsList.jsp?pageNum="+(startpage+10)+">[다음]</a>");
 	  }
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
</table>
<p>
<jsp:include page="bbsFooter.jsp"></jsp:include>
</body>
</html>








