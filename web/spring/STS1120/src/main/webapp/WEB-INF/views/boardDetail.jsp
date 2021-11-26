<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title> boardDetail.jsp </title>
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none;  color:green; font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline;  color:green; font-family: Comic Sans MS ; }
 </style>
 <script>
 	function confirmDelete(idx){
 		let check = confirm("페이지를 삭제하시겠습니까?");
		if(check==true){
			location.href("boardDelete.sp?idx="+idx);
 		}
 	}
 	
 	function confirmUpdate(idx){
 		let check = confirm("페이지를 수정하시겠습니까?");
		if(check==true){
			location.href("boardEdit.sp?idx="+idx);
 		}
 	}
 </script>

</head>
<body>
    
boardDetail.jsp 한건상세문서출력<br>  
<table border="1" width="900"  cellspacing="0" cellpadding="5px">
 	<tr align="center">
  	   <td colspan="2"> 
  	   	  >>>${dto.name} 님!!!  환영합니다 <<<
		</td>
  	</tr>
  	
  	<tr>
  		<td width="250"  rowspan="4" align="center" >
  		<a href="download.sp?idx=${dto.hobby_idx}&fname=${dto.img_file_name}">
  		 <img src="${pageContext.request.contextPath}/resources/upload/${dto.img_file_name}"  width="350" height="200"> 
  		</a>
  		</td> 
  		<td> 제목:${dto.title}    </td>
  	</tr> 	
  	<tr>
  	   <td> 내용:${dto.content}  </td>
  	</tr>
  	<tr>
  	   <td> 취미:${dto.hobby}  </td>
  	</tr>
   	<tr>  
  	   <td> 성별:${dto.gender}  </td>
  	</tr>
  	
  	<tr align="center">
  	   <td colspan="2"> 
  	   	    <a href="#">[login]</a>
  	   	    <a href="#" onclick=confirmDelete(${dto.hobby_idx});>[삭제]</a>
  	   	    <a href="#" onclick=confirmUpdate(${dto.hobby_idx});>[수정]</a>
  			<a href="boardWrite.sp">[하비등록]</a>
		    <a href="boardList.sp">[하비전체출력]</a>

			<a href="index.jsp">[index]</a>  	   
		</td>
  	</tr>
 </table>
 
 
 <c:import url="/reply.sp?hobby_idx=${dto.hobby_idx }"/>


</body>
</html>




















