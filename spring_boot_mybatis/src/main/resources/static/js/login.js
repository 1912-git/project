/**
 * login.js
 */
 
	$(document).ready(function(){
	  $('#frmLogin').on('submit',function(){
	  //폼이 submit 되지 않도록 기본 기능 중단
	  event.preventDefault();
	  
	  // id와 pw값 변수에 저장
	  var userId=$('#user_id').val();
	  var userPw=$('#user_pw').val();
	  
	  //서버에 전송하고 결과 받아서 처리
	  $.ajax({
	  	type:"post",
	  	url:"login",
	  	data:{"id":userId,"pw":userPw},
	  	dataType:'text',
	  	success:function(result){
	  		if(result== "success")
	  			message="로그인 성공";
	  		else
	  			message="로그인 실패";
	  		alert(message);
	  	},
	  	error:function(){
	  		alert("실패");
	  	},
	  	complete:function(){
	  	
	  		alert("작업 완료");
	  	}
	  	});
	  
  });//submit 종료

});