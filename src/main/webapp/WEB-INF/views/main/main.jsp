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
	width:500px;
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
	background-color: rgba(255, 255, 255, 0.60);
	height:970px;
}

section::after {
  content: "";
  display: table;
  clear: both;
}


.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.5);
    animation: fadeIn 0.5s;
}


.modal-content {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: rgba(238, 238, 238, 0.7);
    margin: 10% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}


.modal-button {
    display: inline-block;
    outline: 0;
    border: none;
    cursor: pointer;
    font-weight: 600;
    border-radius: 4px;
    font-size: 13px;
    height: 30px;
    background-color: #f8f8f8;
    color: #0e0e10;
    padding: 0 10px;

}

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }



button {
 appearance: none;
 background-color: transparent;
 border: 0.125em solid ${ requestScope.umaDetail.color_tag };
 box-sizing: border-box;
 color: #3B3B3B;
 cursor: pointer;
 display: inline-block;
 font-family: 'GyeonggiTitleM', sans-serif;
 font-size: 21px;
 font-weight: 500;
 line-height: normal;
 margin: 0;
 min-width: 0;
 outline: none;
 padding: 0.4em 1.0em;
 text-align: center;
 text-decoration: none;
 transition: all 300ms cubic-bezier(.23, 1, 0.32, 1);
 user-select: none;
 -webkit-user-select: none;
 touch-action: manipulation;
 will-change: transform;
}

button:disabled {
 pointer-events: none;
}

button:hover {
 color: #000;
 background-color: #0000000d;
 box-shadow: rgba(0, 0, 0, 0.25) 0 8px 15px;
 transform: translateY(-2px);
}

button:active {
 box-shadow: none;
 transform: translateY(0);
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

.name{
position: relative;
}
.name::after {
  content: '';
  width: 0%;
  left: 50%;
  height: 1px;
  display: block;
  position: absolute;
  margin-top: 3px;
  border-bottom: 2px solid ${ uma.color_tag };
  transition:all .3s ease;
}
.name:hover::after {
  content: '';
  width: 100%;
  left: 0px;
  height: 1px;
  display: block;
  position: absolute;
  margin-top: 3px;
  border-bottom: 2px solid ${ uma.color_tag };
  transition:all .3s ease;
}
</style>
<script>
    window.onload = function() {
      var isModalHidden = getCookie('hideModal');
      if (!isModalHidden) {
        showModal();
      }
    };
    function showModal() {
      var modal = document.getElementById('myModal');
      modal.style.display = "block";
    }



    function setCookie(name, value) {
      var date = new Date();
      date.setTime(date.getTime() + (1 * 24 * 60 * 60 * 1000));
      var expires = "expires=" + date.toUTCString();
      document.cookie = name + "=" + value + ";" + expires + ";path=/";
    }

    function getCookie(name) {
      var nameEQ = name + "=";
      var cookies = document.cookie.split(';');
      for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
        while (cookie.charAt(0) == ' ') {
          cookie = cookie.substring(1, cookie.length);
        }
        if (cookie.indexOf(nameEQ) === 0) {
          return cookie.substring(nameEQ.length, cookie.length);
        }
      }
      return null;
    }

    function closeModal() {
        var modal = document.getElementById('myModal');
        modal.style.display = "none";


        var hideModalCheckbox = document.getElementById('hideModalCheckbox');
        if (hideModalCheckbox.checked) {
          setCookie('hideModal', 'true');
        }
    }

