<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MESSAGE TAB</title>
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script>
		$(document).ready(function(){
			$('.head').load('admin_head.html');
			$('.footer').load('admin_footer.html');
		});
	</script>
	</head>
	
	<body>
		<div class="head"></div>
		<div style="padding-left:40px">
			<h2>Edit Message:</h2>
			<select id="messageTabSelectList" onchange="onChangedSelectList()">
				<option value="0"></option>
				<option value="1">FAQ in student interface</option>
				<option value="2">Instruction of file upload in student interface</option>
				<option value="3">Instruction of nav in student interface</option>
				<option value="4">Instruction of skill set in student interface</option>
				<option value="5">Instruction of student Profile in student interface</option>
				<option value="6">Instruction of student Profile in student interface - bottom</option>
				<option value="7">Instruction of workshops in attendance interface</option>
				<option value="8">Instruction of workshops in student interface</option>
				<option value="9">Logon page announcement in attendance interface</option>
				<option value="10">Logon page announcement in student interface</option>
				<option value="11">Logon page box on the right in student interface</option>
				<option value="12">Program in student interface</option>
			</select>
			
			<p></p>
		</div>
		
		
		<div class="footer"></div>
                
		<script>
			function onChangedSelectList() {
				var selectedOptionValue = document.getElementById("messageTabSelectList").value;
				
				if(selectedOptionValue != "0"){
					localStorage.setItem("selectedOption", selectedOptionValue);
					window.location = "MessageEditTab.jsp";
				}
			}
		</script>
		
		<!-- In case browser does not enable JS -->
		<noscript>Sorry, your browser does not support JavaScript!</noscript>
		
	</body>
</html>