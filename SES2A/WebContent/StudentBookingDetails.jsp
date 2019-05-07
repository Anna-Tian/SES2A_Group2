<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HELPS Booking System</title>
	<link rel="stylesheet" href="css/BookSpecificSession.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript">
	  	/* help others box */
		$(function(){
	  		$('[name="helpType"][value="Others"]').change(function(){
	  			if ($(this).is(':checked')) {
	  				document.getElementById('otherHelpTypeRichText').style.display = "block";
				}else{
					document.getElementById('otherHelpTypeRichText').style.display = "none";
				}
			});
		});
	  	/* check detailed rules */
	  	$(function(){
	  		$('[name="additionalBook"][value="checkRule"]').change(function(){
	  			if ($(this).is(':checked')) {
	  				document.getElementById('checkRuleDetails').style.display = "block";
				}else{
					document.getElementById('checkRuleDetails').style.display = "none";
				}
			});
		});
	</script>
</head>
<body>
	<div id="global-utility-bar">
		<div id="uts-logo">
			<a href="http://www.uts.edu.au"><img src="https://web-common.uts.edu.au/images/utslogo.gif" alt="University of Technology, Sydney homepage" width="132" height="30" /></a>
		</div>
	</div>

	<p class="header_name" id="student_booking_header" style="margin-top:2em">Student booking</p>
	<form method="post" id="book_details_form">
		<div>
			<div class="form_part1" style="width:30%">
				<p>Date: <strong>02/04/2019</strong></p>
				<p>Time: <strong>11:00 - 12:00</strong></p>
			</div>
			<div class="form_part2" style="width:70%">
				<p>Advisor: <strong>James Smith</strong></p>
				<p>Campus: <strong>CB11.04.301</strong></p>
			</div>
		</div>
		
		<div class="form_part3" style="width:100%">
			<p>Type: <strong>UG/PG course work students</strong></p>
			<p>Currently booked by student: 
				<strong>Na Tian</strong>
				 (Email: 12879678@student.uts.edu.au)
			</p>
			<a href="StudentProfileDetails.jsp">View this student's profile</a><br>
			<a href="StudentBookingHistory.jsp">View student's history</a><br>
			<p>This appointment is for* 
				<select name="appointmentDropbtn" style="width:20%">
						<option value=""></option>
						<option value="draft">Discussing an assignment draft</option>
						<option value="presentation">Practicing a seminar presentation</option>
				</select>
			</p>
			<p>Subject Name* <input type="Text" name="subjectName" value="" width="70%"/></p>
			<p>Assignment Type* 
				<select name="assignmentTypeDropbtn" style="width:10%">
						<option value=""></option>
						<option value="summary">Abstract and Executive Summary</option>
						<option value="annotatedBibliography">Annotated Bibliography</option>
						<option value="caseStudy">Case Study</option>
						<option value="criticalReview">Critical Review</option>
						<option value="essay">Essay</option>
						<option value="literatureReview">Literature Review</option>
						<option value="reflectiveJournal">Reflective Journal</option>
						<option value="report">Report</option>
						<option value="researchPorposal">Research Proposal</option>
				</select>
			</p>
			<p>Is this a group assignment?
				<input type="Radio" name="rdoGroupAssignment" value="Yes" id="rdoGroupAssignment_Yes"/>Yes
				<input type="Radio" name="rdoGroupAssignment" value="No" id="rdoGroupAssignment_No"/>No
			</p>
			<p>I need help with ... </p>
			<input type="checkbox" name="helpType" value="Answer question">Answering the assignment question (please provide the question to your advisor)<br>
			<input type="checkbox" name="helpType" value="Marking criteria">Addressing the marking criteria (please provide the criteria to your advisor)<br>
			<input type="checkbox" name="helpType" value="Structure">Structure<br>
			<input type="checkbox" name="helpType" value="Paragraph Development">Paragraph development<br>
			<input type="checkbox" name="helpType" value="Referencing">Referencing<br>
			<input type="checkbox" name="helpType" value="Grammar">Grammar<br>
			<input type="checkbox" name="helpType" value="Others">Other, please specify below<br>
			<textarea rows="4" cols="70" id="otherHelpTypeRichText"></textarea>
			<p>Did student attend this session? (select on option and press button "Mark Attendance")</p>
			<select name="isAttended" style="width:5%">
						<option value="">---</option>
						<option value="Yes">Yes</option>
						<option value="No">No</option>
			</select>
			<div align="center" style="margin-top:3em">
				<input type="submit" name="btnCancelBooking" value="Cancel this booking" id="btnCancelBooking">
				<input type="submit" name="btnMarkAttendance" value="Mark Attendance" id="btnMarkAttendance"/><br>
				<input type="checkbox" name="additionalBook" value="sendToStudent">Send email to student<br>
				<input type="checkbox" name="additionalBook" value="sendToLecture">Send email to lecturer (by default, no email is sent to lecturer)<br>
				<input type="checkbox" name="additionalBook" value="checkRule">Check rule<br>
			</div>
			<div id="checkRuleDetails" style="display:none">
				<p>Rule:</p>
				<p>- A session must be booked / cancelled / put into the waiting list at least 24 hour before appointment.</p>
				<p>- Student can only be put into the waiting list for the max 3 sessions for the week</p>
				<p>- Student cannot make appointments for 1 year after 2nd no-show</p>
				<p>- Student can book for up to 1 session per week</p>
				<p>- Student can book for up to 3 sessions in advance</p>
			</div>
		</div>
		
		
	</form>
	<form method="get">
		<div>
			<p class="header_name" id="comment_header" style="margin-top:2em">Advisor's comment</p>
			<p>Comment:</p>
			<textarea rows="4" cols="50" id="commentRichText" style="width:70%"></textarea>
			
			<div style="width:100%">
				<div class="form_part1" style="width:30%">
					<input type="checkbox" name="commentType" value="Requirement">Understanding assignment requirements<br>
					<input type="checkbox" name="commentType" value="Purpose_focus_argument">Purpose / focus / argument<br>
					<input type="checkbox" name="commentType" value="Genre_register">Genre / register<br>
					<input type="checkbox" name="commentType" value="Cohesion">Cohesion<br>
					<input type="checkbox" name="commentType" value="Paragraph_structure">Paragraph structure<br>
					<input type="checkbox" name="commentType" value="Using_sources_approriately">Using sources approriately<br>
					<input type="submit" name="btnSaveComment" value="Save" id="btnSaveComment" style="margin-top:1em"><br>
				</div>
				<div class="form_part2" style="width:70%">
					<input type="checkbox" name="commentType" value="Sentence_grammar">Sentence grammar<br>
					<input type="checkbox" name="commentType" value="Speaking_presentation">Speaking presentation<br>
					<input type="checkbox" name="commentType" value="Other">Other<br>
				</div>
			</div>
			
		</div>
	</form>
		<div style="float:left; width:100%">
			<p class="header_name" id="upload_header" style="margin-top:1em">Upload your documents</p>
			<button onclick="chooseFile()" style="display:inline">Choose File</button>
			<p style="display:inline">No file chosen</p><br>
			<input type="submit" name="btnUpload" value="Upload" id="btnUpload">
		</div>
	

</body>
</html>