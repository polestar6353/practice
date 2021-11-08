<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> zoompig.jsp  </title>

 <style type="text/css">
   *{ font-size: 16pt;  }
   a{ font-size: 16pt; text-decoration: none; }
   a:hover{ font-size: 20pt; text-decoration: underline; }
 </style>
 
 <script type="text/javascript">
     function nullCheck(){
        //동물체크 도전 
         var flag=false;
         var size=myform.hobby.length;
         for(var i=0; i<size; i++){
             if(myform.hobby[i].checked==true){
            	 flag=true;
                 break;
             }
         }
     
         if(flag==false){
             alert("동물like 하나선택은 필수옵션입니다");
             myform.hobby[0].focus();
             return  ; 
         }
         
  	   if(confirm("선택한 데이터 내용이 맞습니까")==true){
  		  document.myform.submit(); 
  	   }
    }//nullCheck end
 </script>
 
</head>
<body>
    <form name="myform"  method="get" action="zoompigSave.jsp">
      <fieldset>
      	<legend> [zoompig.jsp]</legend>
   		*좋아하는 동물을 선택하세요* <br>
   		 <input type="checkbox" name="hobby" value="pig" >돼지
   		 <input type="checkbox" name="hobby" value="chick">치킨
   		 <input type="checkbox" name="hobby" value="crab">크랩
   		 <input type="checkbox" name="hobby" value="tiger">tiger
   		 <input type="checkbox" name="hobby" value="whale">돌고래 <br>
   		 <input type="button" value="button전송" onclick="nullCheck();"> &nbsp;
         <input type="reset" value="취소">  
   	  </fieldset>
  </form>
  
  <p>
  <a href="zoompig.jsp">[zoompig등록]</a>
  <a href="guestWrite.jsp">[guestWrite]</a>
</body>
</html>







