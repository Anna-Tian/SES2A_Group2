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
		
		$("#newBooking").click(function() {
			window.location.href = "WR_Step1_new.jsp";
		});
		
	});
</script>
</head>
<body>

<div class="head"></div>
	<div id="content">
	
	<form method="post" class="workshop">
				<input type="hidden" name="workshopID" value="10409">
				<p>Thank you for booking to attend the HELPS workshop:</p>

				<h3>
					<strong>${workShop.name } </strong>on <strong>${workShop.days }</strong>,${workShop.startDate } at ${room.roomLocation }.
				</h3>
				<ul>
					<li>
						<p>Please know that failure to turn up for your registered
							workshop without timely cancellation and valid reasons may
							preclude you from making future bookings.</p>
					</li>
					<li>
						<p>If your circumstances change and you're no longer available
							to attend your registered workshop, please make sure to cancel
							your booking at least 24 hours beforehand</p>
					</li>
				</ul>
				<p>
					For further information about HELPS programs, please contact the
					HELPS office: 9514 9733 or <a href="helps@uts.edu.au">helps@uts.edu.au</a>
				</p>
					
			</form>
			<p></p>
			<input id="newBooking" type="button" value="Start new booking"></input>

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