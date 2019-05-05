<%@ page import="com.dao.MessageDatabase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELPS booking system</title>

<link href="css/core.css" rel="stylesheet"
	type="text/css">
<link href="css/elssa_css.css" rel="stylesheet"
	type="text/css">
<link href="css/elssa_booking.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="js/jquery.js"></script>
<script type="text/javascript"
	src="js/core.js"></script>
<style>
@media print {
	#ghostery-purple-box {
		display: none !important
	}
}
</style>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script>
$(function(){
	var mess = "<%=MessageDatabase.getCurrentMessage(10).getMessageDetailed()%>";
	$("#student_logon_annoucement").html(mess);
	var mess2 = "<%=MessageDatabase.getCurrentMessage(11).getMessageDetailed()%>";
	$(".content-right").html(mess2);
});
</script>
</head>
<body data-gr-c-s-loaded="true">

	<div id="global-utility-bar">
		<!-- UTS Logo -->
		<div id="uts-logo">
			<a href="http://www.uts.edu.au/"><img src="img/utslogo.gif"
				alt="University of Technology, Sydney homepage" width="132"
				height="30"></a>
		</div>
	</div>
	<div id="main-container">




		<div id="header">
			<a href="http://www.ssu.uts.edu.au/helps/index.html" id="logo-elssa">HELPS</a>
			<div id="navigation"></div>
		</div>

		<!-- Content -->
		<div id="content">


			<style type="text/css">
#a-box {
	margin: 0;
	padding: 0;
	padding-left: 1%;
	margin-left: 3%;
	width: 94%;
	border: 1px dotted #BFBFBF;
	border-left: 5px solid #BFBFBF;
}

#a-title {
	font-weight: bold;
	color: red;
}
</style>



			<noscript>
				<p style="color: red;">Either your browser does not support
					javascript or javascript has been turned off. The HELPS Booking
					System Admin area needs javascript to work. Please:</p>
				<p style="color: red;">
					- Switch to another browser that does supports javascript OR<br />
					- Turn javascript on and then continue
				</p>
			</noscript>

			<div id="a-box">
				<p id="a-title">Announcement:</p>
				<div id="student_logon_annoucement">
					<h1>Welcome to HELPS booking system.</h1>
					<p>&nbsp;</p>
					<h2>Logon to register for HELPS Programs.</h2>
					<p>Registration is now open for 2019 Autumn workshops!&nbsp;</p>
					<p>At this stage, we only open registration for March and April
						workshops. For the remaining workshops, registration will be open
						in week 5.&nbsp;</p>

				</div>
			</div>


			<div class="content-left">

				<noscript>
					<tr>
						<td colspan="2"><span style="color: red;">Your browser
								has to support javascript in order for you to login the HELPS
								Booking System Admin area</span></td>
					</tr>
				</noscript>
				<table id="logonbox">
					<tbody>
						<tr>
							<th colspan="2">STUDENT LOGON</th>
						</tr>


						<tr>
							<td>
								<form action="https://helps-booking.uts.edu.au/index.cfm"
									method="post" name="logonForm" id="logonForm">
									<input type="hidden" name="scope" value="project"> <input
										type="hidden" name="action" value=""> <label
										for="UserName">Student ID</label>
								</form>
							</td>
							<td><input type="text" name="UserName" value="" size="20"></td>
						</tr>
						<tr>
							<td><label for="UserPassword">Password</label></td>
							<td><input type="password" name="UserPassword" size="20"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><input type="Submit" name="logon" value="Logon"></td>
						</tr>


					</tbody>
				</table>

			</div>

			<div class="content-right">
				<div class="box" id="student_logon_left">
					<ul>
						<li><a href="http://www.ssu.uts.edu.au/helps/about.html">HELPS
								home and contact details</a></li>
						<li><a href="https://servicedesk.uts.edu.au/CAisd/pdmweb.exe">IT
								Help desk if you have login issues</a></li>
						<li><a href="https://www.facebook.com/UTSHELPS">Like us
								on <strong>Facebook</strong> to keep up with
								what's&nbsp;happening&nbsp;at HELPS
						</a></li>
					</ul>
					<p>&nbsp;</p>

				</div>
			</div>


			<script type="text/javascript">
				document.getElementById('logonForm').UserName.focus();
			</script>
		</div>


		<!-- Footer -->
		<div id="footer-wrapper">

			<div id="footer-nav"></div>
			<div id="global-footer">
				<div id="footer-img">
					<a href="http://www.uts.edu.au/"> <img src="img/footer.gif"
						alt="UTS homepage" width="130" height="29"></a> <br>
					<a href="http://www.atn.edu.au/">UTS is a member of the<br>Australian
						Technology Network of Universities
					</a>
				</div>

				<div id="footer-text">
					<div class="primary-links">
						<a href="http://email.itd.uts.edu.au/webapps/directory/byname/">Staff
							directory</a> <img src="img/HELPS booking system_files/separator.gif"
							alt="" width="4" height="6"> <a
							href="http://www.uts.edu.au/about/mapsdirections/">Campus
							maps</a> <img src="img/HELPS booking system_files/separator.gif"
							alt="" width="4" height="6"> <a
							href="http://www.newsroom.uts.edu.au/">Newsroom</a> <img
							src="img/HELPS booking system_files/separator.gif" alt=""
							width="4" height="6"> <a
							href="http://www.events.uts.edu.au/web/">What's on</a>
					</div>
					© Copyright UTS - CRICOS Provider No: 00099F - 27 November 2008
					10:34 AM<br> The page is authorised by Director, SSU - Send
					comments to <a href="mailto:sang-eun.oh@uts.edu.au">operations
						manager</a><br> <a href="http://www.uts.edu.au/disclaimer.html">Disclaimer</a>
					| <a href="http://www.uts.edu.au/privacy.html">Privacy</a> | <a
						href="http://www.uts.edu.au/copyright.html">Copyright</a> | <a
						href="http://www.uts.edu.au/accessibility.html">Accessibility</a>
					| <a href="http://www.gsu.uts.edu.au/policies/webpolicy.html">Web
						policy</a> | <a href="http://www.uts.edu.au/">UTS homepage</a>
				</div>
			</div>
		</div>

	</div>
	<!-- end main-container -->




</body>
</html>