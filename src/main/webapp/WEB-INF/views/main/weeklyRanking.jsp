<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	const message = '${ requestScope.message }';
	if(message != null && message !== '') {
		alert(message);
	}
	
	var list1 = new Array();
	var count = 5;
	var count1 = 10;
	<c:forEach var="rank" items="${ requestScope.pixivRanking }">
	list1.push({
		code:"${rank.uma_code}",
		name:"${rank.uma_name}",
		rank:"${ rank.pixiv_rank }",
		count:"${ rank.pixiv_count }"
		
	});
	
	
	</c:forEach>
	
    $(function() {
        $("button").on("click", function() {
        	
        	for(var i = count; i<count1; i++){
        		switch(list1[i].rank){
        		case '1':
        			$("#list").append("<div class='tr'>"+
        					"<p class='td'>"+
        					"<img src='${ pageContext.servletContext.contextPath }/resources/images/1위.png' style='width:80px; height:80px;'></p>"+
        					"<p class='td txt'>"
        			    	+list1[i].rank
        			    	+"위 : <a href='${ pageContext.servletContext.contextPath }/member/detail?uma_code="
        			    	+list1[i].code
        			    	+"' style='text-decoration:none; color:green;'>"
        			    	+list1[i].name
        			    	+"</a> (총 "
        			    	+list1[i].count
        			    	+"개)</p>");	
        			break;
        		case '2':
        			$("#list").append("<div class='tr'>"+
        					"<p class='td'>"+
        					"<img src='${ pageContext.servletContext.contextPath }/resources/images/2위.png' style='width:80px; height:80px;'></p>"+
        					"<p class='td txt'>"
        			    	+list1[i].rank
        			    	+"위 : <a href='${ pageContext.servletContext.contextPath }/member/detail?uma_code="
        			    	+list1[i].code
        			    	+"' style='text-decoration:none; color:green;'>"
        			    	+list1[i].name
        			    	+"</a> (총 "
        			    	+list1[i].count
        			    	+"개)</p>");	
        			break;
        		case '3':
        			$("#list").append("<div class='tr'>"+
        					"<p class='td'>"+
        					"<img src='${ pageContext.servletContext.contextPath }/resources/images/3위.png' style='width:80px; height:80px;'></p>"+
        					"<p class='td txt'>"
        			    	+list1[i].rank
        			    	+"위 : <a href='${ pageContext.servletContext.contextPath }/member/detail?uma_code="
        			    	+list1[i].code
        			    	+"' style='text-decoration:none; color:green;'>"
        			    	+list1[i].name
        			    	+"</a> (총 "
        			    	+list1[i].count
        			    	+"개)</p>");	
        			break;
        		default:
        			$("#list").append("<div>"+
        					"<p class='td txt1'>"
        			    	+list1[i].rank
        			    	+"위 : <a href='${ pageContext.servletContext.contextPath }/member/detail?uma_code="
        			    	+list1[i].code
        			    	+"' style='text-decoration:none; color:green;'>"
        			    	+list1[i].name
        			    	+"</a> (총 "
        			    	+list1[i].count
        			    	+"개)</p>");	
        			break;
        		
        		
        		}
        		
        	}
        	count+=5;
        	count1+=5;
        	
        	if(count1>list1.length){
        		count1 = list1.length;
        	}
        	if(count>list1.length){
        		$("#show").hide();
        	}
        	
        	
        	
        });
    });
	


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
		주간랭킹 페이지
		<br>
		이번주의 인기 우마무스메는 ?
		<br> 
		기준 날짜 : ${ updateDate }
		<br>
		<br> 
		<div id="list">
		
		
		
		</div>
		<button id="show">더 보기</button>

		<br>
		<br>
		
	</div>
</body>
<script type="text/javascript">
for(var i=0; i<count; i++){
	
	switch(list1[i].rank){
	case '1':
		$("#list").append("<div class='tr'>"+
				"<p class='td'>"+
				"<img src='${ pageContext.servletContext.contextPath }/resources/images/1위.png' style='width:80px; height:80px;'></p>"+
				"<p class='td txt'>"
		    	+list1[i].rank
		    	+"위 : <a href='${ pageContext.servletContext.contextPath }/member/detail?uma_code="
		    	+list1[i].code
		    	+"' style='text-decoration:none; color:green;'>"
		    	+list1[i].name
		    	+"</a> (총 "
		    	+list1[i].count
		    	+"개)</p>");	
		break;
	case '2':
		$("#list").append("<div class='tr'>"+
				"<p class='td'>"+
				"<img src='${ pageContext.servletContext.contextPath }/resources/images/2위.png' style='width:80px; height:80px;'></p>"+
				"<p class='td txt'>"
		    	+list1[i].rank
		    	+"위 : <a href='${ pageContext.servletContext.contextPath }/member/detail?uma_code="
		    	+list1[i].code
		    	+"' style='text-decoration:none; color:green;'>"
		    	+list1[i].name
		    	+"</a> (총 "
		    	+list1[i].count
		    	+"개)</p>");	
		break;
	case '3':
		$("#list").append("<div class='tr'>"+
				"<p class='td'>"+
				"<img src='${ pageContext.servletContext.contextPath }/resources/images/3위.png' style='width:80px; height:80px;'></p>"+
				"<p class='td txt'>"
		    	+list1[i].rank
		    	+"위 : <a href='${ pageContext.servletContext.contextPath }/member/detail?uma_code="
		    	+list1[i].code
		    	+"' style='text-decoration:none; color:green;'>"
		    	+list1[i].name
		    	+"</a> (총 "
		    	+list1[i].count
		    	+"개)</p>");	
		break;
	default:
		$("#list").append("<div>"+
				"<p class='td txt1'>"
		    	+list1[i].rank
		    	+"위 : <a href='${ pageContext.servletContext.contextPath }/member/detail?uma_code="
		    	+list1[i].code
		    	+"' style='text-decoration:none; color:green;'>"
		    	+list1[i].name
		    	+"</a> (총 "
		    	+list1[i].count
		    	+"개)</p>");	
		break;
	
	
	}
	
}

</script>
</html>