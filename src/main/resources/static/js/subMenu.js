/**
 * subMenu.js
 */
 $(document).ready(function(){
	
	// [전체보기 ▼] 버튼 클릭 시 모든 서브 메뉴 항목 보이게
	$('#showAllMenu').on('click', function(){
		if($(this).text() == '전체보기 ▼') {
			$('#subMenuBox').css('visibility', 'visible');
			$(this).text('메뉴 닫기 ▲').css('color', 'blue'); // 텍스트 내용 및 색상 변경
		} else {
			$('#subMenuBox').css('visibility', 'hidden');
			$(this).text('전체보기 ▼').css('color', 'black'); // 텍스트 내용 및 색상 변경
		}
	});
	
	
});