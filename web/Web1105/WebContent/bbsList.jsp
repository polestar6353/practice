<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
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


<table border="1" width="900" cellspacing="0" cellpadding="3px">
<tr>
   <td colspan=7 align="right">
        <a href="#">[로그인]</a>
        <a href="bbsList.jsp">[bbs리스트]</a>
   		레코드갯수: ${Gtotal}/${GGtotal} &nbsp; &nbsp;
   </td>
</tr>
<tr bgcolor="yellow">
	<td>행번호</td> <td>사 번</td>  <td>이 름</td>  <td>제 목</td>  
	<td>날 짜</td> <td>조회수</td>  <td>메 일</td>    
</tr>	

<c:catch>
 <c:forEach var="bean" items="${KVsearch}">   	
	<tr>
	   <td> ${bean.rn} </td>
	   <td> ${bean.sabun} </td>
	   <td> ${bean.name} </td>
	   <td> <a href="bbsDetail.bit?idx=${bean.sabun}"> ${bean.title}</a>
	   	  <c:choose>
	   		<c:when test="${bean.rcount>0}" > <span style=font-size:12px;>[${bean.rcount}]</span> </c:when>
	   		<c:when test="${bean.rcount==0}" ></c:when>
	   	  </c:choose> 
	   </td>
	   <td> ${bean.wdate} </td>
	   <td> ${bean.hit} </td>
	   <td> ${bean.email} </td>
	</tr>
  </c:forEach>  
</c:catch>

 <tr align="center">
 	<td colspan="7">  
	 	<c:forEach items="${slist}" var="list" varStatus="status">
			${slist[status.index]}
		</c:forEach>
 	</td>
 </tr>
 <tr align="center">
 	<td colspan="7">
 	  <form name="myform" action="bbsSelect.bit">
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








