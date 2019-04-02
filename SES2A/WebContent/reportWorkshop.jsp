<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(Reports)HELPS booking system</title>
<link rel="stylesheet" href="css/reportSession.css" />
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="js/laydate/laydate.js" ></script>
	<script type="text/javascript">
		$(function(){
			
		});
	</script>
</head>
<body>
<div class="header">
<a href="http://localhost:8080/SES2A/reportSession.jsp">Session</a>
<a href="http://localhost:8080/SES2A/reportWorkshop.jsp">Workshop</a>
<br/>
<h3>Workshop Reports</h3>

<br/>
<span class="step">- Step 1:</span>
<span>Select a period from</span>
<input type="text" name="datetimepicker1" id="datetimepicker1"/>
<span>to</span>
<input type="text" name="datetimepicker1" id="datetimepicker2"/>
<br/>
<br/>
<span class="step">- Step 2:</span>
<span>Select a report</span>
<br/>
<br/>
&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value="" id="details"/>&nbsp;Workshop skill-sets details
<br/>
<p id="skillDetails" style="display:none;">Workshop skill-sets
<br/>

<select >
<option value="">Improve your writing</option>
<option value="">Improve your grammar</option>
<option value="">Improve your speaking</option>
<option value="">Write now| Writing Support Sessions</option>
<option value="">U: PASS write</option>
<option value="">U:PASS</option>
<option value="">Conversations@UTS(register not required)</option>
<option value="">Academic Writing Boot Camp Feb 2019</option>
<option value="">Summer Special Workshops 2018-19</option>

</select>
<br/>
<br/>
&nbsp;&nbsp;&nbsp;<input type="checkbox" name="includedRep" value="" />Booking
&nbsp;&nbsp;&nbsp;<input type="checkbox" name="includedRep" value="" />Waiting
&nbsp;&nbsp;&nbsp;<input type="checkbox" name="includedRep" value="" />Include student profiles
<br/>
<br/>
</p>
&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value="" />&nbsp;Workshop skill-sets summary
<br/>
<br/>
<input type="Submit" name="btnWorksub" value="Submit" id="btnWorksub" />
</div>
<script>

			laydate.render({
			  	elem: '#datetimepicker1' 
			});
			laydate.render({
			  	elem: '#datetimepicker2' 
			});
		</script>

</body>
</html>