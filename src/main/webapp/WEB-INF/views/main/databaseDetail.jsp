<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
    
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<head>
<link rel="shortcut icon" href="${ pageContext.servletContext.contextPath }/resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/images/favicon.ico" type="image/x-icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=M+PLUS+Rounded+1c&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>우마랭커</title>
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
		$("#side").append("<a href='#' id='img2' style='font-size: 21px; text-decoration:none; color:#3d414d;'>[ 승부복 ]</a>");
		$(function() {
			$("#img2").on("click", function(){
				$("#img").attr("src",gameUniform.src);
			});
			});
		
	};
	
	defaultArt.onload=function(){
		$("#side").append("<a href='#' id='img3' style='font-size: 21px; text-decoration:none; color:#3d414d;'>[ 원안 ]</a>");
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
@font-face {
    font-family: 'GyeonggiTitleM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GyeonggiTitleM.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
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
	
  	border-style: solid;
}
li {
	list-style: none;
	font-size: 21px;
	margin-top : 10px;
	 
}
/* Style the list inside the menu */
aside ul {
  list-style-type: none;
  padding: 0;
}

aside img {
	width:500px;
	height:auto;
	border-width: 3px;
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
		<img id="img" src="${ pageContext.servletContext.contextPath }/resources/images/${ requestScope.umaDetail.uma_name }.png" width="700px" style="border-color: #3d414d;">
		<br>
		<a href='#' id='img1' style='font-size: 21px; text-decoration:none; color:#3d414d;'>[ 교복 ]</a>
		
		</aside>
		 <article>

		 <ul style="border-color: #3d414d;">
		 		<c:choose>
					<c:when test="${ requestScope.umaDetail.uma_code eq 1 }">
						<a href="${ pageContext.servletContext.contextPath }/database/detail?uma_code=${ requestScope.umaDetail.uma_code+1 }"  style="text-decoration:none; font-size: 20px; color:#3d414d;">▶</a>
					</c:when>
					
					<c:when test="${ requestScope.umaDetail.uma_code eq 94 }">
						<a href="${ pageContext.servletContext.contextPath }/database/detail?uma_code=${ requestScope.umaDetail.uma_code-1 }"  style="text-decoration:none; font-size: 20px; color:#3d414d;">◀</a>
					</c:when>
					
					<c:otherwise>
						<a href="${ pageContext.servletContext.contextPath }/database/detail?uma_code=${ requestScope.umaDetail.uma_code-1 }" style="text-decoration:none; font-size: 20px; color:#3d414d;">◀</a>
						<a href="${ pageContext.servletContext.contextPath }/database/detail?uma_code=${ requestScope.umaDetail.uma_code+1 }"  style="text-decoration:none; font-size: 20px; color:#3d414d;">▶</a>
					</c:otherwise>
				</c:choose>

		 	<c:set var="name" value="${ requestScope.umaDetail.uma_tag }"/>
		 	<c:set var="value" value="${fn:length(name)-5 }"/>

		 	<li style="font-size: 15px; color:#3d414d; font-weight: bold;">
		 	월간 랭킹 ${ requestScope.monthlyRank }위
                <c:choose>
                     <c:when test="${ requestScope.rankResult eq 'increase' }">
                     <img id="result" src="${ pageContext.servletContext.contextPath }/resources/images/increase.png"/><span style="font-size: 12px; color:#139020; font-weight: bold;"> ${ requestScope.rankVariance }</span>
                     </c:when>

                     <c:when test="${ requestScope.rankResult eq 'decrease' }">
                     <img id="result" src="${ pageContext.servletContext.contextPath }/resources/images/decrease.png"/><span style="font-size: 12px; color:#d31a45; font-weight: bold;"> ${ requestScope.rankVariance }</span>
                     </c:when>

                     <c:otherwise>
                     <img id="result" src="${ pageContext.servletContext.contextPath }/resources/images/noChange.png"/>
                     </c:otherwise>
                </c:choose>
		 	</li>
		 	<li style="font-size: 30px; color:${ requestScope.umaDetail.color_tag };  font-weight: bold;">${ requestScope.umaDetail.uma_name } <a href="https://www.pixiv.net/tags/${requestScope.umaDetail.uma_tag }/illustrations"  target='_blank'><img id="logo" src="${ pageContext.servletContext.contextPath }/resources/images/pixiv_icon.png" width="25px" height="25px" style="vertical-align:unset; margin-top : 5px;"></a></li>
			<li style="font-family: 'M PLUS Rounded 1c', sans-serif; color:${ requestScope.umaDetail.color_tag }; font-size: 15px; font-weight: bold; margin-top : 0px;">${fn:substring(name,0,value) }</li>
			<li><hr align="left" size="1"  width="50%" color = "#3d414d"></li>
			<li class="medium">성우 : ${ requestScope.umaDetail.uma_voice }</li>
			<li class="medium">신장 : ${ requestScope.umaDetail.height }</li>
			<li class="medium">체중 : ${ requestScope.umaDetail.weight }</li>
			<li class="medium">쓰리사이즈 : B :${ requestScope.umaDetail.three_b } W :${ requestScope.umaDetail.three_w } H :${ requestScope.umaDetail.three_h }</li>
			<li class="medium">생일 : ${ requestScope.umaDetail.birth_day }</li>
			<li><hr align="left" size="1" width="50%" color = "#3d414d"></li>
			<li class="regular" style="font-size: 15px;"><span style="font-family: 'Noto Sans KR', sans-serif;">${ requestScope.umaDetail.uma_content }</span></li>
		 </ul>
			

			
			<a href="${ pageContext.servletContext.contextPath }/database" class="medium" style='font-size:21px; text-decoration:none; color:#3d414d;'>목록으로 돌아가기</a>
		</article>
		<br>
		<br>
		</section>
		
	</div>
</body>
</html>