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
		<div class="nav">
			<div class="menu" onclick="location.href='${ pageContext.servletContext.contextPath }/main'" style="margin-left:20px; margin-right:100px;">로고(임시)</div>
			<div class="menu" onclick="location.href='${ pageContext.servletContext.contextPath }/member/soup'" style="margin-left:160px; margin-right:20px;">일간랭킹</div>
			<div class="menu" onclick="location.href='${ pageContext.servletContext.contextPath }/member/week'">주간랭킹</div>
			<div class="menu" onclick="location.href='${ pageContext.servletContext.contextPath }/member/month'">월간랭킹</div>
			<div class="menu" onclick="location.href='${ pageContext.servletContext.contextPath }/member/database'">데이터베이스</div>
		</div>
</body>
</html>