<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> testEdit.jsp </title>

 <style type="text/css">
   *{ font-size: 16pt;  }
   a{ font-size: 16pt; text-decoration: none; }
   a:hover{ font-size: 20pt; text-decoration: underline; }
 </style>
 
 <script type="text/javascript"> 
  
 </script>
 
</head>
<body>
<%! 
 String Ggender,Gimage;
%>

<%
  try{
    String data = request.getParameter("idx"); //testDetail.jsp문서에서 넘어오는가짜변수 idx
    msg = "select * from test  where code = "  + data; 
    System.out.println("testEdit.jsp문서 msg = " + msg); 
	//ST = CN.createStatement(); 
	RS = ST.executeQuery(msg);
	if(RS.next()){ 
	  Gtitle = RS.getString("title");
	  Gpay = RS.getInt("pay");
	  Ggender = RS.getString("gender");
	  Gwdate = RS.getDate("wdate");
	  Gcode = RS.getInt("code"); //삭제,수정,댓글에서 사용
	}
  }catch(Exception ex){System.out.println("testEdit.jsp수정 데이터출력 실패 " + ex ); }
%>
  <h2> testEdit.jsp </h2>
  <form name="myform"  method="get" action="">
      수정코드: <input type="text" name="code" value="<%=Gcode%>" readonly="readonly"> <br>  
      수정제목: <input type="text" name="title"  value="<%=Gtitle%>"><br>
      수정급여: <input type="text" name="pay" value="<%=Gpay%>">  <br>
             
      수정성별: <input type="radio" name="gender" value="man" <%if(Ggender.equals("man")){out.println("checked"); }%> >남자
           <input type="radio" name="gender" value="woman" <%if(Ggender.equals("woman")){%>checked<%}%> >여자 
           <b style="color:blue">(수정전: <%=Ggender%>)</b> <br>
         
         <input type="submit" value="sumbit수정"> &nbsp;
         <input type="reset" value="수정취소">  
  </form>
  
  <p>
  <a href="testWrite.jsp">[testWrite]</a>
  <a href="testList.jsp">[testList]</a>
  <a href="index.jsp">[index]</a>
</body>
</html>







