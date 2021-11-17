<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"   %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>bbsList.jsp</title>
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none;  color:green; font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline;  color:green; font-family: Comic Sans MS ; }
 </style>
</head>

<body>
<table border="1" width="900" cellspacing="0" cellpadding="3px">
<tr>
   <td colspan=7 align="right">
        <a href="index.jsp">[index]</a>
        <a href="bbsWrite.jsp">[bbsWrite등록]</a>
        <a href="bbsSelect.bit">[bbsSelect.bit]</a>
   		레코드갯수:   ${GStotal}/${GGtotal}&nbsp; &nbsp;
   </td>
</tr>
<tr bgcolor="greenyellow">
	<td>행번호</td> <td>사 번</td>  <td>이 름</td>  <td>제 목</td>  
	<td>날 짜</td> <td>조회수</td>  <td>조회수</td>    
</tr>	

 <c:forEach var="bean" items="${LG}">
  <tr>
    <td> ${bean.rn} </td>
    <td> ${bean.sabun} </td>
    <td> ${bean.name} </td>
    <td> <a href="bbsDetail.bit?idx=${bean.sabun}"> ${bean.title} </a> </td>
    <td> ${bean.wdate} </td>
    <td> ${bean.hit} </td>
    <td> ${bean.email} </td>
  </tr>  
 </c:forEach>

 <tr align="center">
 	<td colspan="7">  
 	 <!-- 이전 1~10 11~20 21~30 31~40  시작페이지>10  -->
 	 <c:if test="${startPage>10}">
 	    <a href="bbsSelect.bit?pageNum=${startPage-10}">[이전]</a>
 	 </c:if>
 	 
 	 <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1" >
 	 	<c:choose>
 	 	  <c:when test="${i==pageNUM}">
 	 	     <font style="font-size:20pt; color:red">[${i}]</font>
 	 	  </c:when>
 	 	  <c:otherwise>
 	 	     <a href="bbsSelect.bit?pageNum=${i}${returnpage}">[${i}]</a>
 	 	  </c:otherwise>
 	    </c:choose>
 	 </c:forEach>
 	 
 	 <!-- 다음 1~10 11~20 21~30 31~40  pageCount=32 -->
 	 <c:if test="${endPage<pageCount}">
 	    <a href="bbsSelect.bit?pageNum=${startPage+10}">[다음]</a>
 	 </c:if>
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
 	      <input type="submit" value="bbs서블릿검색">
 	  </form>
 	</td>
 </tr> 
</table>
<p>

</body>
</html>








