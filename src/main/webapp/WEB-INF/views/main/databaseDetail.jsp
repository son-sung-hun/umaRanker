<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
    
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
	
	var mainUniform = new Image;
	var gameUniform = new Image;
	var defaultArt = new Image;
	
	mainUniform.src = "${ pageContext.servletContext.contextPath }/resources/images/${ requestScope.umaDetail.uma_name }.png";
	gameUniform.src = "${ pageContext.servletContext.contextPath }/resources/images/${ requestScope.umaDetail.uma_name }_승부복.png";
	defaultArt.src = "${ pageContext.servletContext.contextPath }/resources/images/${ requestScope.umaDetail.uma_name }_원안.png";

	
	gameUniform.onload=function(){
		$("#side").append("<a href='#' id='img2' style='font-size: 18px; text-decoration:none; color:green;'>[ 승부복 ]</a>");
		$(function() {
			$("#img2").on("click", function(){
				$("#img").attr("src",gameUniform.src);
			});
			});
		
	};
	
	defaultArt.onload=function(){
		$("#side").append("<a href='#' id='img3' style='font-size: 18px; text-decoration:none; color:green;'>[ 원안 ]</a>");
		$(function() {
			$("#img3").on("click", function(){
				$("#img").attr("src",defaultArt.src);
			});
			});
		
	};
	
	$(function() {
		$("#img1").on("click", function(){
			$("#img").attr("src",mainUniform.src);
		});
	});
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
	padding:10px;
	
	border-width: 3px;
	
  	border-style: dotted;
}
li {
	list-style: none;
	font-size: 20px;
	margin-top : 10px;
	 font-weight: bold;
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
	<div align="center">
	<br>
	<br>
		<section>
		<aside id="side" align="center">
		<img id="img" src="${ pageContext.servletContext.contextPath }/resources/images/${ requestScope.umaDetail.uma_name }.png" width="700px" style="border-color: ${ requestScope.umaDetail.color_tag };">
		<br>
		<a href='#' id='img1' style='font-size: 18px; text-decoration:none; color:green;'>[ 교복 ]</a>
		
		</aside>
		 <article>
		 <ul style="border-color: ${ requestScope.umaDetail.color_tag };">
		 
		 	<c:set var="name" value="${ requestScope.umaDetail.uma_tag }"/>
		 	<c:set var="value" value="${fn:length(name)-5 }"/>
		 	<li style="font-size: 30px; color:${ requestScope.umaDetail.color_tag };">${ requestScope.umaDetail.uma_name } <a href="https://www.pixiv.net/tags/${requestScope.umaDetail.uma_tag }/illustrations"  target='_blank'><img id="logo" src="${ pageContext.servletContext.contextPath }/resources/images/pixiv_icon.png" width="25px" height="25px" style="vertical-align:top; margin-top : 5px;"></a></li>
			<li style="font-size: 15px; margin-top : 0px;">${fn:substring(name,0,value) }</li>
			<li>성우 : ${ requestScope.umaDetail.uma_voice }</li>
			<li>신장 : ${ requestScope.umaDetail.height }</li>
			<li>체중 : ${ requestScope.umaDetail.weight }</li>
			<li>쓰리사이즈 : B${ requestScope.umaDetail.three_b } W${ requestScope.umaDetail.three_w } H${ requestScope.umaDetail.three_h }</li>
			<li>생일 : ${ requestScope.umaDetail.birth_day }</li>
			<li style="font-size: 15px;">${ requestScope.umaDetail.uma_content }</li>
		 </ul>
			

			
			<a href="${ pageContext.servletContext.contextPath }/member/database"  style='font-size:18px; font-weight: bold; text-decoration:none; color:#00B11C;'>목록으로 돌아가기</a>
		</article>
		<br>
		<br>
		</section>
		
	</div>
</body>
</html>