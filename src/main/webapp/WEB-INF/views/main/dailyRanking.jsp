<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	const message = '${ requestScope.message }';
	if(message != null && message !== '') {
		alert(message);
	}
</script>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<br>
	<div align="center">
		일간랭킹 페이지
		<br>
		오늘의 인기 우마무스메는 ?
		<br> 
		<c:forEach var="rank" items="${ requestScope.pixivRanking }">
		
			${ rank.pixiv_rank }위 : ${ rank.uma_name } (총 ${ rank.pixiv_count } 개)
			<br>
			<br>
		</c:forEach>
		<br>
		<br>
		
	</div>
</body>
</html>