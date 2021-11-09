<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>  </title>
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none;  font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
 </style>
 
 <script type="text/javascript">
 </script>
 
</head>
<body>

 <h2> testDetail.jsp 상세문서 </h2>	
<%! 
 String Ggender,Gimage;
%>
 <%
 try{ 
	String data = request.getParameter("idx"); //testList.jsp문서에서 넘어오는가짜변수 idx
     //msg = "select * from test  where code = "  + data; 
     //System.out.println("testDetail.jsp문서 msg = " + msg); //쿼리문장출력
     //ST=CN.createStatement(); //ssi.jsp문서에 기록
     //RS = ST.executeQuery( msg );
     
     msg = "select * from test where code = ? ";
     PST = CN.prepareStatement(msg);
       	   PST.setInt(1, Integer.parseInt(data));
     RS = PST.executeQuery(); //RS = PST.executeQuery(msg기술하면 실행에러발생);
     
	   if(RS.next()==true){
	  	 Gtitle = RS.getString("title");
	  	 Gpay = RS.getInt("pay");
	  	 Ggender = RS.getString("gender");
	  	 Gwdate = RS.getDate("wdate");
	  	 Gcode = RS.getInt("code"); //삭제,수정,댓글에서 사용 
	  	 Gimage = RS.getString("img_file_name"); //이미지출력
	   }//if end
  }catch(Exception ex){ System.out.println("testDetail 조회에러 " + ex.toString()); }
 %> 
 
  <table border="1" width="1000"  cellspacing="0" cellpadding="20px">
  	<tr>
  		<td width="400"  rowspan="5" align="center">
  		 <a href="testDownload.jsp?idx=<%=Gcode%>&fname=<%=Gimage%>">
  		  <img src="<%=request.getContextPath()%>/storage/<%=Gimage%>" width="400" height="300"> <br>
  		  </a>
  		   <font size=6><b>이미지다운로드:<%= Gimage%></b></font>
  		</td> 
  		<td> 제목:  <%= Gtitle %>  </td>
  	</tr> 	
  	<tr>
  	    <td> 급여: <%= Gpay %>  </td>
  	</tr>
  	<tr>
  	    <td> 날짜: <%= Gwdate %>  </td>
  	</tr>
   	<tr>
  	   <td> 성별: <%= Ggender %>  </td>
  	</tr>
  	<tr>
  	   <td> 
  	        <a href="testWrite.jsp">[testWrite]</a>
  			<a href="testList.jsp">[testList]</a>
  			<a href="#">[삭제]</a>
  			<a href="index.jsp">[index]</a>
  			<a href="testEdit.jsp?idx=<%=Gcode%>">[수정]</a>
  	   </td>
  	</tr>
 </table>
  <!--  한건상품보면서   장바구니/주문, 상품이미지확인, 상품정보 상세히 크기관심  칼라관심 가격관심 -->
  <!--  testDetail.jsp -->
  <!--  게시판 상세문서일때  로그인성공및 글쓴이 댓글, 글올린사람 삭제, 글올린사람 수정  --> 
  <!--  글등록,삭제처리및 수정처리는 글쓴이 글올린사람만 글등록,삭제,수정처리 권한이 있습니다  session사용  -->
  <!--  session내장객체를 사용해야 합니다 아직은 세션처리 안함  --> 
</body>
</html>






