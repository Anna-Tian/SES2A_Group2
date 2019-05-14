<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.text.*" %>
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
	
	<script type="text/javascript">
		$(function(){
			$('.head').load('admin_head.html');
			$('.footer').load('admin_footer.html');
		});
	</script>
</head>
<body>
	<div class="head"></div>
	<div class="wrapper">
		<p class="header_name" id="specific_book_header" style="margin-top:2em">Book Session</p>
		<form method="POST" action="http://localhost:8080/SES2A/OneToOneSessions.jsp" id="specific_book_form">
			<div>
				<div class="form_part1" style="width:30%">
					<p>Date: <strong><%=request.getParameter("get_date")%></strong></p>
					<p>Time: <strong><%=request.getParameter("get_startTime")%> - <%=request.getParameter("get_endTime")%></strong></p>
				</div>
				<div class="form_part2" style="width:70%">
					<p>Advisor: <strong><%=request.getParameter("get_advisorName")%></strong></p>
					<p>Campus: <strong><%=request.getParameter("get_room")%></strong></p>
				</div>
			</div>
			
			<div class="form_part3" style="width:100%">
				<p>Type: <strong><%=request.getParameter("get_type")%></strong></p>
				<p>Student ID: <input type="Text" name="studentID" value="" maxlength="10"/></p>
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
				<textarea rows="4" cols="50" id="otherHelpTypeRichText"></textarea>
				<div align="center" style="margin-top:3em">
					<input type="submit" name="btnBookSpecificSession" value="Book this sessions" id="btnBookSpecificSession"><br>
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
	</div>
	<div class="footer"></div>
</body>
</html>