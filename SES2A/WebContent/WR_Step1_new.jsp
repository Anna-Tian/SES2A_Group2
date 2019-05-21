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
<link rel="stylesheet" type="text/css" href="css/step.css">
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".head").load("student_menu.html");
		$(".foot").load("foot.html");
		
		$("[id^='del_']").click(function(){
			
			var id = this.id.split("_")[1];
			//alert(id);
			$.ajax({
			      url:"Step2Servlet",
			      type:"post",
			      data:"targetGroup="+id,
			      dataType:"text",
			      success:function(data){
			       	window.location.href="WR_Step2_new.jsp";
			      }
			     });
		});
	});
</script>
</head>
<body>

	<div class="head"></div>
	<div class="content" style="padding-left:40px; padding-right:40px">
		
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
					<c:forEach var="sessions2" items="${www }">
						  	<ul >
							  	<li><a style="text-decoration:underline;" id="del_${sessions2 }">${sessions2 }</a></li>
							  	</ul>
					</c:forEach>
				
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
	<div class="foot"></div>
</body>
</html>