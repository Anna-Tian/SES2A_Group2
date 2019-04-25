<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/student_footer.css" />
<link rel="stylesheet" type="text/css" href="css/student_menu.css">
</head>
<body>

<header>
		<div class="logo"><img src="img/HeaderFooter/logo.png" style="height: 100%;"></div>
		<nav class="active">
			<ul>
				<li class="sub-menu"><a href="#">MyInformation</a>
					<ul>
						<div class="tri"></div>
						<li><a href="#">Profile</a></li>
						<li><a href="#">MyBookings</a></li>
					</ul>
				</li>
				<li class="sub-menu"><a href="#">Workshop</a>>
					<ul>
						<div class="tri"></div>
						<li><a href="#">Step-1</a></li>
						<li><a href="#">Step-2</a></li>
					</ul>
				</li>
				
				<li><a href="#">Exit</a></li>
			</ul>
		</nav>
	</header>
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


			<h2>The skill-set title</h2>

			<div id="student_workshop_list_instruction">
				<h4
					style="margin: 10px 0px; padding: 0px; border: 0px; vertical-align: baseline; font-size: 1.154em; color: rgb(0, 0, 0); font-family: 'Lucida Grande', 'Lucida Sans Unicode', sans-serif; line-height: 20.0063px;">
					&nbsp;</h4>
				<h2>Step 2:</h2>
				<ul>
					<li>
						<p>
							<strong>To avoid a timetable clash</strong>, please check the
							date, time and location of each session carefully.
						</p>
					</li>
					<li>
						<p>
							For additional session information and to register, click on the
							<strong>‘detail’</strong> link.
						</p>
					</li>
				</ul>
				<p>&nbsp;</p>
			</div>


			<div>


				<br>
				<h3>Sessions</h3>
				

				<table class="collapsed" style="width: 1000px; height: 100px;">
					<tbody>
						<tr>
							<th>Topics</th>
							<th>Start date</th>
							<th>Finish date</th>
							<th>Days</th>
							<th>Time</th>
							<th>No.<br>Sessions
							</th>
							<th>Places<br>avail.
							</th>
							<th>Detail</th>
						</tr>

						<!-- <tr>
							<td>bchn</td>
							<td>xx/xx/xxxx</td>
							<td>yy/yy/yyyy</td>
							<td>zz</td>
							<td>xx:xx - yy:yy</td>
							<td>z</td>
							<td>0</td>
							<td><a href="WR_Details_new.jsp">Detail</a></td>
						</tr> -->
						<c:forEach var="sessions1" items="${qqq }">
						  	<tr style="background: gray;">
							  	<td>${sessions1.name }</td>
							  	<td>${sessions1.startDate }</td>
							  	<td>${sessions1.endDate }</td>
							  	<td>${sessions1.days }</td>
							  	<td>${sessions1.days }</td>
							  	<td>${sessions1.name }</td>
							  	<td>${sessions1.name }</td>
							  	<td><a href="/SES2A/DetailsServlet?session1=1">Detail</a></td>
						 	</tr>
					
					  </c:forEach>
 
					</tbody>
				</table>

			</div>
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

