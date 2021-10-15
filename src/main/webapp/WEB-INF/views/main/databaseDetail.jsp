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
		 
			<p>${ requestScope.umaDetail.uma_name }</p><br>
			성우 : ${ requestScope.umaDetail.uma_voice }<br>
			신장 : ${ requestScope.umaDetail.height }<br>
			체중 : ${ requestScope.umaDetail.weight }<br>
			쓰리사이즈 : B${ requestScope.umaDetail.three_b } W${ requestScope.umaDetail.three_w } H${ requestScope.umaDetail.three_h }<br>
			생일 : ${ requestScope.umaDetail.birth_day }<br>
			${ requestScope.umaDetail.uma_content }<br>

			<br>
			<br>
			
			<a href="${ pageContext.servletContext.contextPath }/member/database" >뒤로가기</a>
		<br>
		<br>
		
	</div>
</body>
</html>