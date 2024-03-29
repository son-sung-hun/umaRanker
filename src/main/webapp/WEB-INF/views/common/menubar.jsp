<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
var list = new Array();
<c:forEach var="search" items="${ requestScope.searchQuery }">
list.push({
	code:"${search.uma_code}",
	name:"${search.uma_name}",
});
</c:forEach>
</script>
<style>
@font-face {
    font-family: 'GyeonggiTitleM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GyeonggiTitleM.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.input{
  background-color: transparent;
  border: none;
  border-bottom: 2px solid #eeeeee;
  color: #eeeeee;
  box-sizing: border-box;
  height: 15px;
  padding: 10px 0px;
  position: relative;
  top: 50%;
  width: 140px;
  z-index: 1;
  &:focus {
    outline: none;
  }
}
input::placeholder {
  color: #eeeeee;
  opacity: 0.9;
}
.active-menu {
    color:#ffdd00;
}
</style>
</head>

<body>
		<div class="nav">
			<div class="menu image-container" onclick="location.href='${ pageContext.servletContext.contextPath }/main'" style="margin-left:20px; margin-right:50px;">
			<img class="default-image" src="${ pageContext.servletContext.contextPath }/resources/images/logo.png" width="30px" height="46px" style="vertical-align:top;">
			<img class="hover-image" src="${ pageContext.servletContext.contextPath }/resources/images/logo_hover.png" width="30px" height="46px" style="vertical-align:top;">
			<b class="light" style="color:#ffdd00; font-size: 24px;">우마</b><b class="light" style="color:#ffd0b0; font-size: 24px;">랭커</b>
			</div>
			<div class="menu ${'dailyRanking'.equals(requestScope.nowPage) ? 'active-menu' : ''}" style="font-family: 'Noto Sans KR', sans-serif; font-weight: normal;" onclick="location.href='${ pageContext.servletContext.contextPath }/day'" style="margin-left:10px; margin-right:20px;"><img src="${ pageContext.servletContext.contextPath }/resources/images/uma_icon.png" width="23px" height="23px" style="vertical-align:text-bottom;">일간랭킹</div>
			<div class="menu ${'weeklyRanking'.equals(requestScope.nowPage) ? 'active-menu' : ''}" style="font-family: 'Noto Sans KR', sans-serif; font-weight: normal;" onclick="location.href='${ pageContext.servletContext.contextPath }/week'"><img src="${ pageContext.servletContext.contextPath }/resources/images/uma_icon.png" width="23px" height="23px" style="vertical-align:text-bottom;">주간랭킹</div>
			<div class="menu ${'monthlyRanking'.equals(requestScope.nowPage) ? 'active-menu' : ''}" style="font-family: 'Noto Sans KR', sans-serif; font-weight: normal;" onclick="location.href='${ pageContext.servletContext.contextPath }/month'"><img src="${ pageContext.servletContext.contextPath }/resources/images/uma_icon.png" width="23px" height="23px" style="vertical-align:text-bottom;">월간랭킹</div>
			<div class="menu ${'databaseMain'.equals(requestScope.nowPage) ? 'active-menu' : ''}" style="font-family: 'Noto Sans KR', sans-serif; font-weight: normal;" onclick="location.href='${ pageContext.servletContext.contextPath }/database'"><img src="${ pageContext.servletContext.contextPath }/resources/images/uma_icon.png" width="23px" height="23px" style="vertical-align:text-bottom;">데이터베이스</div>
			<div class="" style="display:inline-block; width:20%;  height:50px; text-align:center; line-height:50px;">
			<form method="get" name="search" style="text-align:right;" action='${ pageContext.servletContext.contextPath }/search'>
			  <input type="image" src='${ pageContext.servletContext.contextPath }/resources/images/search.jpg' width="20px" height="20px" style="vertical-align:text-bottom;" alt="제출버튼">
              <input class="input" id="searchInput" name="uma_name" list="option" type="text" placeholder="우마무스메 검색">
              <datalist id="option">

              </datalist>


            </form>

            </div>
        <a href="https://github.com/son-sung-hun/umaRanker" style="position: absolute; right: 20px;" title='깃허브' target='_blank'><img id="logo" src="${ pageContext.servletContext.contextPath }/resources/images/git_logo.png" width="25px" height="25px" style="vertical-align:unset; margin-top : 13px;"></a>


		</div>
</body>
<script type="text/javascript">
for(var i=0; i<list.length; i++){
$("#option").append(
"<option data-value='"+list[i].code+"' value='"+list[i].name+"' />"
);
}
</script>
</html>