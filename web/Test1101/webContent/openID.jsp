<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<style>
#code_ch{
	color:red;
	font-size:15pt;
	margin-left:30pt;
}
#use_ch{
	color:red;
	font-size:15pt;
	margin-left:30pt;
}

</style>
<%

String getCode=request.getParameter("idx");

msg="select * from guest where code=?";
PST=CN.prepareStatement(msg);
PST.setString(1, getCode);
int OK=PST.executeUpdate();
int count=0;
if(OK>0){
	count=-1;
	System.out.println("zz");
}

%>


<script>

	let code_reg = /^[0-9]{4}$/;
	let codeFlag=false;
	let tmp;
	
	function setCode(){
		document.getElementById("code").value = <%=getCode%>
	}
	function checkCode(){
		
		let code = document.getElementById("code").value;
		
		if(codeFlag==true){
			if(code_reg.test(code) == true){
				location.replace("openID.jsp?idx="+code);
				}
			else{	
				document.getElementById("code_ch").innerHTML = "code에는 4자리 숫자를 입력해주세요";
				codeFlag=true;
				return;
				}
			}
		if(<%=count%>==-1){
			document.getElementById("code_ch").innerHTML="중복된code입니다. 다른code를입력해주세요";
			codeFlag=true;	
			return;
			}
		else{
			document.getElementById("code_ch").innerHTML="사용가능한 code입니다.";
			tmp=code;
			codeFlag=true;
			}
		}
	
	function useCode(){
		if(tmp==document.getElementById("code").value){
			document.getElementById("use_ch").innerHTML="";
			window.opener.document.getElementById("code").value = document.getElementById("code").value;
			window.opener.cCheck();
			self.close();
		}
		else{
			document.getElementById("use_ch").innerHTML="중복확인을 해주세요";
		}
	}
	

</script>

<title>아이디 중복검사</title>

</head>
<body onload=setCode();checkCode();>

	<img src="images/bar.gif">
	<div>
		code : 
		<input type="text" id="code" size=4> 
		<input type="button" id="codebutton" value="중복검사" onclick=checkCode();><br>
	</div>
	<div>
		<span id="code_ch"></span>
	</div>
	<div>
		<input type="button" id="useCode" value="사용하기" onclick=useCode();>
	</div>
	<span id="use_ch"></span>
	
</body>
</html>