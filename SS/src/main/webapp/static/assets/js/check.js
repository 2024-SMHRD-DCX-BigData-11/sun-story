// 아이디 중복체크 하기
// input : input 태그안에 데이터를 "입력"할 때 실행
// change : input 태그의 값이 "변경"될 때 실행
$('#emailInput').on( "input", request );

function request(){
	
	// 비동기 요청
	$.ajax({
		url : "check",
		type : "get",
		data : {
			"email" : $('#emailInput').val()
		},
		success : function(res){
			
			if( res == "true" ){
				$('#result').html("사용 가능한 이메일 입니다.").css("color", "green");
			}else{
				$('#result').html("사용할 수 없는 이메일 입니다.").css("color", "red");
			}
			
			
		},
		error : function(e){
			
		}
	});
	
	
	
}