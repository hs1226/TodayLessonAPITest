<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script>
//라디오버튼기능 주석으로 지웠음
/* function search_check(num) {
	if (num == '1') {
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";	
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}  */



$(document).ready(function() {
	/////////모///달///기///능///////////
	// 1. 모달창 히든 불러오기
	$('#searchBtn').click(function() {
		//시큐리티 csrf토큰
		/* var csrfHeaderName ="${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}"; */ 
		
		$('#background_modal').show();
		
		// 아이디 
		var idV = "";
		// 아이디 값 받고 출력하는 ajax

			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/userSearch?inputName_1="
						+$('#inputName_1').val()+"&inputPhone_1="+$('#inputPhone_1').val(),
						/* beforeSend : function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						}, */
				success:function(data){
					if(data == 0){
						$('#id_value').text("회원 정보를 확인해주세요!");	
					} else {
						$('#id_value').text(data);
						// 아이디값 별도로 저장
						idV = data;
					}
				}
			});
		
		
	});
	
	
	
	
	$('#searchBtn2').click(function() {
		//시큐리티 csrf토큰
		/* var csrfHeaderName ="${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";  */
		
		$('#background_modal').show();
		
		// 아이디 
		var idV = "";
		// 아이디 값 받고 출력하는 ajax

			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/searchPassword?inputId_2="
						+$('#inputId_2').val()+"&inputEmail_2="+$('#input_2').val(),
						/* beforeSend : function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						}, */
				success:function(data){
					if(data == 0){
						$('#id_value').text("회원 정보를 확인해주세요!");	
					} else {
						$('#id_value').text("이메일 전송완료");
						// 아이디값 별도로 저장
						idV = data;
					}
				}
			});
		
		
	});
	
	
	
	
	
	// 2. 모달창 닫기 버튼
	$('.close').on('click', function() {
		$('#background_modal').hide();
	});
	// 3. 모달창 위도우 클릭 시 닫기
	$(window).on('click', function() {
		if (event.target == $('#background_modal').get(0)) {
            $('#background_modal').hide();
         }
	});
	
	
	

	
	
	
});

</script>
</head>
<body>
<div class="full">
		<div class="container">
		
		
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold">
					<h3>아이디 찾기</h3>
				</div>
<!-- 				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold"	for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold" for="search_2">비밀번호 찾기</label>
				</div> -->
				<div id="searchI">
					<div class="form-group">
						<label for="inputName_1">이름</label>
						<div>
							<input type="text" class="form-control" id="inputName_1" name="inputName_1" placeholder="ex) 갓혜미">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPhone_1">휴대폰번호</label>
						<div>
							<input type="text" class="form-control" id="inputPhone_1" name="inputPhone_1" placeholder="ex) 010-7777-7777">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn" type="button" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
					</div>
				</div>
				
				
			<%-- 	
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId_2" name="inputId_2" placeholder="ex) godmisu">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="inputEmail_2"	name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn2" type="button" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
				</div>
				</div> --%>
				
				
				<form id="searchP"  style="display: none;">
				<div class="form-group">
				<label for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId_2" name="inputId_2" placeholder="ex) godmisu">
						</div>
				</div>
				<div class="form-group">
						<label class="font-weight-bold" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="inputEmail_2"	name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
				<div class="form-group">
				<input type="submit" id="searchBtn2" class="btn btn-primary btn-block" value="확인">
				<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
				</div>
				</form>
				
				
				
			</div>
			
<div id="background_modal" class="background_modal" style="display:none">
	<div class="modal_contents">
		<h4>
			<b>손님 아이디는?</b><span class="close">&times;</span>
		</h4><br>
			<h2 id="id_value"></h2>
		<br>
		<button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
<!-- 		<i class="fa fa-envelope"></i>비밀번호 찾기</button> -->
	</div>
</div>

		</div>
	</div>

</body>
</html>




