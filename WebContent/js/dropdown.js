//สัตวแพทย์ เลขบอกสถานะ



//เลือกกรง

$(document).ready(function() {
	$deposit_size = $("select[name='deposit_size']");
	$mem_gender = $("select[name='deposit_cage']");

	deposit_size.change(function() {

		if ($(this).val() == "1") {
			$("select[name='deposit_cage'] option").remove();
			$("<option>ชาย</option>").appendTo($mem_gender);
		}

		if ($(this).val() == "2") {
			$("select[name='deposit_cage'] option").remove();
			$("<option>หญิง</option>").appendTo($mem_gender);
		}

		if ($(this).val() == "3") {
			$("select[name='deposit_cage'] option").remove();
			$("<option>หญิง</option>").appendTo($mem_gender);
		}

	});
});
