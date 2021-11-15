<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title></title>
  
 <script type="text/javascript">
   var Gflag=false; //전역변수

   function nullCheck(){
      var a = myform.code.value;
      var code_size = document.myform.code.value.length; //입력란 문자열길이 
      var b = document.myform.title.value;  //제목
      var c = document.myform.pay.value;  //급여
      var d = document.myform.email.value; //메일   
      
      if(a=="" || a==null){
	      alert("code 데이터가 공백입니다");
	      myform.code.focus();
	      return; 
	  }else{ myform.title.focus();}

      if(b=="" || b==null){
        alert("제목입력란 데이터가 공백입니다\n제목 데이터를 정확하게 입력하세요");
        myform.title.focus();
        return; 
      }else{ myform.pay.focus();}
      
      if(c=="" || c==null){
	        alert("급여입력란 데이터가 공백입니다");
	        myform.pay.focus();
	        return; 
	   }else{ myform.email.focus();}

      
      if (d=="" || d==null){
         document.getElementById("email_ch").innerHTML="<font style='font-size:10pt;'>*메일데이터를 입력하세요*</font>";
         myform.user_email.focus();
         return; 
      }else {
       var mail_reg = /^([a-zA-Z0-9_\.]{3,7})@([a-zA-Z]{2,7})\.([a-zA-Z]{2,5})$/ ;
       if(mail_reg.test(d)==false){
          document.getElementById("email_ch").innerHTML="<font style='font-size:10pt;'>*sky@nate.com형식 참고하세요*</font>";
          //myform.email.value="";
          myform.email.focus();
          return;
       }else{document.getElementById("email_ch").innerHTML=""; }    
      }
      
      //전역변수
      if(Gflag==false){
    	 alert("아이디=코드=id=주민번호 중복체크 하셔야 합니다");
    	 return;
      }
      
      if(confirm("선택한 데이터 내용이 맞습니까")==true){ //alert(),confirm(),submit(),open(),
  		 document.myform.submit(); 
  	  }
   }//nullCheck end
   
   
   function idCheck(){
	  var dcode = myform.code.value; //7789
	  var dcode_size = document.myform.code.value.length;  

       if(dcode=="" || dcode==null){
	     alert("code체크 데이터가 공백입니다");
	     myform.code.focus();
	     return; 
	  }
       
       if(dcode_size != 4){
              alert("코드데이터는 4글자입니다");
              myform.code.value="";
              myform.code.focus();
              return; 
          } 
       
      window.open("openID.jsp?idx="+dcode, "bb", "width=500,height=200,left=700,top=200");
      Gflag=true;
      //openID.jsp
      //window내장개체는 생략가능 
   }//idCheck end
   
   
function codeNumber(){
       var code = myform.code.value;
       var code_size = document.myform.code.value.length; 
       for(i=0; i<code_size; i++){
           if(code.charAt(i)<'0' || code.charAt(i)>'9'){
               alert("숫자를 입력하셔야 합니다");
               //myform.code.value=""; 입력내용전체 삭제
               myform.code.value= code.substring(0,i); //79b ====>b문자만 삭제 
               //myform.code.value= code.substr(0,i);  //79b ====>b문자만 삭제 
                myform.code.focus()
             }
       }//for end
    }//codeNumber end
</script>
 
<style>
    *{font-size:16pt;}
    a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
    a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; } }
    #email_ch{
       color: red;
       font-size: 14pt;
    }
</style>
</head>
<body>
	<h2> guestWrite.jsp </h2>
	<form name="myform" method="get" action="guestSave.jsp">
	    코드: <input type="text" name="code"   size="8"> 
	         <input type="button"  onclick="idCheck();"  value="id중복체크"  > <span></span> <br>
	    제목: <input type="text" name="title" value="sky"> <span></span> <br>
	    급여: <input type="text" name="pay" value="95"> <span></span> <br>
	    메일: <input type="text" name="email" id="email"  value="bit@camp.com"> <span id="email_ch"></span> <br>
	    
	    <input type="button" onclick="nullCheck();" value="버튼저장">
	    <input type="reset" value="입력취소">
	    <input type="submit" value="서브밋저장">
	</form>
	

	<p>
	<a href="login.jsp">[login]</a>
	<a href="guestWrite.jsp">[방명록등록]</a>
	<a href="guestList.jsp">[전체출력]</a>
</body>
</html>















