
$(function(){
	
	$.get("AjaxGetPetType",function(responseText) {
		
		$.each(responseText,function(key,val) {
			$('select#refer_type_pet').append($('<option>',{value : val.type_id,text : val.type_name}));
		});
		$('select#refer_type_pet').trigger( "change" );
	});
	
	$('select#refer_type_pet').on("change",function(){
		var thisVal = $(this).val();
		
		$.get("AjaxGetProductWhereServlet",{tid:thisVal},function(response) {
			
			$("div#detailProduct").empty();
			$.each(response,function(key,val) {
				
				var $detailProduct = $(' '
						+ ' <div class="col-md-3" style="height: 240px;" align="center"> '
						+ ' 	<br> '
						+ ' 	<img src="images/'+val.product_img_name+'" alt="'+val.product_name+'" width="150" height="80" /> '
						+ ' 	<br> '
						+ ' 	<span class="price">'+val.product_price+'</span> บาท '
						+ ' 	<br> '
						+ ' 	<textarea>'+val.product_name+'</textarea>'
						+ ' 	<br> '
						+ ' 	<a href="#" onclick="simpleCart.add(\'name='+val.product_name+'\',\'price='+val.product_price+'\',\'image=images/'+val.product_img_name+'\');return false;"> '
						+ ' 		<button type="button" class="btn btn-sm btn-info btn-lg" > '
						+ '         	<span ></span>  เพิ่มสินค้า '
						+ '         </button>'
						+ ' 	</a> '
						+ ' 	<br> '
						+ ' </div> ');
			$("div#detailProduct").append($detailProduct);
			
			});
		});
	});
});