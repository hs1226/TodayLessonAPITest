	
$(document).ready(function() {

	var modal=document.getElementById('hs_us_mainheader_loginmodal_div');

	$(window).on('click', function() {
		if(event.target == modal) {
			modal.style.display = "none";
		}
	});

	$('.hs_us_mainheader_login').on('click', function() {
		$('#hs_us_mainheader_loginmodal_div').modal();
	});
		
})