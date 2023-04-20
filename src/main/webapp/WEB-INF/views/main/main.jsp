<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${ pageContext.servletContext.contextPath }/resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/images/favicon.ico" type="image/x-icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>우마랭커</title>
<script>
	const message = '${ requestScope.message }';
	if(message != null && message !== '') {
		alert(message);
	}
</script>
<style>
body, table, div, p{ font-family: 'Nanum Gothic', sans-serif; }
body {
  
  margin-right: 200px;
  margin-left: 200px;
  height:980px;
}

html{
background-image:url("${ pageContext.servletContext.contextPath }/resources/images/background.jpg");
}

/* Create two columns/boxes that floats next to each other */
aside {
  float: left;
  width: 600px;
  padding: 20px;
}

ul{
	padding:0px;
}
li {
	list-style: none;
	font-size: 20px;
	margin-top : 10px;
}
/* Style the list inside the menu */
nav ul {
  list-style-type: none;
  padding: 0;
}

aside img {
	width:auto;
	height:auto;
	border-width: 3px;
  	border-style: dotted;
}

article {
	width: 500px;
  margin-top : 200px;
  float: left;
}

section {
	width: 1200px;
	text-align:left;
	background-color: rgba(255, 255, 255, 0.60);
	height:970px;
}
/* Clear floats after the columns */
section::after {
  content: "";
  display: table;
  clear: both;
}


</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	<br>
	<br>
	<div align="center">
		<c:forEach var="daily" items="${ requestScope.daily }" varStatus="s">
		
		
			<c:if test="${s.first}">
				<section>
				<aside align="center">
				<img src="${ pageContext.servletContext.contextPath }/resources/images/${ daily.uma_name }.png" width="700px" style="border-color: ${ daily.color_tag };">
				</aside>
				<article>
				<c:choose>
					<c:when test="${ empty requestScope.count }">
						<a href="${ pageContext.servletContext.contextPath }/main?day_count=1" style="text-decoration:none; font-size: 20px; color:green;">◀</a>
						<span style="font-size: 20px; font-weight: bold;">기준 날짜 : ${ updateDate }</span>
					</c:when>
					
					<c:when test="${ requestScope.count eq 0 }">
						<a href="${ pageContext.servletContext.contextPath }/main?day_count=1" style="text-decoration:none; font-size: 20px; color:green;">◀</a>
						<span style="font-size: 20px; font-weight: bold;">기준 날짜 : ${ updateDate }</span>
					</c:when>
					
					<c:otherwise>
						<a href="${ pageContext.servletContext.contextPath }/main?day_count=${ requestScope.count+1 }" style="text-decoration:none; font-size: 20px; color:green;">◀</a>
						<span style="font-size: 20px; font-weight: bold;">기준 날짜 : ${ updateDate }</span>
						<a href="${ pageContext.servletContext.contextPath }/main?day_count=${ requestScope.count-1 }" style="text-decoration:none; font-size: 20px; color:green;">▶</a>
					</c:otherwise>
				</c:choose>
				<br>	
				
				<br>
				<p style="font-size: 30px; margin:0px; font-weight: bold;">오늘의 인기 우마무스메는??</p>
				<h1><c:if test="${requestScope.birth eq true}">
				🎂
				</c:if>
				<a href="${ pageContext.servletContext.contextPath }/database/detail?uma_code=${ daily.uma_code }" style="text-decoration:none; color:${ daily.color_tag };">${ daily.uma_name }</a>
				<c:if test="${requestScope.birth eq true}">
                🎂
                </c:if>
					<c:if test="${requestScope.size ne 1}">
					외 
					<c:out value="${requestScope.size-1}"/>
					명
					</c:if>
				</h1>
				<h1>오늘의 언급횟수 (
				<a href="https://www.pixiv.net/tags/${daily.uma_tag }/illustrations" style="color:#055AFF; text-decoration:none;" target='_blank'>픽시브</a>
				) : ${ daily.pixiv_count } 회</h1>
				</article>
				</section>
			</c:if>
			
			
				
		
		
		

		</c:forEach>
	</div>
</body>
</html>