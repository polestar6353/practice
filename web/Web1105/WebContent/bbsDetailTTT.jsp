<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title> guestDetail.jsp </title>
 <style type="text/css">
   *{font-size:20pt;}
   a{font-size:20pt; text-decoration:none;  color:green; font-family: Comic Sans MS ; }
   a:hover{font-size:24pt; text-decoration:underline;  color:green; font-family: Comic Sans MS ; }
 </style>
</head>
<body>
    
<table border="1" width="900"  cellspacing="0" cellpadding="20px">
 	<tr align="center">
  	   <td colspan="2"> 
  	   	  >>> ${daum.name}님!!!  환영합니다 <<<
		</td>
  	</tr>
  	
  	<tr>
  		<td width="250"  rowspan="4" align="center" >
  		  <img src="images/bbb.gif" width="350" height="200"> 
  		</td> 
  		<td> 사번:  ${daum.sabun}  </td>
  	</tr> 	
  	<tr>
  	   <td> 제목: ${daum.title}  </td>
  	</tr>
  	<tr>
  	   <td> 급여: ${daum.pay}  </td>
  	</tr>
   	<tr>  
  	   <td> 메일: ${daum.email} </td>
  	</tr>
  	
  	<tr align="center">
  	   <td colspan="2"> 
  	   	    <a href="login.jsp">[login]</a>
  			<a href="bbsWrite.jsp">[bbs등록]</a>
		    <a href="bbsSelect.bit">[bbs전체출력]</a>
			<a href="index.jsp">[index]</a>  	   
		</td>
  	</tr>
 </table>
 
</body>
</html>




















