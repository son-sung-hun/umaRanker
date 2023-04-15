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
<style type="text/css">
body, table, div, p{ font-family: 'Nanum Gothic', sans-serif; }

html{
background-image:url("${ pageContext.servletContext.contextPath }/resources/images/background.jpg");
}
body {
width: 1200px;
  background-color: rgba(255, 255, 255, 0.60);
  height:100%;
}
ul{
	width:1100px;
	display:flex;
	flex-wrap : wrap;
}
li {
	list-style: none;
	font-size: 20px;
	margin-top:15px;
}
.sa {
		opacity: 0;
        transition: all .5s ease;
    }


.sa-up {
        transform: translate(0, 100px);
       }
.sa.show {
        opacity: 1;
        transform: none;
      }

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<br>
	<br>
	<br>
	<div align="center">
	<br>
	<h1>우마무스메 목록</h1>
		<ul>
		<c:forEach var="uma" items="${ requestScope.umaData }" varStatus="s">
		<c:choose>
		<c:when test="${s.count >12 }">
			<li class="sa sa-up">
			<a href="${ pageContext.servletContext.contextPath }/member/detail?uma_code=${ uma.uma_code }"class=""><img src='${ pageContext.servletContext.contextPath }/resources/images/${ uma.uma_name }_썸네일.png'></a>
			<br>
			<a href="${ pageContext.servletContext.contextPath }/member/detail?uma_code=${ uma.uma_code }"class="" style="text-decoration:none; color:${ uma.color_tag }; font-weight: bold;">${ uma.uma_name }</a>
			</li>
		</c:when>
		<c:otherwise>
			<li>
			<a href="${ pageContext.servletContext.contextPath }/member/detail?uma_code=${ uma.uma_code }"class=""><img src='${ pageContext.servletContext.contextPath }/resources/images/${ uma.uma_name }_썸네일.png'></a>
			<br>
			<a href="${ pageContext.servletContext.contextPath }/member/detail?uma_code=${ uma.uma_code }"class="" style="text-decoration:none; color:${ uma.color_tag }; font-weight: bold;">${ uma.uma_name }</a>
			</li>
		</c:otherwise>
		</c:choose>
			
		</c:forEach>
		</ul>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
	<script type="text/javascript">
    const saTriggerMargin = 300;
    const saElementList = document.querySelectorAll('.sa');

    const saFunc = function() {
      for (const element of saElementList) {
        if (!element.classList.contains('show')) {
          if (window.innerHeight > element.getBoundingClientRect().top + saTriggerMargin) {
            element.classList.add('show');
          }
        }
      }
    }

    window.addEventListener('load', saFunc);
    window.addEventListener('scroll', saFunc);
	
	</script>
</body>
</html>