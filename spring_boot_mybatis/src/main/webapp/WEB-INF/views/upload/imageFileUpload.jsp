<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이미지 파일 업로드</title>
		<script src="<c:url value='/js/jquery-3.6.1.min.js'/>"></script>
		<script src="<c:url value='/js/imageFileUpload.js'/>"></script>
	</head>
	<body>
		<!--  파일 업로드-->
		<h3>이미지 파일 업로드</h3>
		<form id="imageFileForm">
			파일 : <input type="file" id="uploadFile" name="uploadFile">
			<input type="submit" value="업로드">
		</form><br><br>
		
		<!-- 업로드한 이미지 출력 -->
		<h3>업로드한 이미지</h3>
		<div id="imageBox"></div>
		
		<br><br>
		<a href="<c:url value='/'/>">index 페이지로 이동</a>
	</body>
</html>