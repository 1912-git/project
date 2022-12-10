/**
 * prdNoCheck.js
 */

 $(document).ready(function(){
 	$('#prdSearchFrm').on('submit', function(){ 	
 	
 		event.preventDefault(); 		
 		
 		//폼에 입력한 값들을 쿼리 스트링 방식의 데이터로 변환 : serialize() 사용
 		//type=prdName&keyword=노트북 형식으로 만들어서 전송
 		var formData = $(this).serialize();
 		// 이렇게 보내고 컨트롤러에서 HashMap으로 받음 		
 		
 		// 서버에 전송하고 결과 받아서 처리
 		$.ajax({
 			type:"post",
 			url:"productSearch2",
 			data: formData,
 			success:function(result){
 				// 컨트롤러가 ArrayList를 반환한 것을 result로 받음
 				// <div id="searchResultBox">에 테이블 형태로
 				// 받은 개수만큼 반복문으로 출력
 				$('#searchResultBox').html(result); // 이전 내용 비우거
 				// 테이블 제목 출력
 				
			
 			},
 			error:function(){
 				alert("실패");
 			}
 		}); // ajax 종료 	
 	});// submit 종료
});