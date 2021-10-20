<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	
	var files = new Image;
	files.src = "${ pageContext.servletContext.contextPath }/resources/images/${ requestScope.umaDetail.uma_name }2.png";
	
	
	files.onload=function(){
		$("#side").append("<a href='#' id='img2'>[승부복]</a>");
		$(function() {
			$("#img2").on("click", function(){
				$("#img").attr("src",files.src);
			});
			});
		
	};
	
</script>
<style>
body, table, div, p{ font-family: 'Nanum Gothic', sans-serif; }
body {
  background-color:#F0F0F0;
  margin-right: 200px;
  margin-left: 200px;
  height:980px;
}

/* Create two columns/boxes that floats next to each other */
aside {
  float: left;
  width: 600px;
  padding: 20px;
}

ul{
	padding:10px;
	
	border-width: 3px;
	border-color: gray;
  	border-style: solid;
}
li {
	list-style: none;
	font-size: 20px;
	margin-top : 10px;
}
/* Style the list inside the menu */
aside ul {
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
	background-color:white;
	width: 1200px;
	text-align:left;
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
	<div align="center">
	<br>
	<br>
		<section>
		<aside id="side">
		<img id="img" src="${ pageContext.servletContext.contextPath }/resources/images/${ requestScope.umaDetail.uma_name }.png" width="700px" >
		<br>
		<a href='#' id='img3'>[교복]</a>
		
		</aside>
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