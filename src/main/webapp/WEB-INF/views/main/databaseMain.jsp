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
		데이터베이스
		<br>
		<br>
		<br> 
		 
		<c:forEach var="uma" items="${ requestScope.umaData }">
			
			
			<a href="${ pageContext.servletContext.contextPath }/member/detail?uma_code=${ uma.uma_code }" style="text-decoration:none; color:green;">${ uma.uma_name }</a>
			<br>
			<br>
		</c:forEach>
		<br>
		<br>
		
	</div>
</body>
</html>