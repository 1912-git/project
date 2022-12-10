/**
 *  index.js
 */
 
 $(document).ready(function(){
	// 윈도우 스크롤 시 메인 메뉴 고정 : window 객체의 scroll 이벤트 처리
	$(window).on('scroll', function(){
		// 스크롤되는 문서의 top이 #headerBox 이상이면 메인 메뉴 고정시키고 그림자 표시
		if($(document).scrollTop() >= $('#headerBox').height()) {
			$('#mainMenuBox').addClass('mainMenuFixed mainMenuShadow');
		} else {
			$('#mainMenuBox').removeClass('mainMenuFixed mainMenuShadow');
		}
	});
	
	// moveToTop 이미지 클릭 시 top으로 이동
	$('#moveToTop').on('click', function(){
		// html만 선택해도 됨
		$('html, body').animate({scrollTop:0}, 500); // 0.5초 동안 top:0 위치로 스크롤 이동
	});
	
 });
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 