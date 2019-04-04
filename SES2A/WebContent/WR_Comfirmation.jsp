<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELPS booking system</title>

<link href="css/core_WR.css" rel="stylesheet" type="text/css">
<link href="css/elssa_css_WR.css" rel="stylesheet" type="text/css">
<link href="css/elssa_booking_WR.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#newBooking").click(function() {
			window.location.href = "WR_Step1.jsp";
		});
	});
</script>
</head>
<body>

	<div id="global-utility-bar">
		<!-- UTS Logo -->
		<div id="uts-logo">
			<a href="https://xxx"><img src="images/utslogo_WR.gif"
				alt="University of Technology, Sydney homepage" width="132"
				height="30"></a>
		</div>
	</div>
	<div id="main-container">




		<div id="header">
			<a href="https://xxx" id="logo-elssa">HELPS</a>
			<div id="navigation">
				<a href="https://xxx">My Information</a> <a href="https://xxx">My
					bookings</a> <a href="https://xxx" class="CurrentScope">Workshop
					registration</a> <a href="https://xxx">Programs</a> <a
					href="https://xxx">FAQ</a> <a href="https://xxx">Exit</a>

			</div>
		</div>

		<!-- Content -->
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




			<div id="student_workshop_skillset_comfirmation">
				<p>Thank you for booking to attend the HELPS workshop:</p>

				<h3>
					<strong>The name of this workshop </strong>on <strong>(The
						date) </strong>,(the time) at (the location).
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
			</div>
			<p></p>
			<input id="newBooking" type="button" value="Start new booking"></input>

		</div>


		<!-- Footer -->
		<div id="footer-wrapper">

			<div class="footer-navigation">

				<a href="https://xxx">My Information</a> <a href="https://xxx">My
					bookings</a> <a href="https://xxx" class="CurrentScope">Workshop
					registration</a> <a href="https://xxx">Programs</a> <a
					href="https://xxx">FAQ</a> <a href="https://xxx">Exit</a>
			</div>

			<div id="footer-nav"></div>
			<div id="global-footer">
				<div id="footer-img">
					<a href="https://xxx"> <img src="images/uts_logo_footer_WR.gif"
						alt="UTS homepage" width="130" height="29"></a> <br>
					<a href="https://xxx">UTS is a member of the<br>Australian
						Technology Network of Universities
					</a>
				</div>

				<div id="footer-text">
					<div class="primary-links">
						<a href="https://xxx">Staff directory</a> <img
							src="images/separator_WR.gif" alt="" width="4" height="6"> <a
							href="https://xxx">Campus maps</a> <img
							src="images/separator_WR.gif" alt="" width="4" height="6"> <a
							href="https://xxx">Newsroom</a> <img src="images/separator_WR.gif"
							alt="" width="4" height="6"> <a href="https://xxx">What's
							on</a>
					</div>
					© Copyright UTS - CRICOS Provider No: 00099F - 27 November 2008
					10:34 AM<br> The page is authorised by Director, SSU - Send
					comments to <a href="https://xxx">operations manager</a><br> <a
						href="https://xxx">Disclaimer</a> | <a href="https://xxx">Privacy</a>
					| <a href="https://xxx">Copyright</a> | <a href="https://xxx">Accessibility</a>
					| <a href="https://xxx">Web policy</a> | <a href="https://xxx">UTS
						homepage</a>
				</div>
			</div>
		</div>

	</div>
	<!-- end main-container -->




</body>
</html>