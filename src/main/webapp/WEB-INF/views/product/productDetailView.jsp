<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 상세 조회</title>
		<c:import url="/WEB-INF/views/layout/head.jsp" />
		<script type="text/javascript">
			var qty = 1;
			
			// 주문수량 변경하는 함수
			function qtyChange(num) {
				qty = qty + num;
				if(qty < 1) qty = 1;
				// 주문액 계산하는 함수 호출
				calAmount();
			}
		
			// 주문수량 변경될 때 주문액 계산해서 출력하는 함수
			function calAmount() {
				// 현재 주문수량과 주문 예정 금액 가져오기
				var cartQty =  document.getElementById('cartQty');
				var amount =  document.getElementById('amount');
				
				var total = qty * ${prd.prdPrice};
				
				// 결과 값 반영
				cartQty.value = qty;
				amount.innerHTML = total.toLocaleString(); // 천단위 구분
			}
		
		</script>	
	</head>
	<body>
		<div id="wrap">
			<!--  top -->         
        	<c:import url="/WEB-INF/views/layout/top.jsp" />
			
			<h3>상품 상세 조회</h3>
			<br><br>
			<form method="post" action="<c:url value='/product/insertCart'/>">
			<table border="1" width="800">
					<tr><td rowspan="9"><img src="<c:url value='/images/${prd.prdImg}'/>" width="300" height="250"></td></tr>
					<tr><td>상품번호 </td>
					<td><input type="hidden" name="prdNo" value="${prd.prdNo }"></td></tr>
					<tr><td>상품명  </td><td>${prd.prdName }</td></tr>
					<tr><td>가격  </td><td><fmt:formatNumber value="${prd.prdPrice }" pattern="#,###" /> 원</td></tr>
					<tr><td>제조회사 </td><td>${prd.prdCompany } </td></tr>
					<tr><td>상품설명 </td><td>${prd.prdDescript } </td></tr>
					<tr><td>주문수량</td>
						<td>
							<input type="button" value="-" onClick="qtyChange(-1)"> 
							<input type="text" id="cartQty" name="cartQty" value="1"  size="1" readonly> 
							<input type="button" value="+" onClick="qtyChange(1)">
						</td></tr>
					<tr><td>구매 예정 금액</td>
							<td><span id="amount"><fmt:formatNumber value="${prd.prdPrice }" pattern="#,###" /></span> 원</td></tr>
					<tr><td colspan="2">
								<!-- 로그인 하지 않은 경우에는 [로그인] 버튼 출력 -->
								<c:if test="${empty sessionScope.sid }">
									<button><a href="<c:url value='/member/loginForm'/>">로그인</a></button>
								</c:if>
					
								<!-- 로그인 한 경우에는 [장바구니] [주문하기] 버튼 출력  -->
								<c:if test="${not empty sessionScope.sid }">
									<input type="submit" id="insertCart" value="장바구니"> 
									<input type="button" id="insertOrder" value="주문하기">
								</c:if>
					       </td></tr>
				</table><br><br>
				</form>	
				
				<br><br>
				<a href="<c:url value='/product/productCtgList/${prd.ctgId }'/>"><button>상품 목록 보기</button></a>
				
				
			 <!--  bottom -->         
        	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
    		
		</div>
	</body>
</html>






