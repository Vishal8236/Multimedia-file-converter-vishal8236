
$(document).ready(function () {
	var ele = document.getElementById('show-noti-imgcomp').childNodes.length
	
	$('#upload-imgopti').click(function (e) { 
		e.preventDefault();
		if (ele == 0)
		{
			// $('#upload-spinner').show();
			$("#upload-spinner").css("display", "block");
		}
	});
	if(ele == 2)
	{
		$("#upload-spinner").css("display", "none");	
	}
});