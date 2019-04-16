<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELPS booking system</title>

<link href="css/core.css" rel="stylesheet"
	type="text/css">
<link href="css/elssa_css.css" rel="stylesheet"
	type="text/css">
<link href="css/elssa_booking.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="js/jquery.js"></script>
<script type="text/javascript"
	src="js/core.js"></script>
<style>
@media print {
	#ghostery-purple-box {
		display: none !important
	}
}
</style>
</head>

<body data-gr-c-s-loaded="true">
<span id="topSpan" style="position: absolute;"></span>
<div id="container">


<style type="text/css" media="screen">
	html, body { 
		margin:0; 
		padding:0; 
		font: .9em/1.8em Arial, Helvetica, sans-serif;
		color: #000000;
		background: #FFFFFF;
	}
	#container {
		margin-top:25%;
		width:100%;
	}
	#logon {
		background-color: #009AEF;
		color: #fff;
	}
	#center {
		width:500px;
		margin:0 auto;
		padding:10px;
		font-weight:bold;
	}
	#title {
		font-size:5em;
		font-weight:bolder;
		color:#009AEF;
        margin-bottom:-15px;
		padding: 15px 0 5px 0;
	}
	#footer {
		text-align:center;
	}
	</style>


<div id="container">
	<noscript>
	   <p style="color: red;">Either your browser does not support javascript or javascript has been turned off. The HELPS Booking System Admin area needs javascript to work. Please:</p>
	   <p style="color: red;">
	   - Switch to another browser that does supports javascript OR<br/>
	   - Turn javascript on and then continue
	   </p>
	</noscript>
	<div id="title">HELPS Booking System</div><br>
	
	
	
	
		<div id="logon">
	
			<div id="center">
				
				
				<form action="OneToOneSessions.jsp" method="post" name="logonForm" id="logonForm">
				<input type="hidden" name="scope" value="project">
				<input type="hidden" name="action" value="">
				
				<label for="UserName">ID</label>
				<input type="text" name="UserName" value="" size="20">
				
				<label for="UserPassword">Password</label>
				<input type="password" name="UserPassword" size="20">
					<script language="JavaScript" type="text/javascript">
					document.write("<input type='Submit' name='logon' value='Logon' />");
					</script><input type="Submit" name="logon" value="Logon">
				</form>
					  
				<noscript>
				      <span style="color: red;">Your browser has to support javascript in order for you to login the HELPS Booking System Admin area</span>  
				</noscript>
	
			</div>
			
		</div>

	
	
	
</div>   	


<script type="text/javascript">
	document.getElementById('logonForm').UserName.focus();
</script>

<div id="footer">
	© HELPS Booking System
</div>

</div>


</body>

<div><div class="gr_-editor gr-iframe-first-load" style="display: none;"><div class="gr_-editor_back"></div><iframe class="gr_-ifr gr-_dialog-content"></iframe></div></div>

<span class="gr__tooltip"><span class="gr__tooltip-content"></span><i class="gr__tooltip-logo"></i><span class="gr__triangle"></span></span>		



</body></html>