<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <title>  </title>
 
 <style type="text/css">
   *{font-size:16pt; font-weight: bold;}
   a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
 </style>
</head>
<body>
   <h1>JSTLgugudan_B.jsp</h1>

	<c:set value="38" var="su"></c:set>
	jstl변수값출력 <c:out value="${su}"></c:out> <!-- 잘안씀.기본의기본방법 --><p>


	<c:set value="12" var="su2" />	
	<c:catch>
		<c:forEach var="i" begin="1" end="10" step="1">
			${su2} * ${i} = ${su*i } <br>
		</c:forEach>
	</c:catch>
	
	
	
	
	<c:catch var="errMsg">
		<c:set value="79" var="ab"/>
		<!-- jstl에는 if는 있지만 else는 없으므로 이렇게 써야한다.. -->
		<c:choose> <!-- 스위치문과 비슷. otherwise는 디폴트와 비슷 -->
			<c:when test="${num<0 }" > ${num}음수입니다 </c:when>
			<c:when test="${num==0 }" > ${num}제로입니다 </c:when>
			<c:when test="${num>0 }" > ${num}양수입니다 </c:when>
			<c:otherwise><h2>${num}숫자가 아닙니다 }</h2></c:otherwise>
		</c:choose>
	</c:catch> <c:out value="${errMsg}"/><br>
		

   	<p>
	<a href="JSTLgugudan_A.jsp">[JSTLgugudan_AX]</a>
	<a href="bbsList.jsp">[bbsList]</a>
</body>
</html>