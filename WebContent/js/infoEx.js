$(function(){
	
		$("a#dayid").css("cursor","pointer");
		$("a#dayid").click(function(){
			$("span#dayid").html($("a#monthid").html().replace("년","/").replace("월","/")+$(this).html());
		});		
		
		$("input[name='pv']").attr("disabled",true);
		$("select[name='pv1']").click(function(){
			if($(this).val()!="선택하세요"&&$(this).val()!="직접입력"){
				$("input[name='pv']").val($(this).val());
			}else if($(this).val()=="직접입력"){
				$("input[name='pv']").attr("disabled",false).attr("readonly",false);
			}
		});
		
		 $("a#reservebtn").click(function(){
			 
			 var date = $("span#dayid").text();
			 var price = $("span#pprice").text();
		 	 var count = $("input[name=pv]").val();
		 	 var time = $("input[name=timeFun]").val();
		 	 
		 	 var fulldate = date+" "+time+":00";
			 if(date==''||
			price==''||
			count==''){
				 alert("선택하세요");
			 }else{
				 var str = "예약날짜: "+fulldate+", 예약인원 :"+count;
				 if(confirm(str+" \n예약하시겠습니까?")){
					 location.href= "inforeserveProcess.jsp?date="+fulldate+"&count="+count+"&pno="+$("input[id=pno]").val();
				 }
			 }
		 });
});

