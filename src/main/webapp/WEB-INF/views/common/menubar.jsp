<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">
</head>
<body>
	<h1 align="center">Finally, Spring Web MVC Project!!!</h1>
	
	<br>
	
	<div class="loginArea" align="right">
	<c:if test="${ empty sessionScope.loginMember }">
		<form action="${ pageContext.servletContext.contextPath }/member/login" method="post">
			<table id="loginTable" style="text-align:center;">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"></td>
					<td rowspan="2">
						<button id="loginBtn" class="btn-login">로그인</button>
					</td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td colspan="3">
						<a href="${ pageContext.servletContext.contextPath }/member/regist">회원가입</a>
						<a href="#">아이디/비밀번호 찾기</a>
					</td>
				</tr>
			</table>
		</form>
	</c:if>
	<c:if test="${ !empty sessionScope.loginMember }">
		<h3 align="right"><c:out value="${ sessionScope.loginMember.name }님 환영합니다."/></h3>
		<button>정보수정</button>
		<button onclick="location.href='${ pageContext.servletContext.contextPath }/member/logout'">로그아웃</button>
	</c:if>
	</div>
	<div class="menubar">
		<div class="nav">
			<div class="menu" onclick="location.href='${ pageContext.servletContext.contextPath }/member/soup'">일간랭킹</div>
			<div class="menu" onclick="location.href='${ pageContext.servletContext.contextPath }/member/week'">주간랭킹</div>
			<div class="menu" onclick="location.href='${ pageContext.servletContext.contextPath }/member/month'">월간랭킹</div>
			<div class="menu">데이터베이스</div>
		</div>
		
	</div>
</body>
</html>