<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [bbsReply.jsp] </title>
<style type="text/css">
  *{ font-size: 16pt; font-weight: bold; }
  a{ font-size: 16pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
  a:hover{ font-size: 18pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
  #rsave{
    font-size: 26pt; font-weight: bold;
    background:yellow;   height:130px;
  }
</style>

<script type="text/javascript">
  var gr_num; //전역변수

  function re_edit(num, writer, content){
	  gr_num=num;
	  reply_form.bt_save.value = "댓글수정";
	  reply_form.writer.value=writer;
	  reply_form.content.value=content;
  }//end
  
  function re_save(sabun){
	 var bt = reply_form.bt_save.value;
	 var writer = reply_form.writer.value;
	 var content = reply_form.content.value;
	 //alert(bt+' '+writer+' '+content);
	 if(bt=="댓글저장"){
	  document.reply_form.action="bbsReply_insert.jsp?writer="+writer+"&content="+content+"&sabun="+sabun;
	  document.reply_form.method="post"; //생략가능
	  document.reply_form.submit();
	 }else if(bt=="댓글수정"){
	  reply_form.bt_save.value = "댓글저장";
	  document.reply_form.action="bbsReply_edit.jsp?writer="+writer+"&content="+content+"&sabun="+sabun+"&num="+gr_num;         
	  document.reply_form.method="post";
	  document.reply_form.submit();
	 } 
  }//end
</script>
</head>
<body>
   
 <%
   //bbsDetail.jsp문서 맨마지막 include에서 넘겨온 Ridx
   String Rdata = request.getParameter("Ridx") ;
   System.out.println("bbsReply.jsp댓글문서 넘어온  Ridx="+ Rdata);
 %>
 	
 <form name="reply_form">
 	 <table width=900 border=1 cellspacing=0>
 	 <tr>
 	  	<td> <img src="images/z1.gif"> TGidx:<img src="images/z1.gif">  </td>
 	  	<td> <input type="text" name="sabun" value="<%= Rdata %>" size=30 readonly> </td>
 	  	<td rowspan="3"  align="center">
 	  		<input type="button" id="rsave" name="bt_save" onClick="re_save(<%= Rdata %>);" value="댓글저장">
 	  	</td>
 	  </tr>
 	  
 	  <tr>
 	  	<td> <img src="images/z1.gif"> T저자:<img src="images/z1.gif"></td>
 	  	<td> <input type="text" name="writer" size=30> </td>
 	  </tr>
 	  
 	  <tr>
 	  	<td> <img src="images/z1.gif"> T내용:<img src="images/z1.gif"> </td>
 	  	<td> <textarea rows="3" cols="27" name="content"></textarea> </td>
 	  </tr>
 	 </table>
 </form>
<%	
	int rcount=0;
	msg="select count(*) from bbsreply where sabun="+Rdata;
	ST=CN.createStatement();
	RS = ST.executeQuery(msg);
	if(RS.next()){
		rcount=RS.getInt("count(*)");
	}
%>
 <p>
 <table width=900 border=0 cellspacing=0>
 <caption> <<<< 댓글 갯수 : <%=rcount %>  >>>> </caption>
  <tr bgcolor="pink" >
  	<td>번호</td>
  	<td>저자</td>
  	<td>댓글내용</td>
  	<td>참조사번</td>
  	<td>수정/삭제</td>
  </tr>
<%
  //StringBuffer sb = new StringBuffer( );//미사용 , StringBuilder
  //sb.append("select rownum rrn, b.sabun, r.num, r.writer, r.content from bbs b ");
  //sb.append(" inner join bbsreply r ");
  //sb.append(" on b.sabun = r.sabun  ");
  //sb.append(" and r.sabun = " + Rdata) ; 
 
 String a = "select rownum rrn, b.sabun, r.num, r.writer, r.content  from  bbs b ";
 String b = " inner join bbsreply r ";
 String y = " on b.sabun = r.sabun ";
 String c = " and r.sabun = " + Rdata ;
 msg = a+b+y+c;
 ST=CN.createStatement();
 RS = ST.executeQuery(msg);
 while(RS.next()==true){
	Rrn = RS.getInt("rrn");
	Rnum = RS.getInt("num");
	Rwriter = RS.getString("writer");
	Rcontent = RS.getString("content");
	Rsabun = RS.getInt("sabun");
%>
  <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='' ">
  	<td width=70>  <%=Rrn%> </td> 
  	<td width=150> <%=Rwriter%> </td>
  	<td width=200> <%=Rcontent%> </td>
  	<td width=200> <%=Rsabun%> </td>
  	<td>
  		<a href="bbsReply_delete.jsp?idx=<%=Rnum%>&rsabun=<%=Rsabun%>">[댓del]</a>
  		<a href="#" onclick=re_edit(<%=Rnum %>,"<%=Rwriter%>","<%=Rcontent%>"); >[댓edit]</a> 
  	</td>
  </tr>
  <% } %>
 </table>	
 
 <p style="margin-bottom:150px">
 <p><br>
</body>
</html>






