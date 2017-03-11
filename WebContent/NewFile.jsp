<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<title>http://www.thaicreate.com/php/forum/078884.html -
	ใครมีตัวอย่าง Source code PHP แบ่งหน้า แล้ววางลิ้งไว้ได้ทั้งด้านบน-ล่าง
	บ้างคะ</title>

<meta name="Generator" content="EditPlus">

<meta name="Author" content="Unidentifier">

<meta name="Keywords" content="">

<meta name="Description" content="">

<meta http-equiv="Content-Type" content="text/html; charset=utf8" />

<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
#nav {
	color: white;
	text-align: center;
	background-color: #6666ff;
	width: 30px;
	display: inline-block;
	padding: 5px;
	border: 5px solid #dadada;
	-moz-border-radius: 15px;
	border-radius: 15px;
	cursor: default;
}

.pagination {
	background-color: #dadada;
	padding: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}
</style>

</head>



<body>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var perpage = 3; // จำนวนรายการต่อหนึ่งหน้า         

							var allNum = $("div#content div.element").length; // นับจำนวน ข้อมูลทั้งหมดว่ามีกี่ชุด        

							var paginator = ""; // สร้าง navigator

							for (i = 1; i <= Math.round(parseInt(allNum)
									/ parseInt(perpage)); i++) {

								paginator += "<span id='nav'>" + i + "</span>";

							}

							$("div.pagination").each(function() { // สร้าง navigator ที่ด้านบนและด้านล่างของหน้าจอ

								$(this).html(paginator);

							});

							// ทำการแทรก div เพื่อกำกับเลขหน้า  นับตามจำนวนรายการต่อหนึ่งหน้า

							var count = 0,

							pagecount = 1,

							regenerator = "<div class='page"+pagecount+"' for='all'>";

							$("div#content div.element")
									.each(
											function() {

												count++;

												regenerator += "<div>"
														+ $(this).html()
														+ "</div>";

												if (!(count % perpage)) {

													pagecount++;

													regenerator += "</div><div class='page"+pagecount+"' for='all'>";

												}

											});

							regenerator += "</div>";

							$("div#content").empty().html(regenerator);

							$("div[for=all]").hide(); //ซ่อนข้อมูลทั้งหมดก่อน

							$("div.page1").show(400); //แสดงเฉพาะหน้าที่ 1   

							//ดักการกดคีย์บอร์ดที่ navigator-page number ที่้ด้านบนและล่างของจอภาพ

							$("div.pagination span#nav").click(function() {

								var index = $(this).text();

								$("div[for=all]").hide(400);

								$("div.page" + index).show(400);

							});

						});
	</script>

	<div id="test"></div>

	<div id="exX">Examples</div>



	<h3 id="ex2">Using Paging with multiple paginators</h3>





	<h4>Average temperature of some cities in June</h4>



	<div class="pagination"></div>



	<div id="content">


		<div class="element">

			<h5>Las Vegas</h5>

			<p>37°C / 98.6°F</p>

		</div>

		<div class="element">

			<h5>Cairo</h5>

			<p>35°C / 95°F</p>

		</div>




		<div class="pagination"></div>
</body>

</html>