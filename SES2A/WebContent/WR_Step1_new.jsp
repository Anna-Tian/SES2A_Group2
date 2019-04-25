<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELPS booking system</title>
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
	<div class="content">
		
	<h2>HELPS workshop booking</h2>
			<div id="student_workshop_skillset_instruction">
				<h3>
					<strong>Important information:</strong>
				</h3>
				<ul>
					<li>
						<p>
							<strong>Follow </strong>each step to complete your booking<span
								style="font-weight: bold;"> </span>
						</p>
					</li>
					<li>
						<p>
							<strong>Check </strong><span class="st">the time to ensure
								that there is no timetable clash</span>
						</p>
					</li>
					<li>
						<p>
							<strong>Check your email</strong> (UTS&nbsp;email address) for
							the booking confirmation
						</p>
					</li>
					<li>
						<p>
							<strong>Cancel, </strong>if no longer available, <strong>24
								hours before </strong>the scheduled session by clicking on '<strong>My
								Booking</strong>' tab and then the '<strong>detail</strong>' link
						</p>
					</li>
					<li>
						<p>Please know that failing to turn up for your registered
							workshop is not fair to those on the waiting list. Repeat
							offenders (2 no-shows) may be barred from registering for
							workshops.</p>
					</li>
				</ul>
				<p>&nbsp;</p>
				<p>
					<strong>Registration is now open for 2019 Autumn
						workshops!&nbsp;</strong>
				</p>
				<p>
					<strong>At this stage, we only open registration for March
						and April workshops. For the remaining workshops, registration
						will be open in week 5.&nbsp;</strong>
				</p>
				<p>&nbsp;</p>
				<h2>Step 1:</h2>
				<p>
					<strong>To start the booking process, please click on the
						skill-set that you want to improve.</strong>
				</p>
				<p>&nbsp;</p>
			</div>
			<div>
				<ul>

					<li><a href="/SES2A/Step2Servlet">Example</a></li>
					
				</ul>
				
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