</script>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	<br>
	<br>
	<div align="center">
		<c:forEach var="daily" items="${ requestScope.daily }" varStatus="s">
		

			<c:if test="${s.first}">
				<section>
				<aside align="center" class="sa three">
				<a href="${ pageContext.servletContext.contextPath }/database/detail?uma_code=${ daily.uma_code }" style="text-decoration:none; color:${ daily.color_tag };"><img src="${ pageContext.servletContext.contextPath }/resources/images/${ daily.uma_name }.png" width="700px" style="border-color: #3d414d;"></a>
				</aside>
				<article>
				<c:choose>
					<c:when test="${ empty requestScope.count }">
						<a class="sa one" href="${ pageContext.servletContext.contextPath }/main?day_count=1" style="text-decoration:none; font-size: 21px; color:#3d414d;">◀</a>
						<span class="regular sa one" style="font-size: 21px;">기준 날짜 : ${ updateDate }</span>
					</c:when>
					
					<c:when test="${ requestScope.count eq 0 }">
						<a class="sa one"  href="${ pageContext.servletContext.contextPath }/main?day_count=1" style="text-decoration:none; font-size: 21px; color:#3d414d;">◀</a>
						<span class="regular sa one"  style="font-size: 21px;">기준 날짜 : ${ updateDate }</span>
					</c:when>
					
					<c:otherwise>
						<a class="sa one"  href="${ pageContext.servletContext.contextPath }/main?day_count=${ requestScope.count+1 }" style="text-decoration:none; font-size: 21px; color:#3d414d;">◀</a>
						<span class="regular sa one"  style="font-size: 21px;">기준 날짜 : ${ updateDate }</span>
						<a class="sa one"  href="${ pageContext.servletContext.contextPath }/main?day_count=${ requestScope.count-1 }" style="text-decoration:none; font-size: 21px; color:#3d414d;">▶</a>
						<a class="sa one"  href="${ pageContext.servletContext.contextPath }/main?day_count=0" style="text-decoration:none; font-size: 21px; color:#3d414d;">≫</a>
					</c:otherwise>
				</c:choose>
				<br>	
				
				<br>
				<c:choose>
                	<c:when test="${ empty requestScope.count }">
                	    <p class="sa one"  style="font-size: 30px; margin:0px; font-weight: bold;">오늘의 인기 우마무스메는??</p>
                	</c:when>

                	<c:when test="${ requestScope.count eq 0 }">
                	    <p class="sa one"  style="font-size: 30px; margin:0px; font-weight: bold;">오늘의 인기 우마무스메는??</p>
                	</c:when>

                    <c:when test="${ requestScope.count eq 1 }">
                        <p class="sa one"  style="font-size: 30px; margin:0px; font-weight: bold;">어제의 인기 우마무스메는??</p>
                    </c:when>
                	<c:otherwise>
                        <p class="sa one"  style="font-size: 30px; margin:0px; font-weight: bold;">${ requestScope.count }일 전의 인기 우마무스메는??</p>
                	</c:otherwise>
                </c:choose>
				<h2><c:if test="${requestScope.birth eq true}">
				<span class="bold sa two">🎂</span>
				</c:if>
				<a class="name bold sa two" href="${ pageContext.servletContext.contextPath }/database/detail?uma_code=${ daily.uma_code }" style="text-decoration:none; color:${ daily.color_tag };">${ daily.uma_name }</a>
				<c:if test="${requestScope.birth eq true}">
                <span class="bold sa two">🎂</span>
                </c:if>
                <c:if test="${requestScope.count == 0 }">
				<c:choose>
                    <c:when test="${ requestScope.rankResult eq 'increase' }">
                    <span class="sa four" style="font-size: 14px; color:#139020; font-weight: bold; vertical-align: middle;"><img id="result" src="${ pageContext.servletContext.contextPath }/resources/images/increase.png"/> ${ requestScope.rankVariance } (전일 대비 상승량)</span>
                    </c:when>

                    <c:otherwise>
                    <span class="sa four"  style="font-size: 14px; color:#139020; font-weight: bold; vertical-align: middle;"> (${ requestScope.rankVariance }일 연속 1위)</span>
                    </c:otherwise>
                </c:choose>
                </c:if>
					<c:if test="${requestScope.size ne 1}">
					<span class="sa four"  title='
					<c:forEach items="${requestScope.daily}" var="scope" varStatus="status" begin="1" end="${requestScope.size}">${scope.uma_name}<c:if test="${status.last eq false}">, </c:if></c:forEach>'>

					외 
					<c:out value="${requestScope.size-1}"/>
					명
					</span>
					</c:if>
				</h2>

				<c:choose>
                	<c:when test="${ empty requestScope.count }">
                	    <p class="sa two bold" style="font-size: 21px;">오늘의 언급횟수
                        <a href="https://www.pixiv.net/tags/${daily.uma_tag }/illustrations" title='${daily.uma_name } 검색 결과' style="color:#055AFF; text-decoration:none;" target='_blank'><img id="logo" src="${ pageContext.servletContext.contextPath }/resources/images/pixiv_icon.png" width="25px" height="25px" style="vertical-align:sub; margin-top : 5px;"></a>
                         : ${ daily.pixiv_count } 회</p>
                	</c:when>

                	<c:when test="${ requestScope.count eq 0 }">
                	    <p class="sa two bold" style="font-size: 21px;">오늘의 언급횟수
                        <a href="https://www.pixiv.net/tags/${daily.uma_tag }/illustrations" title='${daily.uma_name } 검색 결과'  style="color:#055AFF; text-decoration:none;" target='_blank'><img id="logo" src="${ pageContext.servletContext.contextPath }/resources/images/pixiv_icon.png" width="25px" height="25px" style="vertical-align:sub; margin-top : 5px;"></a>
                         : ${ daily.pixiv_count } 회</p>
                	</c:when>

                    <c:when test="${ requestScope.count eq 1 }">
                        <p class="sa two bold" style="font-size: 21px;">어제의 언급횟수
                        <a href="https://www.pixiv.net/tags/${daily.uma_tag }/illustrations" title='${daily.uma_name } 검색 결과'  style="color:#055AFF; text-decoration:none;" target='_blank'><img id="logo" src="${ pageContext.servletContext.contextPath }/resources/images/pixiv_icon.png" width="25px" height="25px" style="vertical-align:sub; margin-top : 5px;"></a>
                         : ${ daily.pixiv_count } 회</p>
                    </c:when>
                	<c:otherwise>
                	    <p class="sa two bold" style="font-size: 21px;">${ requestScope.count }일 전의 언급횟수
                        <a hre="https://www.pixiv.net/tags/${daily.uma_tag }/illustrations" title='${daily.uma_name } 검색 결과'  style="color:#055AFF; text-decoration:none;" target='_blank'><img id="logo" src="${ pageContext.servletContext.contextPath }/resources/images/pixiv_icon.png" width="25px" height="25px" style="vertical-align:sub; margin-top : 5px;"></a>
                         : ${ daily.pixiv_count } 회</p>
                	</c:otherwise>
                </c:choose>
				</article>
				</section>
			</c:if>
			

				
		
		
		

		</c:forEach>
	</div>


        <div id="myModal" class="modal">
            <div class="modal-content">

                <a href="https://umamusume.kakaogames.com/"><img src='${ pageContext.servletContext.contextPath }/resources/images/intro.png' style='display : block; margin : auto;'></a>
                <ul style="margin-left:90px; margin-right:90px; text-align:left;">
                <hr align="left" size="1"  width="96%" color = "#3d414d">
                <span style="font-size: 18px; font-weight: light; ">이 사이트는 현재 일본과 한국에서 서비스중인
                <a href="https://umamusume.kakaogames.com/" style="text-decoration:none; font-size: 18px; font-weight: bold; " target='_blank'>
                <span style="color:#fcae19; ">'우마 </span>
                <span style="color:#f35f8c; ">무스메 </span>
                <span style="color:#f5effa;">프리티더비'</span>
                </a>
                 라는 게임에 나오는 캐릭터들의
                언급 횟수를 일간, 주간, 월간으로 조회하여 그 당시 제일 인기 있는 캐릭터가 누구인지 알 수 있게 해주는 사이트 입니다.
                <br>
                언급 횟수는 일본 내에서 가장 큰 규모의 서브컬쳐 일러스트 투고 사이트인
                <a href="https://www.pixiv.net/" style="color:#055AFF; text-decoration:none; font-size: 18px; font-weight: bold; " target='_blank'>pixiv</a>

                에서의 검색 결과를 모두 크롤링하여 계산 됩니다.
                <br>
                일러스트 한 장에 언급횟수 하나로 환산하여 계산하고 있습니다.


                </span>
                </ul>

                <span style='text-align:center; display : block; margin : auto; font-size: 14px; color:#767676;'>이 사이트는 1920x1080 해상도에 맞춰 제작되었습니다.</span>
                <span style='display : block; margin : auto; width : 240px;'>

                <label for="hideModalCheckbox" style="vertical-align:middle;"><input type="checkbox"  id="hideModalCheckbox" > <span style="font-size:16px;">오늘 하루 보지 않기 &nbsp;</span></label>
                <button class="modal-button" onclick="closeModal()" >창 닫기</button>
                </span>
            </div>
        </div>
</body>
</html>

