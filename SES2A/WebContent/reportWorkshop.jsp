<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.dao.FromDbToExcelTest01"%>
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
			$('.head').load('admin_head.html');
			$('.footer').load('admin_footer.html');
			$("input[id^='details']").click(function(){
				var skill = document.getElementById('skillDetails');
				$(skill).show();
				$(includeRep).show();
			});
			$('#skills').click(function(){
				var selectedValue=$(this).val();
				$(topics).show();
			});
			$('#topics').click(function(){
				var selectedValue=$(this).val();
				$(sessionTime).show();
			});
		
			
		});
	</script>
</head>
<body>
<div class="head"></div>
	
<div class="title">


<h2 name="section">Workshop</h2>

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
&nbsp;&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value="" id="details"/>Workshop skill-sets details



<p id="skillDetails" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;Workshop skill-sets


<select  name="skillSets" id="skills">
<option value=""></option>
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
</p>


<p class="topics" id="topics" style="display:none" >&nbsp;&nbsp;&nbsp;&nbsp;Workshop Topics


<select >
<option value="none"></option>
<option value="session">Starting your session</option>
<option value="writing">What is Academic writing</option>
</select>
</p>

<p class="sessionTime" id="sessionTime" style="display:none">&nbsp;&nbsp;&nbsp;&nbsp;Session
<select >
<option value="none"></option>
<option value="date">Date:19/03 Time:14:00-15:00</option>

</select>
</p>

<span class="includeRep" id="includeRep" style="display:none; ">
&nbsp;&nbsp;&nbsp;<input type="checkbox" name="includedRep" value="" />Booking
&nbsp;&nbsp;&nbsp;<input type="checkbox" name="includedRep" value="" />Waiting
&nbsp;&nbsp;&nbsp;<input type="checkbox" name="includedRep" value="" />Include student profiles
</span>


<br>
&nbsp;&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value=""/>Workshop skill-sets summary
<br/>
<br/>
<div class="submitWS">
<input type="Submit" name="btnWorksub" value="Submit" id="btnWorksub" onclick="Submit()" />
<br>
</div>
</div>
<footer>
<div class="footer"></div>
	</footer>

<script>

			laydate.render({
			  	elem: '#datetimepicker1' 
			});
			laydate.render({
			  	elem: '#datetimepicker2' 
			});
			$("#btnSessionsub").click(function(){
				
				<%
				FromDbToExcelTest01.download("report");
				%>
			})
			
		</script>

</body>
</html>