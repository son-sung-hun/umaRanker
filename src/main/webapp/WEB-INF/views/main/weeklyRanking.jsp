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
		주간랭킹 페이지
		<br>
		이번 주의 인기 우마무스메는 ?
		<br> 
		기준 날짜 : ${ updateDate }
		<br> 
		<br> 
		<c:forEach var="rank" items="${ requestScope.pixivRanking }">
		
			${ rank.pixiv_rank }위 : <a href="${ pageContext.servletContext.contextPath }/member/detail?uma_code=${ rank.uma_code }"style="text-decoration:none; color:green;" >${ rank.uma_name }</a> (총 ${ rank.pixiv_count } 개)
			<br>
			<br>
		</c:forEach>
		<br>
		<br>
		
	</div>
</body>
</html>