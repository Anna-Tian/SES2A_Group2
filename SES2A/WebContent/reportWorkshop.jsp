<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dao.FromDbToExcel"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(Reports)HELPS booking system</title>
<link rel="stylesheet" href="css/reportSession.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/laydate/laydate.js"></script>
<script type="text/javascript">
	$(function() {
		$('.head').load('admin_head.html');
		$('.footer').load('admin_footer.html');
		$("input[id^='details']").click(function() {
			var skill = document.getElementById('skillDetails');
			$(skill).show();
			$(includeRep).show();
		});
		$('#skills').click(function() {
			var selectedValue = $(this).val();
			$(topics).show();
		});
		$('#topics').click(function() {
			var selectedValue = $(this).val();
			$(sessionTime).show();
		});

	});
</script>
</head>
<body>
	<div class="head"></div>

	<div class="title">


		<h2 name="section">Workshop</h2>

		<br /> <span class="step">- Step 1:</span> <span>Select a
			period from</span> <input type="text" name="datetimepicker1"
			id="datetimepicker1" /> <span>to</span> <input type="text"
			name="datetimepicker1" id="datetimepicker2" /> <br /> <br /> <span
			class="step">- Step 2:</span> <span>Select a report</span> <br /> <br />
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="Radio" name="repType" value=""
			id="details" />Workshop skill-sets details



		<p id="skillDetails" style="display: none;">
			&nbsp;&nbsp;&nbsp;&nbsp;Workshop skill-sets <select name="skillSets"
				id="skills">
				<option id="none" value=""></option>
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


		<!-- <p class="topics" id="topics" style="display:none" >&nbsp;&nbsp;&nbsp;&nbsp;Workshop Topics

 <select >
<option  value="none"></option>
<option value="session">Starting your session</option>
<option value="writing">What is Academic writing</option>
</select>
</p> -->

		<!-- <p class="sessionTime" id="sessionTime" style="display:none">&nbsp;&nbsp;&nbsp;&nbsp;Session
<select >
<option value="none"></option>
<option value="date">Date:19/03 Time:14:00-15:00</option>

</select>
</p> -->

		<!-- <span class="includeRep" id="includeRep" style="display:none; ">
&nbsp;&nbsp;&nbsp;<input type="checkbox" name="includedRep" value="" />Booking
&nbsp;&nbsp;&nbsp;<input type="checkbox" name="includedRep" value="" />Waiting
&nbsp;&nbsp;&nbsp;<input type="checkbox" name="includedRep" value="" />Include student profiles
</span>  -->


		<br> &nbsp;&nbsp;&nbsp;&nbsp;<input id="skillSummary"
			type="Radio" name="repType" value="skillSummary" />Workshop skill-sets summary <br />
		<br />
		<div class="submitWS">
			<input type="Submit" name="btnWorksub" value="Submit" id="btnWorksub"
				onclick="Submit()" /> <br>
		</div>
	</div>
	<footer>
		<div class="footer"></div>
	</footer>

	<script>
		laydate.render({
			elem : '#datetimepicker1'
		});
		laydate.render({
			elem : '#datetimepicker2'
		});

		$("#btnWorksub")
				.click(
						function() {
							//alert("submit");
							var sel;
							var sql;
							var startDate = document
									.getElementById("datetimepicker1").value;
							var endDate = document
									.getElementById("datetimepicker2").value;
							var obj = document.getElementById('skills');
							var index = obj.selectedIndex;
							var val = obj.options[index].text;
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
							var summary=document.getElementById("skillSummary").value;
							if((startDate=="")||endDate=="")
								{
								alert("Please choose the date")
								}
							else if(temp_type==false||(temp_type==true&&val==""&&i==0))
								{
								alert("Please choose one report");
								
								}
							else if(temp_type==true&&i>0&&val!=""){
								alert("Please don't choose two reports at once")
								
								
							}
							else{
								
							
							//alert(val);
							if ("Improve your writing" == val) {
								sel = "Improve your writing";
								sql = "select * from workshop where skillSetId=1 and (startDate >= '" + startDate + "' and endDate <= '" + endDate + "')";
							} else if ("Improve your grammar" == val) {
								sel = "Improve your grammar";
								sql = "select * from workshop where name='Improve your grammar' between "
										+ startDate + " and " + endDate;
							} else if ("Improve your speaking" == val) {
								sel = "Improve your speaking";
								sql = "select * from workshop where name='Improve your speaking' between "
										+ startDate + " and " + endDate;
							} else if ("Write now| Writing Support Sessions" == val) {
								sel = "Write now| Writing Support Sessions";
								sql = "select * from workshop where name='Write now| Writing Support Sessions' between "
										+ startDate + " and " + endDate;
							} else if ("U: PASS write" == val) {
								sel = "U Pass Write";
								sql = "select * from workshop where name='U: PASS write' between "
										+ startDate + " and " + endDate;
							} else if ("U:PASS" == val) {
								sel = "U PASS";
								sql = "select * from workshop where name='U:PASS' between "
										+ startDate + " and " + endDate;
							} else if ("Conversations@UTS(register not required)" == val) {
								sel = "Conversations@UTS(register not required)";
								sql = "select * from workshop where name='Conversations@UTS(register not required)' between "
										+ startDate + " and " + endDate;
							} else if ("Academic Writing Boot Camp Feb 2019" == val) {
								sel = "Academic Writing Boot Camp Feb 2019";
								sql = "select * from workshop where name='Academic Writing Boot Camp Feb 2019' between "
										+ startDate + " and " + endDate;
							} else if ("Summer Special Workshops 2018-19" == val) {
								sel = "Summer Special Workshops 2018-19";
								sql = "select * from workshop where name='Summer Special Workshops 2018-19' between "
										+ startDate + " and " + endDate;
							} else if (document.getElementById("skillSummary").checked) {
								sel = "skillSummary";
								sql = "select workShopId, name, description from workshop where startDate between "
										+ startDate + " and " + endDate;
							}
							//alert("wwwww");

							$.ajax({
								url : "reportDownload",
								type : "post",
								data : {
									sel : sel,
									sql : sql

								},
								dataType : "text",
								success : function(data) {
									//alert(data);
									alert("Success");

								}
							});
							}

						});
	</script>

</body>
</html>