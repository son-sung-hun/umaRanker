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
<script src="${ pageContext.servletContext.contextPath }/WEB-INF/views/common/data.js"></script>
<style>
@font-face {
    font-family: 'GyeonggiTitleM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GyeonggiTitleM.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

</style>
</head>

<body>
		<div class="nav">
			<div class="menu" onclick="location.href='${ pageContext.servletContext.contextPath }/main'" style="margin-left:20px; margin-right:50px;">
			<b class="light" style="color:#ffdd00; font-size: 24px;">우마</b><b class="light" style="color:#ffd0b0; font-size: 24px;">랭커</b>
			</div>
			<div class="menu light" style="font-family: 'Noto Sans KR', sans-serif;" onclick="location.href='${ pageContext.servletContext.contextPath }/day'" style="margin-left:10px; margin-right:20px;"><img src="${ pageContext.servletContext.contextPath }/resources/images/uma_icon.png" width="23px" height="23px" style="vertical-align:text-bottom;">일간랭킹</div>
			<div class="menu light" style="font-family: 'Noto Sans KR', sans-serif;" onclick="location.href='${ pageContext.servletContext.contextPath }/week'"><img src="${ pageContext.servletContext.contextPath }/resources/images/uma_icon.png" width="23px" height="23px" style="vertical-align:text-bottom;">주간랭킹</div>
			<div class="menu light" style="font-family: 'Noto Sans KR', sans-serif;" onclick="location.href='${ pageContext.servletContext.contextPath }/month'"><img src="${ pageContext.servletContext.contextPath }/resources/images/uma_icon.png" width="23px" height="23px" style="vertical-align:text-bottom;">월간랭킹</div>
			<div class="menu light" style="font-family: 'Noto Sans KR', sans-serif;" onclick="location.href='${ pageContext.servletContext.contextPath }/database'"><img src="${ pageContext.servletContext.contextPath }/resources/images/uma_icon.png" width="23px" height="23px" style="vertical-align:text-bottom;">데이터베이스</div>
			<div class="" style="display:inline-block; width:170px; height:50px; text-align:center; line-height:50px;">
              <input id="searchInput" list="option" type="text" placeholder="검색어 입력">
              <datalist id="option">
                <option value="사토노 다이아몬드"></option>
                <option value="키타산 블랙"></option>
                <option value="라이스 샤워"></option>
                <option value="슈퍼 크리크"></option>
                <option value="마치카네 탄호이저"></option>
                <option value="타마모 크로스"></option>
                <option value="토카이 테이오"></option>
                <option value="마루젠스키"></option>
                <option value="메이쇼 도토"></option>
                <option value="스윕 토쇼"></option>
                <option value="세이운 스카이"></option>
                <option value="다이와 스칼렛"></option>
                <option value="파인 모션"></option>
                <option value="아그네스 디지털"></option>
                <option value="메지로 아르당"></option>
                <option value="히시 아케보노"></option>
                <option value="미호노 부르봉"></option>
                <option value="맨해튼 카페"></option>
                <option value="나이스 네이처"></option>
                <option value="킹 헤일로"></option>
                <option value="스페셜 위크"></option>
                <option value="사일런스 스즈카"></option>
                <option value="후지 키세키"></option>
                <option value="오구리 캡"></option>
                <option value="골드 십"></option>
                <option value="보드카"></option>
                <option value="타이키 셔틀"></option>
                <option value="그라스 원더"></option>
                <option value="히시 아마존"></option>
                <option value="메지로 맥퀸"></option>
                <option value="엘 콘도르 파사"></option>
                <option value="티엠 오페라 오"></option>
                <option value="나리타 브라이언"></option>
                <option value="심볼리 루돌프"></option>
                <option value="에어 그루브"></option>
                <option value="비와 하야히데"></option>
                <option value="마야노 탑건"></option>
                <option value="메지로 라이언"></option>
                <option value="유키노 비진"></option>
                <option value="아이네스 후진"></option>
                <option value="아그네스 타키온"></option>
                <option value="어드마이어 베가"></option>
                <option value="이나리 원"></option>
                <option value="위닝 티켓"></option>
                <option value="에어 샤커"></option>
                <option value="에이신 플래시"></option>
                <option value="카렌짱"></option>
                <option value="카와카미 프린세스"></option>
                <option value="골드 시티"></option>
                <option value="사쿠라 바쿠신 오"></option>
                <option value="시킹 더 펄"></option>
                <option value="신코 윈디"></option>
                <option value="스마트 팔콘"></option>
                <option value="젠노 롭 로이"></option>
                <option value="토센 조던"></option>
                <option value="나카야마 페스타"></option>
                <option value="나리타 타이신"></option>
                <option value="니시노 플라워"></option>
                <option value="하루 우라라"></option>
                <option value="뱀부 메모리"></option>
                <option value="비코 페가수스"></option>
                <option value="마블러스 선데이"></option>
                <option value="마치카네 후쿠키타루"></option>
                <option value="미스터 시비"></option>
                <option value="메지로 도베르"></option>
                <option value="이쿠노 딕터스"></option>
                <option value="메지로 파머"></option>
                <option value="다이타쿠 헬리오스"></option>
                <option value="트윈 터보"></option>
                <option value="사쿠라 치요노 오"></option>
                <option value="시리우스 심볼리"></option>
                <option value="야에노 무테키"></option>
                <option value="츠루마루 츠요시"></option>
                <option value="메지로 브라이트"></option>
                <option value="데어링 택트"></option>
                <option value="사쿠라 로렐"></option>
                <option value="나리타 탑 로드"></option>
                <option value="야마닌 제퍼"></option>
                <option value="심볼리 크리스 에스"></option>
                <option value="타니노 김렛"></option>
                <option value="다이이치 루비"></option>
                <option value="메지로 라모누"></option>
                <option value="애스턴 마짱"></option>
                <option value="사토노 크라운"></option>
                <option value="슈발 그랑"></option>
                <option value="케이에스 미라클"></option>
                <option value="코파노 리키"></option>
                <option value="정글 포켓"></option>
                <option value="홋코 타루마에"></option>
                <option value="원더 어큐트"></option>
                <option value="카츠라기 에이스"></option>
                <option value="네오 유니버스"></option>
                <option value="히시 미라클"></option>
                <option value="탭 댄스 시티"></option>
              </datalist>
            </div>
		</div>
</body>

</html>