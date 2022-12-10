/**
 *  slideShow.js
 */
 
  $(document).ready(function(){
	// 이동한 이미지의 index 값 저장 (현재 위치)
	var movedIndex = 0;
	
	// 실제로 슬라이드 패널을 움직이는 함수
	function moveSlide(index){
		//전달 받은 index 값을 movedIndex에 저장
		movedIndex = index;
		
		// 슬라이드 이동
		var moveLeft = -(index * 1280); // 왼쪽으로 이동 거리
		$('#slidePanel').animate({'left': moveLeft}, 'slow');
	}
	
	// prev 버튼 클릭하면 앞으로 이동
	$('#prevButton').on('click', function(){
		if(movedIndex !=0)  // 첫 번째가 아니면
			movedIndex = movedIndex - 1; // 인덱스 값 - 1
		
		moveSlide(movedIndex);  // 실제로 슬라이드 패널을 움직이는 함수 호출하면 계산된 인덱스값 전달
	});	
	
	// next 버튼 클릭하면 뒤로 이동
	$('#nextButton').on('click', function(){
		if(movedIndex != 4)  // 마지막이 아니면
			movedIndex = movedIndex + 1; // 인덱스 값 + 1
		
		moveSlide(movedIndex); // 실제로 슬라이드 패널을 움직이는 함수 호출하면 계산된 인덱스값 전달
	});
	
	// 초기 슬라이더 위치 랜덤하게 지정
	//var randomNum = Math.floor(Math.random() * 5); // 0 ~ 4 : 5개
	//moveSlide(randomNum); 
	
	// 컨트롤 버튼 
	// 각 컨트롤 버튼에 마우스 올렸을 때 이미지 변경. moveSlide() 함수 호출하면 index 전달
	$('.controlButton').each(function(index){		
		$(this).hover(
			function() {    // 마우스 올렸을 때 이미지 변경
				$(this).attr('src', 'image/controlButton2.png');
			},
			function() {
				$(this).attr('src', 'image/controlButton1.png');
			}
		);
		
		// 클릭했을 때 현재 인덱스 값을 moveSlide() 함수에게 전달
		$(this).on('click', function() {
			moveSlide(index);
		})
	});
 });
 
 
 
 
 
 
 
 
 