<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	//request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
	//request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
	String inputYn = request.getParameter("inputYn");
	String roadFullAddr = request.getParameter("roadFullAddr");
	String roadAddrPart1 = request.getParameter("roadAddrPart1");
	String roadAddrPart2 = request.getParameter("roadAddrPart2");
	String jibunAddr = request.getParameter("jibunAddr");
	String zipNo = request.getParameter("zipNo");
	String addrDetail = request.getParameter("addrDetail");
%>
</head>

	
	
<script>
//opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("주소입력화면 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function init(){
	var url = location.href;
	var confmKey = "devU01TX0FVVEgyMDIwMDIyNzEwMzUzNTEwOTUwMDM=";//승인키
	// resultType항목 추가(2016.10.06)
	var resultType = "4"; // 도로명주소 검색결과 화면 출력유형, 1 : 도로명, 2 : 도로명+지번, 3 : 도로명+상세건물명, 4 : 도로명+지번+상세건물명
	var inputYn= "<%=inputYn%>";
	if(inputYn != "Y"){
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.resultType.value = resultType; // resultType항목 추가(2016.10.06)
		document.form.action="http://www.juso.go.kr/addrlink/addrLinkUrl.do"; 
		// 인터넷망
		//document.form.action="http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do"; //모바일 웹인 경우, 인터넷망
		document.form.submit();
	}else{
		/** API 서비스 제공항목 확대 (2017.02) **/
		opener.jusoCallBack("<%=roadFullAddr%>","<%=roadAddrPart1%>","<%=addrDetail%>", "<%=roadAddrPart2%>", "<%=jibunAddr%>","<%=zipNo%>");
			window.close();
		}
	}
</script>


<body onload="init();">
	<form id="form" name="form" method="post">
	    <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
		<input type="hidden" id="confmKey" name="confmKey" value="devU01TX0FVVEgyMDIwMDIyNzEwMzUzNTEwOTUwMDM=" /> 
		<input type="hidden" id="returnUrl" name="returnUrl" value="${pageContext.request.contextPath }/write" />
		<input type="hidden" id="resultType" name="resultType" value="4" /> 
	</form>
	
	
		
	
	
</body>
</html>