<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문서 작성</title>
		<c:import url="/WEB-INF/views/layout/head.jsp" />
			<style>
					h3 { margin-top:20px;}
					table { width:900px; margin-top:20px; border-collapse: collapse;}
					table caption { font-size: 20px; font-weight: 600; margin-bottom: 10px;}	
					table tr { height:30px; }
					table th, td { border:solid gray 1px; padding:10px;}
					table th { background-color: #777; color: #fff; width: 100px; }	
					table td { text-align: left; width: 300px; }	
					input, select { text-align:left; height: 20px; margin: 2px 0;}
					.order_list td { text-align: center; }
				</style>
	</head>
	<body>
		<div id="wrap">
        	<!--  top -->         
        	<c:import url="/WEB-INF/views/layout/top.jsp" />
        	
        	<section>
        		<br>
        		<form method="post" action="<c:url value='/product/orderComplete'/>">	        		
	        		<!-- (1) 주문자 정보 -->
	        		<h3>주문자 정보</h3>
	        		<table border="1" width="800">
	        			<tr><th>주문자</th>
	        					<td width="200">${memVO.memName}
	        						<input type="hidden" name="memId" value="${memVO.memId}"></td>
	        					<th>연락처</th>
	        					<td>${hp1} - ${hp2} - ${hp3 }</td></tr>
	        		</table><br>
	        	
	        		<!-- (2) 수령인 정보 : 기본 회원 정보로 출력 (수정 가능) -->
	        		<h3>수령인 정보</h3>
	        		<table border="1" width="800">
	        			<tr><th>수령인</th>
	        						<td width="200"><input type="text" name="ordReceiver" value="${memVO.memName}"></td>
	        					<th>연락처</th>
	        						<td>
	        							<input type="text" name="hp1" value="${hp1}" size="3"> - 
	        							<input type="text" name="hp2" value="${hp2}" size="4"> - 
	        							<input type="text" name="hp3" value="${hp3}" size="4"></td></tr>
	        			<tr><th>배송지 주소</th>
	        					<td colspan="3">
			        				<input type="text" id="ordRcvZipcode" name="ordRcvZipcode" size="5" 
			        								value="${memVO.memZipcode}" readonly>
				            		<input type="button" id="searchZipBtn" name="searchZipBtn" value="우편번호 찾기"><br>
				            		<input type="text" id="ordRcvAddress1" name="ordRcvAddress1" placeholder="주소 입력" size="70" 
				            		             value="${memVO.memAddress1}" readonly> <br>
				            		<input type="text" id="ordRcvAddress2" name="ordRcvAddress2" placeholder="상세 주소 입력" size="70"
				            		             value="${memVO.memAddress2}" >
	        					</td></tr>
	        		  <tr><th>배송 메시지</th>
	        		  		 <td colspan="3"><select name="ordRcvMsg">
	        		  		 		<option value="배송전 전화주세요">배송전 전화주세요</option>
	        		  		 		<option value="부재중 전화주세요">부재중 전화주세요</option>
	        		  		 		<option value="부재중 문 앞에 놓고 가세요">부재중 문 앞에 놓고 가세요</option>	        		  		 		
	        		  		 		</select></td></tr>
	        		</table><br>
	        		
	        		<!-- (3) 주문 상품 목록-->
	        		<h3>상품 정보</h3>
	        		<table border="1" width="800">
	        			<tr>
						<th>상품번호</th>
						<th>사진</th>
						<th>상품명</th>
						<th>가격</th>
						<th>주문수량</th>
						<th>구매예정금액</th>						
					</tr>
					<c:forEach var="prd" items="${cartList }">
			            <tr>
			              <td>${prd.prdNo}</td>
			               <td><img src="<c:url value='/images/${prd.prdImg}' />" width="50" height="30"></td>			              
			               <td>${prd.prdName }</td>
			               <td  align="right"><fmt:formatNumber value="${prd.prdPrice }" pattern="#,###" /> 원</td>
			               <td><input type="text" class="cartQty"  name="cartQty" value="${prd.cartQty }" size="1">
			               			<input type="hidden" name="cartNo" value="${prd.cartNo}">
			               			<input type="hidden" name="prdNo" value="${prd.prdNo}">
			               </td>
			               <td align="right">
			               		<span class="amount">
			               			<c:set var="amount" value="${prd.prdPrice * prd.cartQty }"/>
			               			<c:set var="sum" value="${sum + amount}"/>
			               			<fmt:formatNumber value="${amount}" pattern="#,###" /> 
			               		</span> 원
			               </td>   
			            </tr>
			         </c:forEach>
			         <tr><td colspan="5">총구매예정금액</td>
			         		<td align="right"><fmt:formatNumber value="${sum}" pattern="#,###" /> 원</td>
			         </tr>
	        		</table><br>	        		
	        		
	        		<!-- (4) 결제 정보 (결제 방법 선택) -->
	        		<h3>결제 정보</h3>
	        		<table border="1" width="800">
	        			<tr><th>결제 방법</th>
	        					<td><input type="radio" name="ordPay" value="card">신용카드 
	        							 <input type="radio" name="ordPay" value="bank">계좌이체</td></tr>
	        		</table><br>
	        	
	        		<input type="submit" value="주문 완료">
        		</form>
        	</section>
        	
        	 <!--  bottom -->         
        	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
      </div>
		
	</body>
</html>