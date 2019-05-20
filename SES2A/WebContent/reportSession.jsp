<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.dao.FromDbToExcel"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(Reports)HELPS booking system</title>
<link rel="stylesheet" href="css/reportSession.css" />
<link rel="stylesheet" href="css/jquery.datetimepicker.min.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.datetimepicker.full.js"></script>
<script type="text/javascript" src="js/laydate/laydate.js"></script>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.head').load('admin_head.html');
		$('.footer').load('admin_footer.html');
	});
</script>
</head>
<body>
	<div class="head"></div>
	<div class="title">

		<h2 name="section">Session</h2>
		<form >
			<br /> 
			<span class="step">- Step 1:</span> <span>Select a
				period from</span> 
				<input  type="text" name="datetimepicker1"
				id="datetimepicker1" /> <span>to</span> <input type="text"
				name="datetimepicker2" id="datetimepicker2" /> <br /> <br /> <span
				class="step">- Step 2:</span> <span>Select a report</span>
			<p>
				&nbsp;&nbsp;&nbsp;
				<input id="bookedSession" type="Radio" name="repType" value="" />&nbsp;Booked
				Sessions <br /> 
				&nbsp;&nbsp;&nbsp;
				<input id="cancelledSession" type="Radio"
					name="repType" value="" />&nbsp;Cancelled Sessions <br />
				&nbsp;&nbsp;&nbsp;
				<input id="sessionWaitingList" type="Radio" name="repType" value="" />&nbsp;Sessions
				having waiting lists <br /> 
				&nbsp;&nbsp;&nbsp;
				<input id="nonAttend" type="Radio"
					name="repType" value="" />&nbsp;Non-attended sessions <br />
				&nbsp;&nbsp;&nbsp;
				<input id="nonBooked" type="Radio" name="repType" value="" />&nbsp;Non-booked
				sessions <br /> &nbsp;&nbsp;&nbsp;
				<input id="profile" type="Radio"
					name="repType" value="" />&nbsp;Student profile data <br />
				&nbsp;&nbsp;&nbsp;
				<input id="bookingSummary" type="Radio" name="repType" value="" />&nbsp;Summary
				of students booking sessions <br /> &nbsp;&nbsp;&nbsp;
				<input id="studentHistory"
					type="Radio" name="repType" value="" />&nbsp;Student
				history:&nbsp;&nbsp;&nbsp;ID:
				<input id="stuID"type="Text" name="studentID"
					value="" /> <br /> &nbsp;&nbsp;&nbsp;
					<input id="advisorComment" type="Radio"
					name="repType" value="" />&nbsp;Advisors'
				comment:&nbsp;&nbsp;&nbsp; ID:
				<input id="advisorID" type="Text" name="advisorID"
					value="" /> <br /> &nbsp;&nbsp;&nbsp;
					<input id="stuinWL" type="Radio"
					name="repType" value="" />&nbsp;Students in the waiting list
			</p>
			<br /> <span class="step">- Step 3:</span> <span>Press
				"Submit" button</span> <br />
			<div class="submitSession">
				<input type="Submit" name="btnSessionsub" value="Submit"
					id="btnSessionsub" />
		</form>
		<br />
		<br />
	</div>
	</div>


	<script>
		laydate.render({
			elem : '#datetimepicker1'
		});
		laydate.render({
			elem : '#datetimepicker2'
		});
		
		$("#btnSessionsub").click(function(){
			var sel;
			var sql;
			var startDate = document.getElementById("datetimepicker1").value;
			
			var endDate = document.getElementById("datetimepicker2").value;
			var repType = document.getElementsByName('repType'); 
			
			var temp_type=false;
			for(var i=0;i<repType.length;i++)
				{
				if(repType[i].checked)
					{
					temp_type=true;
					break;
					}
				}
			if((temp_type==false)||(startDate=="")||endDate=="")
				
				{
				alert("Please fill the form");
				}
			
			else{
			if(document.getElementById("bookedSession").checked){
				sel = "bookedSession";
				sql="select sessionId,date,startTime,endTime,type,rule from session where booked='1' and (date >= '" + startDate + "' and date <= '" + endDate + "')";
				alert("Success!");
				
			}
			else if(document.getElementById("cancelledSession").checked){
				
				sel = "cancelledSession";
				sql="select sessionId,date,startTime,endTime,type,rule from session where booked='3' between "+startDate+" and "+endDate;
			}
			
			else if(document.getElementById("sessionWaitingList").checked){
			
				sel = "waitingList";
				sql="select waitingListId, waitingDateTime, waitingStatus from waitingList where waitingDateTime between "+startDate+" and "+endDate;
			}
			else if(document.getElementById("nonAttend").checked){
				
				sel = "nonAttendedSession";
				sql="select * from session where isAttendance='2' between "+startDate+" and "+endDate;
			}
			else if(document.getElementById("nonBooked").checked){
				
				sel = "nonBookedSession";
				sql="select * from session where booked='1' between "+startDate+" and "+endDate;
			}else if(document.getElementById("profile").checked){
				index="1"
				sel = "t_report_studentProfile";
				sql="select * from studentProfile ";
			}
			else if(document.getElementById("bookingSummary").checked){
			
				sel = "bookingSummary";
				sql="select * from session where booked='2'between "+startDate+" and "+endDate;
			}
			else if(document.getElementById("studentHistory").checked){
				var id = document.getElementById("stuID").value;
				sel = "studentHistory";
				sql="select studentId,sessionId from session where studentId="+id+ " and (date >= '" +startDate +"' and date <='" +endDate+ "')";
				alert("Success!");
			}
			else if(document.getElementById("advisorComment").checked){
				var id = document.getElementById("advisorID").value;
				sel = "advisorComment";
		
			
				sql="select  * from comment where adminId= "+id+ " between "+startDate+" and "+endDate;
				//alert(sql);
			}
			else if(document.getElementById("stuinWL").checked){
				
				sel = "Students in the waiting list";
				sql="select * from waitingList where waitingDateTime between "+startDate+" and "+endDate;
			}
			
			$.ajax({
				url:"reportDownload",
				type:"post",
				data:{
					sel:sel,
					sql:sql,
					
				},
				dataType:"text",
				success:function(data){
					//alert(data);
					alert("222");
					alert("success!");
					alert("111"); 
				}
			});
			}
			
		
			
		})
		
	</script>

	<div class="footer"></div>

</body>
</html>