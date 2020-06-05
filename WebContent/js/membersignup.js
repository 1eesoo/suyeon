$(function(){
	
	
	$("#sameCheck").click(function(){
		window.open('idcheck2.jsp','id','left=300, top=100, width=420, height=250');
	});
	
	 $.datepicker.setDefaults({
		 changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.

		  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		  yearRange: 'c-100:c',
	        dateFormat: 'yy/mm/dd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
	    });

	 
	        $("#datepicker1").datepicker();

	        var rfrm = document.rfrm;
			
			var id = rfrm.id.value;
			var name = rfrm.name.value;
			var nickname = rfrm.nickname.value;
			var password= rfrm.password.value;
			var passwordcheck = rfrm.passwordcheck.value;
			var gender = rfrm.gender.value;
			var tel1 = rfrm.tel1.value;
			var tel2 = rfrm.tel2.value;
			var tel3 = rfrm.tel3.value;
			var email1 = rfrm.email1.value;
			var email2 = rfrm.email2.value;
			var address = rfrm.address.value;
			var date = rfrm.birthdate.value;
	    
   
	$("#join-submit").click(function(){
//		제약조건 검사
		
		if(!id || !name || !nickname || !password || !passwordcheck
				|| !gender || !tel1 || !tel2 || !tel3 || !email1 || !email2 || !address
				|| !date){
			alert('빈칸을 입력하세요');
			
		}
		else if(password!=passwordcheck){
				alert('패스워드가 틀립니다');
		}else{
		rfrm.submit();
	    }    
	});
	
//	$("#sameCheck").click(function(){
//		window.open
//	});
	

});