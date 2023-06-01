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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
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
			<div class="menu light" style="font-family: 'Noto Sans KR', sans-serif;" onclick="location.href='${ pageContext.servletContext.contextPath }/day'" style="margin-left:10px; margin-right:20px;"><img src="${ pageContext.servletContext.contextPath }/resources/images/uma_icon.png" width="23px" height="23px" style="vertical-align:text-bottom;">일간랭킹</div>
			<div class="menu light" style="font-family: 'Noto Sans KR', sans-serif;" onclick="location.href='${ pageContext.servletContext.contextPath }/week'"><img src="${ pageContext.servletContext.contextPath }/resources/images/uma_icon.png" width="23px" height="23px" style="vertical-align:text-bottom;">주간랭킹</div>
			<div class="menu light" style="font-family: 'Noto Sans KR', sans-serif;" onclick="location.href='${ pageContext.servletContext.contextPath }/month'"><img src="${ pageContext.servletContext.contextPath }/resources/images/uma_icon.png" width="23px" height="23px" style="vertical-align:text-bottom;">월간랭킹</div>
			<div class="menu light" style="font-family: 'Noto Sans KR', sans-serif;" onclick="location.href='${ pageContext.servletContext.contextPath }/database'"><img src="${ pageContext.servletContext.contextPath }/resources/images/uma_icon.png" width="23px" height="23px" style="vertical-align:text-bottom;">데이터베이스</div>
			<div class="" style="display:inline-block; width:170px; height:50px; text-align:center; line-height:50px;">
              <input type="text" placeholder="검색어 입력">
            </div>
		</div>
</body>
</html>