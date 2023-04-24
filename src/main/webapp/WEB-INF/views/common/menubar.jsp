<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">
<style>
@font-face {
    font-family: 'GyeonggiTitleM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GyeonggiTitleM.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
</head>
<body>
		<div class="nav">
			<div class="menu" onclick="location.href='${ pageContext.servletContext.contextPath }/main'" style="margin-left:20px; margin-right:50px;">
			<b class="light" style="color:#ffdd00; font-size: 24px;">우마</b><b class="light" style="color:#ffd0b0; font-size: 24px;">랭커</b>
			</div>
			<div class="menu light" onclick="location.href='${ pageContext.servletContext.contextPath }/day'" style="margin-left:10px; margin-right:20px;">🥕일간랭킹</div>
			<div class="menu light" onclick="location.href='${ pageContext.servletContext.contextPath }/week'">🥕주간랭킹</div>
			<div class="menu light" onclick="location.href='${ pageContext.servletContext.contextPath }/month'">🥕월간랭킹</div>
			<div class="menu light" onclick="location.href='${ pageContext.servletContext.contextPath }/database'">🐎데이터베이스</div>
		</div>
</body>
</html>