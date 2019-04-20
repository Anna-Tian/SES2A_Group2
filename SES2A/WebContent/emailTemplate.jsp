<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Change Email Template</title>
	<link rel="stylesheet" href="css/emailTemplate.css" />
	<link rel="stylesheet" href="css/adminMenu.css">
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			
		});
	</script>
	<style type="text/css">
	.hide{
		display: none;
	}
	</style>
</head>
<body>
	<header>
		<div class="logo"><img src="img/logo.png" style="height: 100%;"></div>
		<nav class="active">
			<ul>
				<li class="sub-menu"><a href="#">Session</a>
					<ul>
						<div class="tri"></div>
						<li><a href="#">Book Session</a></li>
						<li><a href="#">Workshop Session</a></li>
					</ul>
				</li>
				<li class="sub-menu"><a href="#">Workshop</a>>
					<ul>
						<div class="tri"></div>
						<li><a href="#">Current Workshops</a></li>
						<li><a href="http://localhost:8080/SES2A/archivedWorkshops.jsp">Archived Workshops</a></li>
					</ul>
				</li>
				<li class="sub-menu"><a href="#">Reports</a>>
					<ul>
						<div class="tri"></div>
						<li><a href="#">One-to-One Session</a></li>
						<li><a href="#">Workshop Session</a></li>
					</ul>
				</li>
				<li><a href="#" class="active">Email</a></li>
				<li><a href="#">Message</a></li>
				<li><a href="#">Exit</a></li>
			</ul>
		</nav>
	</header>
	<div class="wrapper">
			<nav>
				<a href="/list/">List</a> |
				<a href="/send email/">Send Email</a> 
			</nav>
		<h2>Change Email Template</h2>
		<div class="selectArea">
			<div class="emailType">Select an email:&nbsp;</div>
			<select>
				<option value=" ">-select-</option>
				<option value="1">1 - Confirmation of booking(to student)</option>
				<option value="2">2 - Confirmation of booking(to lecturer)</option>
				<option value="3">3 - Confirmation of cancellation(to student)</option>
				<option value="4">4 - Confirmation of cancellation(to lecturer)</option>
				<option value="5">5 - Student on waiting list is booked for a session automatically(to student)</option>
				<option value="6">6 - Student on waiting list is booked for a session automatically(to lecturer)</option>
				<option value="7">7 - Student registers for waiting list(to student)</option>
				<option value="8">8 - Reminder email(to course work student)</option>
				<option value="9">9 - Reminder email(to research student)</option>
				<option value="10">10 - Confirmation of workshop booking(to student)</option>
				<option value="11">11 - Confirmation of waiting list(to student)</option>
			</select>
		</div>
			<div id="changeTemplate" class="hide">
				<h3>Confirmation of booking(to lecturer)</h3>
				<table>
					<tr>
						<th></th>
						<th style="font-weight:bold;">Current content</th>
						<th style="font-weight:bold;">New content</th>
					</tr>
					<tr>
						<th>Subject</th>
						<th>
							<textarea class="publishArea" rows="" cols="" readonly="readonly">Confirmation of booking
							</textarea>
						</th>
						<th>
							<textarea rows="" cols="" readonly="readonly">Confirmation of booking
							</textarea>
						</th>
					</tr>
					<tr>
						<th>Body</th>
						<th>
							<textarea class="publishArea" rows="" cols="" style="height: 100px;" readonly="readonly">[% student_givernname %] [% student_surname %] has booked a one-to-one appointment with you.
								Appointment time: [% datetime %]
							</textarea>
						</th>
						<th>
							<textarea rows="" cols="" style="height: 100px;">[% student_givernname %] [% student_surname %] has booked a one-to-one appointment with you.
								Appointment time: [% datetime %]
							</textarea>
						</th>
					</tr>
					<tr>
						<th></th>
						<th>last published on 30/03/2019 12:26 PM</th>
						<th>last updated on 30/03/2019 12:26 PM</th>
					</tr>
					<tr>
						<th></th>
						<th></th>
						<th>
							<button>Update</button>
							<button>Send Test Email</button>
							<button>Publish</button>
						</th>
					</tr>
				</table>
			</div>
			<div class="instruction">
				<div>Instructions:</div>
				<div class="bullet">
					<div>• Update button: changes content of the email for preview/testing purposes. Will not affect
					the current live email(s).</p>
					• Send Test Email button: sends the user an email with the updated content (with random
					values from the database) for testing purposes. The email is sent to the UTS account of the
					administrator who is currently logged into the system.</p>
					• Publish button: publishes the updated content to the live system and replaces the live
					email(s) with the new version.</p>
					</div>
				</div>
				<div>Available data fields: to use these fields, enter [% fieldname %] within the email content where you
				want it to appear</p></div>
				<div>For 1:1 session</div>
				<div class="bullet">
					• [% student_givenname %]: inserts student's given name</p>
					• [% student_surname %]: inserts student's surname</p>
					• [% datetime %]: inserts appointment's date and time</p>
					• [% date %]: inserts appointment's date</p>
					• [% start_time %]: inserts appointment's start time</p>
					• [% end_time %]: inserts appointment's end time</p>
					• [% campus %]: inserts campus/ room location</p>
					• [% lecturer_givenname %]: inserts lecturer's given name</p>
					• [% lecturer_surname %]: inserts lecturer's surname</p>
					• [% lecturer_email %]: inserts lecturer's email address</p>
				</div>
				<div>For workshop</div>
				<div class="bullet">
					• [% student_givenname %]: inserts student's given name</p>
					• [% student_surname %]: inserts student's surname</p>
					• [% datetime %]: inserts appointment's date and time</p>
					• [% date %]: inserts appointment's date</p>
					• [% start_time %]: inserts appointment's start time</p>
					• [% end_time %]: inserts appointment's end time</p>
					• [% campus %]: inserts campus/ room location</p>
					• [% skillset %]: inserts workshop skill-set</p>
					• [% topic %]: inserts workshop topic</p>
					• [% description %]: inserts workshop description</p>
					• [% targetingGroup %]: inserts workshop's targeting group</p>
					• [% recurring_sessions %]: inserts workshop's recurring-session list (date - location).</p>
				</div>
			</div>
	</div>
	<footer>
		<div class="footer-text">© HELPS Booking System</div>
	</footer>
	<script type="text/javascript">
		$(document).ready(function(){
			$('ul li').click(function(){
				$(this).siblings().removeClass('hover')
				$(this).toggleClass('hover')
				$(this).siblings().removeClass('active')
				$(this).toggleClass('active')
			})
			
			$('select').change(function(){
				var value=$("select").find("option:selected").val();
				
				if(value!=" "){
					$(changeTemplate).removeClass('hide');
				}else{
					$(changeTemplate).addClass('hide');
				}
			})
		})
	</script>
</body>
</html>