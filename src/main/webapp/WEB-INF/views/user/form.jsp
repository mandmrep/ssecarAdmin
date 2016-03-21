<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">

	
	<form class="login-form" action="/j_spring_security_check" method="post">
		<div class="login-wrap">
			<p class="login-img">
				<i class="icon_lock_alt"></i>
			</p>
			<div class="input-group">
				<span class="input-group-addon"><i class="icon_profile"></i></span>
				<input type="text" name="userid" class="form-control" placeholder="username" autofocus>
			</div>
			<div class="input-group">
				<span class="input-group-addon"><i class="icon_key_alt"></i></span>
				<input type="password" name="password" class="form-control" placeholder="Password">
			</div>
			<c:if test="${param.error == 'true'}">
				<strong>아이디와 비밀번호가 일치하지 않습니다.</strong>
			</c:if>
			<button class="btn btn-primary btn-lg btn-block" type="submit">Login</button>
		</div>
	</form>

</div>


