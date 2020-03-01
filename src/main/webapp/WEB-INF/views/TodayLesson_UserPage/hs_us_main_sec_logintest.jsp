<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function() {
	
	clearError();
		
	$('#login').click(function(event) {
						
		event.preventDefault();
		var EMAIL = $("#ID").val();
 		var PASSWORD = $("#Password").val();
			
		$.ajax({
				
			type : "POST",
			url : "/customlogin", 
			data : "EMAIL=" + EMAIL + "&PASSWORD=" + PASSWORD,
			success : 
					//everything is O.K. user logged in successfully.
					$('#exampleModal').modal('hide');
 						window.location.reload();
					},
			error : function(ex) {
				console.log(ex);
			}
		});
	});
/* 		
	var PasswordField = $('#Password');
	var EmailField = $('#ID');
	var GeneralErrorField = $('#generalErrorMessage');
		
	function showFormError(errorVal) {
		//show error messages that comming from backend and change border to red.
		for(var i=0; i < errorVal.length; i++) {
			if(errorVal[i].fieldName === 'EMAIL') {
				clearForm();
				EmailField.attr("placeholder", errorVal[i].message).css("border", " 1px solid red");
			}
				
			else if(errorVal[i].fieldName === 'PASSWORD'){
				PasswordField.val('');
				PasswordField.attr("placeholder", errorVal[i].message).css("border", " 1px solid red");
			}
			else if(errorVal[i].fieldName === 'FORM FAIL'){
				clearForm();
				GeneralErrorField.css("display", "block").html(errorVal[i].message);
			}
		}
	}
	//remove error warning tags and change tips
	function clearError() {
		//clear all and return it as default.
		$('#ID').focus(function() {
			clearForm();
			EmailField.css("border", "1px solid lightgrey");
			EmailField.attr("placeholder", "Email address");
		});	
		$('#Password').focus(function() {
			PasswordField.val('');
			PasswordField.css("border", "1px solid lightgrey");
			PasswordField.attr("placeholder", "Password");
		});
	}
	//clear fields and hide error tag.
	function clearForm() {
		EmailField.val('');
		PasswordField.val('');
		GeneralErrorField.css("display", "none");
	} 
		
});*/
	



</script>

</head>
<body>
   <!-- 로그인 모달창  -->
   <%-- <div id="hs_us_mainheader_loginmodal_div" class="hs_us_mainheader_loginmodal">
      <form method="post" action="/todaylesson">
         <div class="hs_us_mainheader_loginmodalform_div">
            <b>오늘의 레슨에 오신것을 환영합니다!</b>
            <br>
            <span>오늘의 레슨은 서로간의 재능을 연결해 모두의 경쟁력을 높이는 플랫폼 서비스입니다.</span>
            <!-- 창닫는 X Button -->
            <span onclick="document.getElementById('hs_us_mainheader_loginmodal_div').style.display='none'" class="hs_us_mainheader_loginmodal_close" title="Close Login">&times;</span>
            <div class="hs_us_mainheader_loginform">
               <label>ID</label>
               <input type='text' name='member_id' id="hs_" placeholder="아이디 입력하시오" required="required">
               <br>
               <label>PW</label>
               <input type='password' name='member_pwd' placeholder="비밀번호를 입력하시오" required="required">
               <br>
               <label>
               <input type='checkbox' name='remember-me'> Remember me
               </label>
               <br>
               <input type="submit" value="로그인">
               <br>
               <span><c:out value="${error}"/></span>
               <span><c:out value="${logout}"/></span>
            </div>
            <!-- 로그인 line  -->
            <div class=""></div>
           
               <div>
                  <a>카카오</a>
                  <a>네이버</a>
                  <a>구글</a>
                  <a>페이스북</a>
               </div>
           
            <div class="hs_us_mainheader_findidpw">
               <a href="">아이디찾기</a><span>|</span><a href="">비밀번호찾기</a>
            </div>
           
            <div class="hs_us_mainheader_join">
               <span>
                  <span>아직도 오늘의 레슨 회원이 아니신가요?</span><a href="">회원가입</a>
               </span> 
            </div>
   
            </div> <!-- class="hs_us_mainheader_loginmodalform_div" div -->
             <!-- security_form에 넣어줘야하는거(안넣어주면 에러 남) -->
            <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
          
      </form>
   </div> --%> 
   <!--  -->
   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content" style="width: 450px;">
            <div class="modal-header">
              <img src="${pageContext.request.contextPath}/resources/images/miniLogo.png" width="50" height="50"><label style="font-size: 1.5em;">You already a member?</label>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">              	
	              <div class="row">
	              	<div class="col-sm-12">
		            <div class="input-group" style="height:40px;">
				 <span class="input-group-addon">@</span>
				 <input type="text" name="ID" id="ID" class="form-control" 
					title="We'll never share your email with anyone else." 
				 placeholder="Email address" required="required" style="height:40px;">
			    </div>
		      </div>
	              </div><br>
	              <div class="row">
	              	<div class="col-sm-12">
		             <div class="input-group" style="height:40px;">
				<span class="input-group-addon"><b>*</b></span>
				<input type="password" name="Password" id="Password" class="form-control" 
				       placeholder="Password" required="required" style="height:40px;">
			     </div>
			</div>
		      </div><br>
	              <div class="row">
	                  <div class="col-sm-12">
	                    <button type="button" class="modal-outline" id="login">Login</button>
	                  </div>
	              </div>
	              <div id="generalErrorMessage" class="error-lbl" style="display:none;"></div>
              </div>
              <div class="modal-footer" style="padding: 8px;">
                      <div class="col-lg-4">
                        <button type="button" class="modal-close" data-dismiss="modal">Close</button>
                      </div>  
                      <div class="col-lg-3"></div>
                      <div class="col-lg-5">
                      	<p></p><!-- Give some white spaces -->
                        <a href="${pageContext.request.contextPath}/ForgotPassword">
				<font style="color:black; font-size:15px;">Forgot password ?</font>
			</a>
                      </div>  
                </div>
              </div>
          </div>
        </div>
   
   
   
   
      <!-- 로그인 modal -->
<script type="text/javascript">
//Modal trigger function.
/* 	function openModal() {
		$('#hs_us_mainheader_loginmodal_div').modal('show');
	} */
	
	function openModal() {
		$('#exampleModal').modal('show');
	} 
	
</script>


</body>
</html>






