<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
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
		count:"${ rank.pixiv_count }"
		
	});
	
	
	</c:forEach>
	
    $(function() {
        $("#show").on("click", function() {
        	
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
        	$('html, body').scrollTop(document.body.scrollHeight);

        	
        	
        });
    });
	


</script>
<style type="text/css">
body, table, div, p{ font-family: 'Nanum Gothic', sans-serif; }
.test_box{display:table;width:800px;background:#c9eafa;padding:10px;}

.tr{display:table-row;height:80px;width:900px;}

.td{display:table-cell; vertical-align:middle; padding-right:30px;}

.txt{width:500px; font-size:30px; text-align:left; font-weight: bold;}

.txt1{width:500px; font-size:30px; text-align:left; font-weight: bold; padding-left:110px;}
html{
background-image:url("${ pageContext.servletContext.contextPath }/resources/images/background.jpg");
}
body {
width: 1200px;
  background-color: rgba(255, 255, 255, 0.60);
  height:100%;
}

</style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<br>
	<br>
	<div align="center">
	<br>
		<br>
		<p style="font-size: 30px; margin:0px; font-weight: bold;">오늘의 인기 우마무스메는 ?</p>
		<p style="font-size: 14px; margin:0px; color: #A6A6A6;">기준 날짜 : ${ updateDate }</p>
		<br>
		<br> 
		<div id="list">
		
		
		
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		
		<br>
		<br>
		<br>
		<img src='${ pageContext.servletContext.contextPath }/resources/images/arrow.png' id="show" style='width:50px; height:50px;'>
		
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