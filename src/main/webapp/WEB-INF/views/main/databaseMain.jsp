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
<meta charset="UTF-8">
<title>우마랭커</title>
<script>
	const message = '${ requestScope.message }';
	if(message != null && message !== '') {
		alert(message);
	}
</script>
<style type="text/css">

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
        position: relative;
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
.sa:hover{
    top: -5px;
}
.moveTop {
background-image:url("${ pageContext.servletContext.contextPath }/resources/images/topButton.png");
z-index: 1;
position:fixed;
width: 41px;
height: 40px;
bottom: 20px;
right: 20px;
cursor:pointer;
}
.moveTop:hover{
background-image:url("${ pageContext.servletContext.contextPath }/resources/images/topButton_hover.png");
}
.moveBot {
background-image:url("${ pageContext.servletContext.contextPath }/resources/images/botButton.png");
z-index: 1;
position:fixed;
width: 41px;
height: 40px;
bottom: 20px;
right: 65px;
cursor:pointer;
}
.moveBot:hover{
background-image:url("${ pageContext.servletContext.contextPath }/resources/images/botButton_hover.png");
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="moveTop">
    </div>
    <div class="moveBot">
    </div>
	<br>
	<br>
	<br>
	<div align="center">
	<br>
	<h1 style="color:#3d414d">우마무스메 목록</h1>
		<ul>
		<c:forEach var="uma" items="${ requestScope.umaData }" varStatus="s">
		<c:choose>
		<c:when test="${s.count >12 }">
			<li class="sa sa-up">
			<a href="${ pageContext.servletContext.contextPath }/database/detail?uma_code=${ uma.uma_code }"class=""><img src='${ pageContext.servletContext.contextPath }/resources/images/${ uma.uma_name }_썸네일.png'></a>
			<br>
			<a href="${ pageContext.servletContext.contextPath }/database/detail?uma_code=${ uma.uma_code }"class="" style="text-decoration:none; color:${ uma.color_tag }; font-weight: bold; text-shadow: 3px 3px 1px #e4e5e5;">${ uma.uma_name }</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="sa sa-up">
			<a href="${ pageContext.servletContext.contextPath }/database/detail?uma_code=${ uma.uma_code }"class=""><img src='${ pageContext.servletContext.contextPath }/resources/images/${ uma.uma_name }_썸네일.png'></a>
			<br>
			<a href="${ pageContext.servletContext.contextPath }/database/detail?uma_code=${ uma.uma_code }"class="" style="text-decoration:none; color:${ uma.color_tag }; font-weight: bold; text-shadow: 3px 3px 1px #e4e5e5;">${ uma.uma_name }</a>
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
        <br>
        <br>
        <br>
        <br>
	</div>
	<script type="text/javascript">
	const $topBtn = document.querySelector(".moveTop");
    const $botBtn = document.querySelector(".moveBot");
    $topBtn.onclick = () => {
      window.scrollTo({ top: 0, behavior: "smooth" });
    }
    $botBtn.onclick = () => {
      window.scrollTo({ top: document.documentElement.scrollHeight, behavior: "smooth" });
    }
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