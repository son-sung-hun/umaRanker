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
		<c:forEach var="uma" items="${ requestScope.umaList }">
		
			${ uma.uma_code }<br>
			${ uma.uma_name }<br>
			${ uma.height }cm<br>
			${ uma.weight }<br>
			${ uma.three_b }<br>
			${ uma.three_w }<br>
			${ uma.three_h }<br>
			${ uma.birth_day }<br>
			${ uma.uma_voice }<br>
			${ uma.uma_content }<br>
			
			<br>
			<br>
		</c:forEach>
	</div>
</body>
</html>