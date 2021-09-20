<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<h1 align="center">회원가입</h1>
	
	<form action="${ pageContext.servletContext.contextPath }/member/regist" method="post" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<td> * 아이디 </td>
				<td><input type="text" name="id" id="userId"></td>
				<td><button onclick="return duplicationCheck()">중복확인</button></td>
			</tr>
			<tr>
				<td> * 비밀번호 </td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td> * 비밀번호확인 </td>
				<td><input type="password" name="pwd2"></td>
			</tr>
			<tr>
				<td> * 이름 </td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td> 이메일 </td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td> 주민등록번호 </td>
				<td>
					<input type="text" name="birthDay" size="6" maxlength="6">-
					<input type="text" name="gender" size="1" maxlength="1">******
				</td>
			</tr>
			<tr>
				<td> 전화번호 </td>
				<td><input type="tel" name="phone"></td>
			</tr>
			<tr>
				<td> 주소 </td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>프로필사진</td>
				<td>
					<input type="file" name="photo">
				</td>
			</tr>
		</table>
		<br>
		<div align="center">
			<button type="reset">작성취소</button>
			<button type="submit">가입하기</button>
		</div>
	</form>
	
	<script>
		function duplicationCheck(){
			var userId = $("#userId").val();
			console.log(userId);
			$.ajax({
				url:"${pageContext.servletContext.contextPath}/member/idDupCheck",
				type:"post",
				data:{userId:userId},
				success:function(data){
					console.log(data);
					alert(data);
				}, error:function(data){
					console.log(data);
				}
			});
			return false;
		}
		
	</script>
</body>
</html>