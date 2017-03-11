<!DOCTYPE html>
<html>
<head>

</head>

<body>

<input type="text" id="date_manual" value="">
<input type="button" id="btn_manual_generate" value="Generate">
<input type="button" id="btn_manual_show" value="Show">
<input type="button" id="btn_manual_hide" value="Hide">
<input type="button" id="btn_manual_destroy" value="Destroy">

<script type="text/javascript">
	$(function(){
		$('#btn_manual_generate').click(function(){
			$('#date_manual').appendDtpicker({
				"inline": true
			});
		});
		$('#btn_manual_show').click(function(){
			$('#date_manual').handleDtpicker('show');
		});
		$('#btn_manual_hide').click(function(){
			$('#date_manual').handleDtpicker('hide');
		});
		$('#btn_manual_get_date').click(function(){
			var date = $('#date_manual').handleDtpicker('getDate');
			window.alert(date.toString());
		});
		$('#btn_manual_set_date').click(function(){
			$('#date_manual').handleDtpicker('setDate', new Date(2014, 04, 25, 0, 0, 0));
		});
		$('#btn_manual_destroy').click(function(){
			$('#date_manual').handleDtpicker('destroy');
		});
	});
</script>

</body>
</html>