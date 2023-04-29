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
<script type="text/javascript">
	const message = '${ requestScope.message }';
	if(message != null && message !== '') {
		alert(message);
	}

	var list1 = new Array();
	var count = 10;
	var count1 = 15;
	<c:forEach var="rank" items="${ requestScope.pixivRanking }">
	list1.push({
		code:"${rank.uma_code}",
		name:"${rank.uma_name}",
		rank:"${ rank.pixiv_rank }",
		count:"${ rank.pixiv_count }",
		color:"${ rank.color_tag }"
	});


	</c:forEach>


</script>
<style type="text/css">
@font-face {
    font-family: 'GyeonggiTitleM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GyeonggiTitleM.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
span{ font-family: 'Noto Sans KR', sans-serif; }
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
</style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

	<br>
	<br>
	<div class="scroll" align="center" style="overflow:hidden; width:1200px; height:auto;">
	<br>
		<br>
		<p style="font-size: 30px; margin:6px; font-weight: bold;">이번달의 인기 우마무스메는 ?</p>

		<c:choose>
			<c:when test="${ empty requestScope.count }">
				<a href="${ pageContext.servletContext.contextPath }/month?day_count=1" style="text-decoration:none; font-size: 20px; color:green;">◀</a>
				<span style="font-size: 14px; margin:0px; color: #A6A6A6;">기준 날짜 : ${ updateDate }</span>
			</c:when>

			<c:when test="${ requestScope.count eq 0 }">
				<a href="${ pageContext.servletContext.contextPath }/month?day_count=1" style="text-decoration:none; font-size: 20px; color:green;">◀</a>
				<span style="font-size: 14px; margin:0px; color: #A6A6A6;">기준 날짜 : ${ updateDate }</span>
			</c:when>

			<c:otherwise>
				<a href="${ pageContext.servletContext.contextPath }/month?day_count=${ requestScope.count+1 }" style="text-decoration:none; font-size: 20px; color:green;">◀</a>
				<span style="font-size: 14px; margin:0px; color: #A6A6A6;">기준 날짜 : ${ updateDate }</span>
				<a href="${ pageContext.servletContext.contextPath }/month?day_count=${ requestScope.count-1 }" style="text-decoration:none; font-size: 20px; color:green;">▶</a>
			</c:otherwise>
		</c:choose>
		<br>
		<br>
		<div id="list">



		</div>

		<c:forEach var="uma" items="${ requestScope.pixivRanking }" varStatus="s">
        <c:choose>
        <c:when test="${uma.pixiv_rank >3 }">
        <p class='sa1 sa1-up txt1 four'>
        ${ uma.pixiv_rank }위 : <a href='${ pageContext.servletContext.contextPath }/database/detail?uma_code=${ uma.uma_code }' style='text-decoration:none; color:${ uma.color_tag };'>${ uma.uma_name }</a> (총 : ${ uma.pixiv_count }개)</p>
        </c:when>
        </c:choose>
        </c:forEach>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <a href="#" class="moveTop" style="font-family: 'Noto Sans KR', sans-serif; text-decoration:none; font-size: 16px; margin:0px; color: #3d414d; font-weight: bold;">🔼이 페이지의 맨 위로🔼</a>
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
<script type="text/javascript">
const $topBtn = document.querySelector(".moveTop");

$topBtn.onclick = () => {
  window.scrollTo({ top: 0, behavior: "smooth" });
}
for(var i=0; i<count; i++){

	switch(list1[i].rank){
	case '1':
		$("#list").append("<div class='tr sa one'>"+
				"<p class='td'>"+
				"<a href='${ pageContext.servletContext.contextPath }/database/detail?uma_code="+list1[i].code+"' style='text-decoration:none;'>"+
				"<img src='${ pageContext.servletContext.contextPath }/resources/images/"+list1[i].name+"_금.jpg' style='width:270px; height:260px;'></p></a></div><br>"+
				"<p class='td txt sa one'>"
		    	+list1[i].rank
		    	+"위 : <a href='${ pageContext.servletContext.contextPath }/database/detail?uma_code="
		    	+list1[i].code
		    	+"' style='text-decoration:none; color:"
		    	+list1[i].color
		    	+";'>"
		    	+list1[i].name
		    	+"</a> (총 "
		    	+list1[i].count
		    	+"개)</p><br><br><br>");
		break;
	case '2':
		$("#list").append("<div class='tr sa two'>"+
				"<p class='td'>"+
				"<a href='${ pageContext.servletContext.contextPath }/database/detail?uma_code="+list1[i].code+"' style='text-decoration:none;'>"+
				"<img src='${ pageContext.servletContext.contextPath }/resources/images/"+list1[i].name+"_은.jpg' style='width:220px; height:210px;'></p></a></div><br>"+
				"<p class='td txt sa two'>"
		    	+list1[i].rank
		    	+"위 : <a href='${ pageContext.servletContext.contextPath }/database/detail?uma_code="
		    	+list1[i].code
		    	+"' style='text-decoration:none; color:"
		    	+list1[i].color
		    	+";'>"
		    	+list1[i].name
		    	+"</a> (총 "
		    	+list1[i].count
		    	+"개)</p><br><br><br>");
		break;
	case '3':
		$("#list").append("<div class='tr sa three'>"+
				"<p class='td'>"+
				"<a href='${ pageContext.servletContext.contextPath }/database/detail?uma_code="+list1[i].code+"' style='text-decoration:none;'>"+
				"<img src='${ pageContext.servletContext.contextPath }/resources/images/"+list1[i].name+"_동.jpg' style='width:170px; height:160px;'></p></a></div><br>"+
				"<p class='td txt sa three'>"
		    	+list1[i].rank
		    	+"위 : <a href='${ pageContext.servletContext.contextPath }/database/detail?uma_code="
		    	+list1[i].code
		    	+"' style='text-decoration:none; color:"
		    	+list1[i].color
		    	+";'>"
		    	+list1[i].name
		    	+"</a> (총 "
		    	+list1[i].count
		    	+"개)</p><br><br><br>");
		break;



	}

}

    const saTriggerMargin = 300;
    const saElementList = document.querySelectorAll('.sa1');

    const saFunc = function() {
      for (const element of saElementList) {
        if (!element.classList.contains('show')) {
          if (window.innerHeight > element.getBoundingClientRect().top + saTriggerMargin) {
            element.classList.add('show');
          }
        }
      }
    }


    window.addEventListener('scroll', saFunc);
</script>
</html>