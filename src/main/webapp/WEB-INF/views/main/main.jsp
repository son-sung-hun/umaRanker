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
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin-right: 200px;
  margin-left: 200px;
}

/* Create two columns/boxes that floats next to each other */
nav {
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

nav img {
	width:auto;
	height:auto;
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
		
		<section>
		<nav>
		<img src="${ pageContext.servletContext.contextPath }/resources/images/${ requestScope.daily.uma_name }.png" width="700px">
		</nav>
		<article>
		오늘의 인기 우마무스메는??
		<h1><a href="${ pageContext.servletContext.contextPath }/member/detail?uma_code=${ daily.uma_code }" style="text-decoration:none; color:green;">${ daily.uma_name }</a></h1>
		<h1>오늘의 언급횟수(픽시브) : ${ requestScope.daily.pixiv_count } 회</h1>
		</article>
		</section>
	</div>
</body>
</html>