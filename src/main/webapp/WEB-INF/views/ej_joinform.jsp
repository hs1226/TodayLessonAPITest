<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<title>Insert title here</title>

</head>
<body>
<h2>회원가입</h2>
<form method="post" action="/joinresult">
<label>아이디</label>
<input type="text" name="id" id="id" required="required" placeholder="아이디">
<button type="button" class="btn btn-primary" id="multicheck">중복확인</button><br>
<div id="checkMsg"></div>

<label>비밀번호</label>
<input type="password" name="pwd" id="pwd" required="required" placeholder="비밀번호"><br>
<label>비밀번호확인</label>
<input type="password" name="pwdcheck" id="pwdcheck" required="required" placeholder="비밀번호확인"
onkeyup="passwordCheckFunction();"
><br>
<div class="alert alert-success" id="alert-success">비밀번호가
						일치합니다.</div>
					<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
						않습니다.</div>

<label>이름</label>
<input type="text" name="name" id="name" placeholder="이름"><br>
<label>생년월일</label>
<input type="date" name="birth" id="birth" ><br>
<label>연락처</label>
<input type="text" name="phone" id="phone" >
<button type="button" class="btn btn-primary" name="smsauth">본인인증</button><br>
<label for='addr'>주소</label>
					<div class='form-row'>
						<div class='col-5'>
							<input type="text" id="sample4_postcode" name='zipcode'
								placeholder="우편번호" class='form-control'>
						</div>
						<input type="button" onclick="sample4_execDaumPostcode()"
							value="우편번호 찾기" readonly="readonly" class='btn btn-primary'><br>
					</div>
					<div class='juso'>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소"
							name="roadaddr" readonly="readonly" class="form-control">
						<input type="radio" id='roadAddress' name='addrselect' value="0"
							required><label for="addrselect">도로명주소 선택</label> <br>

						<input type="text" id="sample4_jibunAddress" placeholder="지번주소"
							name="jibunaddr" readonly="readonly" class="form-control">
						<input type="radio" id='jibunAddress' name='addrselect' value="1"><label
							for="addrselect">지번주소 선택</label><br>
					</div>
					<span id="guide" style="color: #999"></span> <label
						for="detailaddr">상세주소</label> <input type="text" id="detailaddr"
						name="detailaddr" class="form-control"> 




<!-- <input type="text" name="zipcode" placeholder="도로명주소"><br>
<input type="text" name="zipcode" placeholder="상세주소"><br> -->



<label>닉네일</label>
<input type="text" name="nick" placeholder="닉네임"><br>
<button type="submit" id="submit" class="btn btn-primary">회원가입</button><br>

</form>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 도로명 조합형 주소 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
							if (fullRoadAddr !== '') {
								fullRoadAddr += extraRoadAddr;
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sample4_roadAddress').value = fullRoadAddr;
							document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								//예상되는 도로명 주소에 조합형 주소를 추가한다.
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								//document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
								document.getElementById('sample4_roadAddress').value = expRoadAddr;
							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								//document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
								document.getElementById('sample4_jibunAddress').value = expJibunAddr;
							} else {
								document.getElementById('guide').innerHTML = '';
							}
						}
					}).open();
		}
	</script>

	<script>
		$(function() {
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
				type :'post',
				url : 'idCheck.do',
				data : {"id" : $('#id').val()},
				success : function(data) {
					if(data == 0){
						$('#checkMsg').html('<p style="color:blue">사용가능</p>');
                	}
                	else{
                    	$('#checkMsg').html('<p style="color:red">사용불가능</p>');
                	}
            	},
				error : function(data) {
					console.log(data);
				}
			});
		});
	</script>

<script>
var IMP = window.IMP; // 생략해도 괜찮습니다.
IMP.init("imp00000000"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

// IMP.certification(param, callback) 호출
IMP.certification({ // param
  merchant_uid: "ORD20180131-0000011"
}, function (rsp) { // callback
  if (rsp.success) {
    
    // 인증 성공 시 로직,
    
  } else {
    
    // 인증 실패 시 로직,
    
  }
});

IMP.certification({
    /* ...중략... */
  }, function (rsp) { // callback
    if (rsp.success) { // 인증 성공 시
      // jQuery로 HTTP 요청
      jQuery.ajax({
        url: "https://www.myservice.com/certifications", // 서비스 웹서버
        method: "POST",
        headers: { "Content-Type": "application/json" },
        data: { imp_uid: rsp.imp_uid }
      });
    } else {
      alert("인증에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
    }
  });
</script>

<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    
    <!--아임포트 본인인증  -->
    <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  </body>
</body>
