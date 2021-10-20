<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
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
	border-color: gray;
  	border-style: solid;
}

article {
	width: 500px;
  margin-top : 200px;
  float: left;
}

section {
	width: 1200px;
	text-align:left;
	background-color:white;
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
	<div align="center">
		<c:forEach var="daily" items="${ requestScope.daily }" varStatus="s">
		
		
			<c:if test="${s.last }">
				<section>
				<aside>
				<img src="${ pageContext.servletContext.contextPath }/resources/images/${ daily.uma_name }.png" width="700px">
				</aside>
				<article>
				<c:choose>
					<c:when test="${ empty requestScope.count }">
						<a href="${ pageContext.servletContext.contextPath }/main?day_count=1" style="text-decoration:none; color:green;">◁</a>
						기준 날짜 : ${ updateDate }
					</c:when>
					
					<c:when test="${ requestScope.count eq 0 }">
						<a href="${ pageContext.servletContext.contextPath }/main?day_count=1" style="text-decoration:none; color:green;">◁</a>
						기준 날짜 : ${ updateDate }
					</c:when>
					
					<c:otherwise>
						<a href="${ pageContext.servletContext.contextPath }/main?day_count=${ requestScope.count+1 }" style="text-decoration:none; color:green;">◁</a>
						기준 날짜 : ${ updateDate }
						<a href="${ pageContext.servletContext.contextPath }/main?day_count=${ requestScope.count-1 }" style="text-decoration:none; color:green;">▷</a>
					</c:otherwise>
				</c:choose>
				<br>	
				
				<br>
				오늘의 인기 우마무스메는??
				<h1><a href="${ pageContext.servletContext.contextPath }/member/detail?uma_code=${ daily.uma_code }" style="text-decoration:none; color:green;">${ daily.uma_name }</a>
					<c:if test="${s.index ne '0'}">
					외 
						${s.index }
					명
					</c:if>
				</h1>
				<h1>오늘의 언급횟수(픽시브) : ${ daily.pixiv_count } 회</h1>
				</article>
				</section>
			</c:if>
			
			
				
		
		
		

		</c:forEach>
	</div>
</body>
</html>