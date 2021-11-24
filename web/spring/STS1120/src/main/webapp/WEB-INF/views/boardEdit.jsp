<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
  <style type="text/css">
   *{font-size: 16pt;  }
   a{font-size: 16pt;   text-decoration:none; color:blue ;}
   a:hover{font-size: 20pt; font-weight: bold;   text-decoration:underline; color:green ;  }
  </style>
  <script>
  function handleFileSelect(event){
      if (event.target.files && event.target.files[0]) {
         var reader = new FileReader();
         reader.onload = function(event) {
            document.getElementById("preview").src=event.target.result;
         };
         reader.readAsDataURL(event.target.files[0]);
      }
   }
  function default_img(path){
	  document.getElementById("preview").src=path
  }
  </script>

 <title>boardEdit.jsp</title>
</head>

<body>
 <font color=blue>[boardEdit.jsp=수정화면폼]</font> <br>

  <form  method="post" enctype="multipart/form-data" action="boardEditSave.sp" >
      이름수정: <input type="text" name="name" value=${dto.name }> <br>
      제목수정: <input type="text" name="title" value=${dto.title }> <br>
      내용수정: <textarea rows="3" cols="20"  name="content">${dto.content }</textarea> <br>
      성별수정:
      	 <c:choose>
      	 	<c:when test = "${dto.gender =='man' }">
      	 		<input type="radio" name="gender" value="man" checked>남자 
      			<input type="radio" name="gender" value="woman">여자 <br>
      	 	</c:when>
      	 	<c:otherwise>
      	 		<input type="radio" name="gender" value="man">남자 
      			<input type="radio" name="gender" value="woman" checked>여자 <br>
      	 	</c:otherwise>
      	 </c:choose>
      취미수정:
	     <c:choose>
	    	<c:when test = "${fn:contains(dto.hobby,'game')}"><input type="checkbox" name="hobby" value="game" checked>게임</c:when>
	      	<c:otherwise><input type="checkbox" name="hobby" value="game">게임</c:otherwise>
	 	 </c:choose>
		 <c:choose>
		  	<c:when test = "${fn:contains(dto.hobby,'study')}"><input type="checkbox" name="hobby" value="study" checked>공부</c:when>
	 	  	<c:otherwise><input type="checkbox" name="hobby" value="study">공부</c:otherwise>
		 </c:choose>
		 <c:choose>
		   	<c:when test = "${fn:contains(dto.hobby,'ski')}"><input type="checkbox" name="hobby" value="ski" checked>스키</c:when>
	 	  	<c:otherwise><input type="checkbox" name="hobby" value="ski">스키</c:otherwise>
		 </c:choose>
		 <c:choose>
		   	<c:when test = "${fn:contains(dto.hobby,'movie')}"><input type="checkbox" name="hobby" value="movie" checked>영화</c:when>
	 	  	<c:otherwise><input type="checkbox" name="hobby" value="movie">영화</c:otherwise>
		 </c:choose>
	  <br>
     <!-- 파일수정: <input type="file" name="upload_f"><p> -->
      파일: <img id="preview" src="${pageContext.request.contextPath}/resources/upload/${dto.img_file_name}"  width="350" height="200"> 
      <br> &nbsp &nbsp &nbsp &nbsp &nbsp 
      <input type="file" name="upload_f" onchange="handleFileSelect(event)"><p>
         
      <input type="hidden" name="hobby_idx" value=${dto.hobby_idx }>
      <input type="hidden" name="default_f" value=${dto.img_file_name }>
      
      <input type="submit" value="스프링hobby테이블수정">
      <input type="reset" onclick="default_img('${pageContext.request.contextPath}/resources/upload/${dto.img_file_name}')" value="입력취소">

  </form>  
  
 <p>
 <h2>  
   <a href="boardWrite.sp">[board글쓰기]</a>
   <a href="boardList.sp">[board전체출력]</a>
   <a href="kakao.sp">[home]</a>
   <a href="index.jsp">[index]</a>
 </h2>
</body>
</html>
