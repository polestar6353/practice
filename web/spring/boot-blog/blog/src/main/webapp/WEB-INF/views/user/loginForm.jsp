<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form action="/auth/loginProc" method="post">
		<div class="form-group">
			<label for="username">Username</label> 
			<input type="text" name="username" class="form-control" placeholder="Enter username" id="username">
		</div>
		<div class="form-group">
			<label for="password">Password</label> 
			<input type="password" name="password" class="form-control" placeholder="Enter password" id="password">
		</div>

		<button id="btn-login" class="btn btn-primary">로그인</button>
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=a3b182db12165391370114569a56abbf&redirect_uri=http://localhost:8000/auth/kakao/callback&response_type=code"><img height=38px src="/image/kakao_login_button.png"></a>
	</form>


</div>

<!-- <script src="/js/user.js"></script> 전통적인 로그인 방식에서는, 해당 태그를
주석해제하고 #btn-login 버튼을 밖으로 뺀 뒤 action을 없애면 된다.
-->
<%@ include file="../layout/footer.jsp"%>


