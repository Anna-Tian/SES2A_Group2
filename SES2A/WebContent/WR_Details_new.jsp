<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/student_footer.css" />
<link rel="stylesheet" type="text/css" href="css/student_menu.css">
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$(".head").load("student_menu.html");
		$(".foot").load("foot.html");
		
	});
</script>
</head>
<body>

<div class="head"></div>
	<div id="content">

			<noscript>
				<p style="color: red;">Either your browser does not support
					javascript or javascript has been turned off. The HELPS Booking
					System Admin area needs javascript to work. Please:</p>
				<p style="color: red;">
					- Switch to another browser that does supports javascript OR<br />
					- Turn javsacript on
				</p>
			</noscript>



			<h2>The topic</h2>
			<form method="post" class="workshop">
				<input type="hidden" name="workshopID" value="10409">
				
					<div>
						<strong>Title</strong>: ${workShop.name }
					</div>
					<div>
						<strong>Room</strong>:	${room.roomLocation }
						</div>
						<div>
							<strong>Date</strong>: ${workShop.startDate } - ${workShop.endDate }
						</div>
						<div>
							<strong>Time</strong>: ${workShop.days }
						</div>

						<div>
							<strong>Target Group</strong>: ${workShop.targetGroup }
						</div>

						<div>
							<strong>What it covers</strong>: ${workShop.description }
						</div>

						<div>
							<strong>Places available</strong>: ${workShop.placeAvailable }
						</div>
			</form>

			<p></p>
			<input id="bookingWorkshop" type="button" value="Book this workshop"></input>
			</div>
	<footer>
		
	</footer>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.menu-toggle').click(function(){
				$('nav').toggleClass('active')
			})
			$('ul li').click(function(){
				$(this).siblings().removeClass('active')
				$(this).toggleClass('active')
			})
		})
	</script>

<div class="foot"></div>

</body>
</html>