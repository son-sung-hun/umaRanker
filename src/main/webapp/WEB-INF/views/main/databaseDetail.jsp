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
	<div align="center">
	<jsp:include page="../common/menubar.jsp"/>
	<br>
	
		<br>
		<section>
		<nav>
		<img src="${ pageContext.servletContext.contextPath }/resources/images/${ requestScope.umaDetail.uma_name }.png" width="700px">
		</nav>
		 <article>
		 <ul>
		 	<li style="font-size: 30px;">${ requestScope.umaDetail.uma_name }</li>
			<li>성우 : ${ requestScope.umaDetail.uma_voice }</li>
			<li>신장 : ${ requestScope.umaDetail.height }</li>
			<li>체중 : ${ requestScope.umaDetail.weight }</li>
			<li>쓰리사이즈 : B${ requestScope.umaDetail.three_b } W${ requestScope.umaDetail.three_w } H${ requestScope.umaDetail.three_h }</li>
			<li>생일 : ${ requestScope.umaDetail.birth_day }</li>
			<li style="font-size: 15px;">${ requestScope.umaDetail.uma_content }</li>
		 </ul>
			

			<br>
			<br>
			
			<a href="${ pageContext.servletContext.contextPath }/member/database" >뒤로가기</a>
		</article>
		<br>
		<br>
		</section>
		
	</div>
</body>
</html>