<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title> guestDetail.jsp </title>
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
 </style>
<script>
	function deleteq(){
		var delCheck=confirm("정말로 지우시겠습니까?");
		if(delCheck==true){
			location.href("gDelete.camp?idx=${LG.code}");	
		}
	}


</script>

</head>
<body>
<p></p>
	    
<table border="1" width="900"  cellspacing="0" cellpadding="20px">
   <tr align="center">
   	 <td colspan="2">
   	 	<font style="font-size:26pt;color:blue; font-weight:bold;"> guestDetail.jsp 상세페이지 </font> 
   	  </td>
   </tr>
  	<tr>
  	  <td width="250"  rowspan="4" align="center" >
  		  <img src="images/bbb.gif" width="350" height="200"> 
  	  </td> 
  	   <td> 코드: ${LG.code}  </td>
  	</tr> 	
  	<tr>
  	   <td> 제목: ${LG.title}  </td>
  	</tr>
  	<tr>
  	   <td> 급여:${LG.pay}  </td>
  	</tr>
   	<tr>  
  	   <td> 메일: ${LG.email }  </td>
  	</tr>
  	
  	<tr align="center">
  	   <td colspan="2"> 
  	   	    <a href="index.jsp">[index]</a>
  			<a href="guestList">[guestList서블릿]</a>
  			<a href=# onclick="deleteq()";>[삭제]</a>
  			<a href="guestWrite.jsp">[guest등록화면]</a>
  			 <a href="#">[수정]</a>
  	   </td>
  	</tr>
 </table>

</body>
</html>




















