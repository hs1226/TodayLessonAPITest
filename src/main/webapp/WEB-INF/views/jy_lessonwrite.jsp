<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"	rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="http://localhost:9090/myapp/resources/JS/summernote-ko-KR.js"></script>


<style type="text/css">

.layer { display: none; }

</style>

<script>
	$(document).ready(function() {
		
		
		$('textarea').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR'
		});		
	
		
		
		$('#lessontype').change(function() {
		let state = $('#lessontype option:selected').val();
		console.log(state);
		if ( state == 3 ) {
			$('.layer').hide();
		} else {
			$('.layer').show();
		}
		});	
	});
	
	
	
</script>




</head>
<body>



<script>


function addr(roadAddrPart1) {

	console.log(roadAddrPart1);

	$.ajax({
		//여기엔 우리가 요청하는 정보들이 들어감
		method : "GET",
		url : "https://dapi.kakao.com/v2/local/search/address.json",
		data : {
				query : roadAddrPart1
		},
		headers : {
				Authorization : "KakaoAK 5443dbc41329c551772b1a1cbb3b44db"
		}
			}).done(
				function(msg) {
					// 성공시 실행되는 곳 > 즉 응답이 여기 표시된다고 할 수 있음
					console.log(msg);
					// > 콘솔창에 제이슨 타입으로 들어오는 것을 볼 수 있음

					let adn = msg.documents[0].address.address_name;
					//  "전북 익산시 부송동 10"  이라는 주소를 볼 수 있음
					let yy = msg.documents[0].address.x;
					let xx = msg.documents[0].address.y;

					$(".map").append("<input type='hidden' id='lessonlat' name='lat' value="+xx+">"
					+"<input type='hidden' id='lon' name='lessonlon' value="+yy+">" );
				});

}



function goPopup() {
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("${pageContext.request.contextPath }/jusoPopup", "pop","width=570,height=420, scrollbars=yes, resizable=yes");

	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
		roadAddrPart2, jibunAddr, zipNo) {
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	
	console.log(roadFullAddr);
	
	
	document.form.lessonaddr.value= roadFullAddr;
	document.form.lessonzipno.value = zipNo;
	   
	
	addr(roadAddrPart1);

	}


</script>



<form action="${pageContext.request.contextPath }/insertresult" method="post" name="form">

<label>레슨명</label><br>
<input type="text" id="lessontitle" id="lessontitle"><br>

<label>레슨 내용</label><br>
<textarea id="summernote" name="lessoncontent"></textarea><br>

<label>수강생수</label><br>
<input type="number" id="lessonmembermax" id="lessonmembermax"><br>

<label>카테고리</label><br>
<select name="lessoncategory">
  <option value="0" selected="selected">---</option>
  <option value="1">운동</option>
  <option value="2">교육</option>
  <option value="3">핸드메이드</option>
  <option value="4">it</option>
  <option value="5">요리</option>
</select>
<br>

<label>가격</label><br>
<input type="number" id="lessoncost" id="lessoncost"><br>

<label>시작일</label><br>
<input type="date" id="lessonstart" id="lessonstart"><br>

<label>종료일</label><br>
<input type="date" id="lessonend" id="lessonend"><br>

<label>레슨타입</label><br>
<select name="lessontype" id="lessontype">
  <option value="0">---</option>
  <option value="1">원데이 레슨</option>
  <option value="2">다회성 레슨</option>
  <option value="3">온라인 레슨</option>
</select>
<br>



<div class="layer">


<label>레슨시간</label><br>
<input type="time" id="lessontime" id="lessontime"><br>

<label>레슨주소</label><br>
우편번호<br>
<input type="hidden" id="confmKey" name="confmKey" value="devU01TX0FVVEgyMDIwMDIyNzEwMzUzNTEwOTUwMDM="> 
<input type="text" id="lessonzipno" name="lessonzipno" readonly style="width: 100px" value=""> 
<input type="button"value="주소검색" onclick="goPopup();">
<br>	
		
도로명주소<br>
<input type="text" id="lessonaddr" name="lessonaddr" style="width: 50%" readonly="readonly" value="">
<p class="map"></p>
</div>


<label>총강의수</label><br>
<input type="number" id="lessonnumber" name="lessonnumber"><br>


<label>시니어명</label><br>
<input type="text" id="lessonseniortitle" name="lessonseniortitle"><br>

<label>시니어소개</label><br>
<textarea id="lessonseniorcontent" name="lessonseniorcontent" ></textarea><br>




<input type="submit" value="글 작성"/>

</form>



</body>
</html>