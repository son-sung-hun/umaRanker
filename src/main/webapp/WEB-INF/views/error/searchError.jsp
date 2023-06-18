<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<head>
<link rel="shortcut icon" href="${ pageContext.servletContext.contextPath }/resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/images/favicon.ico" type="image/x-icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>우마랭커</title>
<style type="text/css">
@font-face {
    font-family: 'GyeonggiTitleM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GyeonggiTitleM.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
span{ font-family: 'Noto Sans KR', sans-serif; }
body, table, div, p{ font-family: 'GyeonggiTitleM', sans-serif; }
.test_box{display:table;width:800px;background:#c9eafa;padding:10px;}

.tr{display:table-row;width:270px;}

.td{display:table-cell; vertical-align:middle; padding-right:30px;}

.txt{width:500px; font-size:30px; text-align:center; font-weight: bold;}

.txt1{width:500px; font-size:28px; text-align:left; font-weight: bold; padding-left:110px;}

html{
background-image:url("${ pageContext.servletContext.contextPath }/resources/images/background.jpg");
}
body {
width: 1200px;
  background-color: rgba(255, 255, 255, 0.60);
  height:100%;
}
  .scroll {
    overflow: hidden;
  }

.sa {

  opacity: 0;
  animation-name: sa;
  animation-duration: 3s;
  animation-fill-mode: forwards;
}

.one {
  animation-delay: 0.5s;
}

.two {
  animation-delay: 1s;
}

.three {
  animation-delay: 1.5s;
}

.four {
  animation-delay: 2s;
}

@keyframes sa {
  0% {
    opacity: 0;
  }
  33.33% {
    opacity: 1;
  }
  66.66% {
    opacity: 1;
  }
  100% {
    opacity: 1;
  }
}

.sa1 {
		opacity: 0;
        transition: all .5s ease;
    }


.sa1-up {
        transform: translate(0, 100px);
       }
.sa1.show {
        opacity: 1;
        transform: none;
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
	<div  align="center" style="overflow:hidden; width:1200px; height:auto;">
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
		<img src='${ pageContext.servletContext.contextPath }/resources/images/error.png' style='width:270px; height:260px;'>
		<p style="font-size: 30px; margin:6px; font-weight: bold; color:#3d414d;">검색어
		<span style="color:#000000;">'${ requestScope.name }' </span>
		에 대한 검색 결과가 없습니다.</p>

        <c:if test="${not empty requestScope.almostResult }">
        <br>
        <p style="font-size: 24px; margin:6px; font-weight: bold; color:#3d414d;">혹시 이 우마무스메를 찾으셨나요?</p>
        <c:forEach var="uma" items="${ requestScope.almostResult }" varStatus="s">
        <a href="${ pageContext.servletContext.contextPath }/database/detail?uma_code=${ uma.uma_code }"class="" style="text-decoration:none; color:${ uma.color_tag }; font-weight: bold;">${ uma.uma_name }</a> <br>
        </c:forEach>
        </c:if>


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
        <br>
        <br>
        <br>
        <br>
        <br>


	</div>

</body>
</html>