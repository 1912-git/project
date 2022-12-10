<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>카테고리별 상품 조회</title>
		<c:import url="/WEB-INF/views/layout/head.jsp" />
	</head>
	<body>
		<div id="wrap">
        	<!--  top -->         
        	<c:import url="/WEB-INF/views/layout/top.jsp" />
		<section>
		
		<h3>상품 목록</h3>
			<table border="1" width="800">
					<tr>
						<th>상품번호</th>
						<th>상품명</th>
						<th>가격</th>
						<th>제조사</th>
						<th>재고</th>
						<th>사진</th>
					</tr>
					<c:forEach var="prd" items="${prdList }">
			            <tr>
			               <td><a href="<c:url value='/product/detailViewProduct/${prd.prdNo}'/>" >${prd.prdNo }</a></td>
			               <td>${prd.prdName }</td>
			               <td>${prd.prdPrice }</td>
			               <td>${prd.prdCompany }</td>
			               <td>${prd.prdStock }</td>
			               <td><img src="<c:url value='/images/${prd.prdImg}' />" width="30" height="20"></td>			               
			            </tr>
			         </c:forEach>
				</table><br><br>
		
		</section>
		
		<!--  bottom -->         
        	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
      </div>
	</body>
</html>