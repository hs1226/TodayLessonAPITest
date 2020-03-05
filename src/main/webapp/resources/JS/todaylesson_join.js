		$(function(){
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("input").keyup(function() {
				var pwd1 = $("#pwd").val();
				var pwd2 = $("#pwdcheck").val();
				if (pwd1 != "" || pwd2 != "") {
					if (pwd1 == pwd2) {
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#submit").removeAttr("disabled");
					} else {
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submit").attr("disabled", "disabled");
					}
				}
			});

			$("input")

		});
		
		$('#multicheck').click(function() {

			
			if($("#id").val() == ""){
				alert("아이디를 입력하세요");
				return;
			}
			
			$.ajax({
				
				
				type :'POST',
				url : 'idCheck',
				data : {"id" : $('#id').val()},

				success : function(data) {
					console.log("data : "+ data);
					if(data == 0){
						$('#checkMsg').html('<p style="color:blue">사용가능</p>');
						$("#submit").removeAttr("disabled");
                	}
                	else{
                    	$('#checkMsg').html('<p style="color:red">사용불가능</p>');
                    	$("#submit").attr("disabled", "disabled");
                    	$('#id').val('');
  	                  $('#id').focus();
                	}
            	},
				error : function(data) {
					console.log(data);
					console.log("ajax error");
				}
			});
		});
