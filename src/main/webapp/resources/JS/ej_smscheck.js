/* 인증번호 */
	$("#alert-success2").hide();
	$("#alert-danger2").hide();
	
    $("#sendSMS").on('click',function(){
       
        var result = Math.floor(Math.random() * 1000000)+100000;
        if(result>1000000){
           result = result - 100000;
        }
        
      document.getElementById('text2').value= null;
       document.getElementById('text2').value = result;
       var result2 = document.getElementById('text2').value;
      console.log("hidden : "+ result2);
      
        console.log("문자를 전송합니다.");
         console.log(" 인증번호:"+result);
         $("#smsForm").attr("action",  "join"); //위에 있는 폼태그를 컨트롤러로 전송한다.
         $("#smsForm").submit();  
       
       
    })
    
    function smscheckfunction() {
			$("#alert-success2").hide();
			$("#alert-danger2").hide();
			$("#numcheck").keyup(function() {
			var authnum =$("#authNum").val();
				console.log("authnum:"+authnum)
				var numcheck = $("#numcheck").val();
				console.log("numcheck:",numcheck);
				if (authnum != "" || numcheck != "") {
					if (authnum == numcheck) {
						$("#alert-success2").show();
						$("#alert-danger2").hide();
						$("#submit").removeAttr("disabled");
					} else {
						$("#alert-success2").hide();
						$("#alert-danger2").show();
						$("#submit").attr("disabled", "disabled");
						}
				}
			});


		}
