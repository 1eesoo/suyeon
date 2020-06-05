  function idcheck(){
	  var obj = document.login;
	  if(obj.id.value==0||obj.password.value==0){
		  alert("아이디 또는 비번 확인 하세요!");
		  obj.id.value="";
		  obj.password.value="";
		  obj.id.focus();
		  return false;
	  }else{
	  document.login.submit();
	  }
  }

$(function(){
	
	
	
		$("button#buttonMain").click(function(){
			//document.location.href='/semicolonweb/signup.jsp';
			
			$(location).attr('href','signup.jsp');
		});	
		/*$("button#join-submit").click(function(){
	if(!document.rfrm.id.value ||
			!document.rfrm.password.value){
		alert('빈칸을 입력 해주세요');
		
	}else{
		document.rfrm.submit();
	}
		});*/
	});
	