<div id="foot">
		<nav class="footer-menu" role="navigation"
			aria-label="Site information">
			<ul data-region="footer_first" block="block-footer"
				class="footer-menu__level-1">
				<li class="footer-menu__item" id="li1"><a href="https://www.uts.edu.au/about"
					target="" rel="" data-drupal-link-system-path="node/683"><span>About
							UTS</span></a>
					<ul class="footer-menu__level-2">
						<li class="footer-menu__item"><a href="https://www.uts.edu.au/about/university/overview"
							target="" rel="" data-drupal-link-system-path="node/684">The
								University</a></li>
						<li class="footer-menu__item"><a
							href="http://maps.uts.edu.au" target="" rel="">Campus maps</a></li>
						<li class="footer-menu__item"><a href="https://www.uts.edu.au/about/uts-governance/about-governance-uts"
							target="" rel="" data-drupal-link-system-path="node/704">UTS
								governance</a></li>
						<li class="footer-menu__item"><a href="https://www.uts.edu.au/about/faculties/overview"
							target="" rel="" data-drupal-link-system-path="node/695">Faculties</a>
						</li>
						<li class="footer-menu__item"><a
							href="https://www.uts.edu.au/staff/jobs-uts/uts-privacy-statement" target="" rel=""
							data-drupal-link-system-path="node/248336">Privacy statement</a>
						</li>
						<li class="footer-menu__item"><a
							href="https://www.uts.edu.au/about/utsweb-statements/accessibility-statement" target=""
							rel="" data-drupal-link-system-path="node/4991">Accessibility</a>
						</li>
						<li class="footer-menu__item"><a
							href="https://www.uts.edu.au/about/utsweb-statements/disclaimer" target="" rel=""
							data-drupal-link-system-path="node/4984">Disclaimer</a></li>
					</ul></li>
				<li class="footer-menu__item" id="li2"><a href="https://www.lib.uts.edu.au/"
					target="" rel="" data-drupal-link-system-path="node/3236"><span>Library</span></a>
					<ul class="footer-menu__level-2">
						<li class="footer-menu__item"><a href="http://find.lib.uts.edu.au/"
							target="" rel="" data-drupal-link-system-path="node/4388">Search catalogue</a></li>
						<li class="footer-menu__item"><a href="https://www.lib.uts.edu.au/events"
							target="" rel="" data-drupal-link-system-path="node/4387">What&#039;s on</a></li>
						<li class="footer-menu__item"><a href="https://www.lib.uts.edu.au/help"
							target="" rel="" data-drupal-link-system-path="node/4389">Help and resources</a></li>
					</ul></li>
				<li class="footer-menu__item" id="li3"><a href="http://newsroom.uts.edu.au/"
					target="" rel="" data-drupal-link-system-path="node/2666"><span>Newsroom</span></a>
					<ul class="footer-menu__level-2">
						<li class="footer-menu__item"><a href="http://newsroom.uts.edu.au/events/upcoming" target=""
							rel="" data-drupal-link-system-path="node/4385">Events</a></li>
						<li class="footer-menu__item"><a href="http://newsroom.uts.edu.au/find-an-expert/"
							target="" rel="" data-drupal-link-system-path="node/3165">Find
								an expert</a></li>
						<li class="footer-menu__item"><a
							href="http://www.newsroom.uts.edu.au/media-centre" target="" rel=""
							data-drupal-link-system-path="node/4390">Media centre</a></li>
					</ul></li>
				<li class="footer-menu__item" id="li4"><a href="https://www.uts.edu.au/staff"
					target="" rel="" data-drupal-link-system-path="node/715"><span>Staff</span></a>
					<ul class="footer-menu__level-2">
						<li class="footer-menu__item"><a href="https://staff.uts.edu.au/"
							target="" rel="" data-drupal-link-system-path="node/91701">Staff
								Connect</a></li>
						<li class="footer-menu__item"><a href="https://email.itd.uts.edu.au/email/" target=""
							rel="" data-drupal-link-system-path="node/4570">Webmail</a></li>
						<li class="footer-menu__item"><a href="https://email.itd.uts.edu.au/webapps/directory/byname/"
							target="" rel="" data-drupal-link-system-path="node/4569">Staff
								Directory</a></li>
						<li class="footer-menu__item"><a href="https://www.uts.edu.au/staff/jobs-uts/working-uts"
							target="" rel="" data-drupal-link-system-path="node/247991">Jobs
								at UTS</a></li>
					</ul></li>

				<div class="field-item">
					<h3>
						<a href="https://www.uts.edu.au/about/contacts/uts-contacts"><span>Contact us</span></a>
					</h3>
					<p>
						<a href="https://www.uts.edu.au/current-students/managing-your-course/ask-uts">Student and public enquiries</a>
					</p>
					
					<ul class="footer-social__menu">
						<li class="footer-social__item">
							<a href="http://facebook.com/UTSEngage"><img src="img/HeaderFooter/facebook.png" alt="Facebook"></a>
						</li>
						<li class="footer-social__item"><img src="img/HeaderFooter/black.png"/></li>
						<li class="footer-social__item">
							<a href="https://twitter.com/utsengage"><img src="img/HeaderFooter/Twitter.png" alt="Twitter"></a>
						</li>
						<li class="footer-social__item"><img src="img/HeaderFooter/black.png"/></li>
						<li class="footer-social__item">
							<a href="http://instagram.com/utsengage"><img src="img/HeaderFooter/instagram.png" alt="Instagram"></a>
						</li>
						<li class="footer-social__item"><img src="img/HeaderFooter/black.png"/></li>
						<li class="footer-social__item">
							<a href="http://youtube.com/user/utschannel"><img src="img/HeaderFooter/youtube.png" alt="Youtube"></a>
						</li>
						<li class="footer-social__item"><img src="img/HeaderFooter/black.png"/></li>
						<li class="footer-social__item">
							<a href="http://linkedin.com/company/166678"><img src="img/HeaderFooter/social-linkedin.png" alt="Linkedin"></a>
						</li>
					</ul>
					
				</div>
			</ul>
		</nav>
	</div>

</body>
</html>