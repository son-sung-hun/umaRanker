<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	const message = '${ requestScope.message }';
	if(message != null && message !== '') {
		alert(message);
	}
</script>
<style type="text/css">
.test_box{display:table;width:800px;background:#c9eafa;padding:10px;}

.tr{display:table-row;height:80px;width:900px;}

.td{display:table-cell; vertical-align:middle; padding-right:30px;}

.txt{width:500px; font-size:30px; text-align:left; font-weight: bold;}

.txt1{width:500px; font-size:30px; text-align:left; padding-left:130px;}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<br>
	<div align="center">
		일간랭킹 페이지
		<br>
		오늘의 인기 우마무스메는 ?
		<br> 
		기준 날짜 : ${ updateDate }
		<br>
		<br> 
		<c:forEach var="rank" items="${ requestScope.pixivRanking }">
			<c:if test="${rank.pixiv_rank == 1 }">
			<div class="tr">
				<p class="td"><img src="${ pageContext.servletContext.contextPath }/resources/images/1위.png" style="width:80px; height:80px;"></p>
				<p class="td txt">${ rank.pixiv_rank }위 : <a href="${ pageContext.servletContext.contextPath }/member/detail?uma_code=${ rank.uma_code }" style="text-decoration:none; color:green;">${ rank.uma_name }</a> (총 ${ rank.pixiv_count } 개)</p>
			</div>
			</c:if>
			
			<c:if test="${rank.pixiv_rank == 2 }">
			<div class="tr">
				<p class="td"><img src="${ pageContext.servletContext.contextPath }/resources/images/2위.png" style="width:80px; height:80px;"></p>
				<p class="td txt">${ rank.pixiv_rank }위 : <a href="${ pageContext.servletContext.contextPath }/member/detail?uma_code=${ rank.uma_code }" style="text-decoration:none; color:green;">${ rank.uma_name }</a> (총 ${ rank.pixiv_count } 개)</p>
			</div>
			</c:if>
			<c:if test="${rank.pixiv_rank == 3 }">
			<div class="tr">
				<p class="td"><img src="${ pageContext.servletContext.contextPath }/resources/images/3위.png" style="width:80px; height:80px;"></p>
				<p class="td txt">${ rank.pixiv_rank }위 : <a href="${ pageContext.servletContext.contextPath }/member/detail?uma_code=${ rank.uma_code }" style="text-decoration:none; color:green;">${ rank.uma_name }</a> (총 ${ rank.pixiv_count } 개)</p>
			</div>
			</c:if>
			<c:if test="${rank.pixiv_rank > 3  }">
			<div>
				<p class="td txt1">${ rank.pixiv_rank }위 : <a href="${ pageContext.servletContext.contextPath }/member/detail?uma_code=${ rank.uma_code }" style="text-decoration:none; color:green;">${ rank.uma_name }</a> (총 ${ rank.pixiv_count } 개)</p>
			</div>
			</c:if>
			
			<br>
			<br>
		</c:forEach>
		<br>
		<br>
		
	</div>
</body>
</html>