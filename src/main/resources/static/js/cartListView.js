/**
 * cartListView.js
 */
 
 $(document).ready(function(){
 	// [전체 선택] 체크박스 체크했을 때
 	$('#allCheck').on('click', function(){
	 	var chk = $("#allCheck").prop("checked");
	 	
	 	// 체크 되었다면 (true) : 모든 개별 체크박스 true로 설정
	 	if(chk) {
	 		$('.chkDelete').prop("checked", true);
	 	} else {
	 		$('.chkDelete').prop("checked", false);
	 	}
	});
 	
 	// 개별 체크박스 해제할 경우 [전체 선택] 체크박스 해제
 	// 개별 체크박스 모두 체크되었을 때 [전체 선택] 체크
 	$('.chkDelete').on('click', function(){
 		var total = $('.chkDelete').length; //개별 체크박스의 전체 개수
 		var checked = $('.chkDelete:checked').length; // 체크된 체크박스 개수
 		
 		if(total != checked)  // 같지 않다면 (모두 선택된 상태가 아니라면)
 			$("#allCheck").prop("checked", false); // 해제
 		else
 			$("#allCheck").prop("checked", true); // 체크
 	});
 	
 	 	 // [삭제] 버튼 클릭했을 때 장바구니에서 선택된 상품 삭제
 	 $('#deleteCartBtn').on('click', function(){
 	 	// 선택 여부 확인 : 하나라도 선택하면 true, 아무것도 선택하지 않으면 false
 	 	var checked = $('.chkDelete').is(':checked');
 	 	
 	 	if(checked) { //하나라도 선택한 경우
 	 		var answer = confirm("선택된 상품을 삭제하시겠습니까?");
 	 		
 	 		if(answer) {
 	 		// 체크된 체크박스의 cartNo를 배열에 추가
 	 		var checkArr = new Array();
 	 		$('.chkDelete:checked').each(function(){
 	 			//checkArr.push($(this).val()); // value="${prd.cartNo}" 한 경우
 	 			checkArr.push($(this).attr("data-cartNo")); // 태그에 사용자 정의 속성을 사용한 경우 : data-cartNo="${prd.cartNo}"
 	 		});
 	 		
 	 		// 서버로 전송
 	 		$.ajax({
	 			type:"post",
	 			url:"/product/deleteCart",
	 			data: {"chbox":checkArr},
	 			success:function(result){
	 				if(result == 1){	 					
	 					location.href="/product/cartList";
	 				}
	 			},
	 			error:function(){
	 				alert("실패");
	 			}
	 		}); // ajax 종료 	
 	 	
 	 		}
 	 	
 	 	} else { //아무것도 선택하지 않은 경우
 	 		alert("선택된 상품이 없습니다");
 	 	}
 	 });
 
 });