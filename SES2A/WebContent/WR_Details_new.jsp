<%@page import="com.util.MailUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/student_footer.css" />
<link rel="stylesheet" type="text/css" href="css/student_menu.css">
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$(".head").load("student_menu.html");
		$(".foot").load("foot.html");
		
$("[id^='del_']").click(function(){
			
			var id = this.id.split("_")[1];
			//alert(id);
			$.ajax({
			      url:"ComfirmationServlet",
			      type:"post",
			      data:"wid="+id,
			      dataType:"text",
			      success:function(data){
			    	  //var email = data.split("_")[0];
			    	  //var emailString = data.split("_")[1];
			    	  if(data=="false"){
			    		  alert("Booking failed");
			    	  }
			    	  else{
			    		  location.href="WR_Comfirmation_new.jsp";

			    		  <%
			    		  String eC = (String)session.getAttribute("eC");
			    		  if(eC != null&&eC.length()>0){
			    			  String email = eC.split("_")[0];
				    		  String emailContent = eC.split("_")[1];
				    		  MailUtils.sendMail(email, emailContent);
			    		  }%>
			    		  
			    		 // location.href="WR_Comfirmation_new.jsp";
			    		  //MailUtils.sendMail(email, emailString);
			    	  }
			      }
			     });
		});
		
	});
</script>
</head>
<body>

<div class="head"></div>
	<div id="content" style="padding-left:40px; padding-right:40px">

			<noscript>
				<p style="color: red;">Either your browser does not support
					javascript or javascript has been turned off. The HELPS Booking
					System Admin area needs javascript to work. Please:</p>
				<p style="color: red;">
					- Switch to another browser that does supports javascript OR<br />
					- Turn javsacript on
				</p>
			</noscript>



			<h2>The Workshop details</h2>
			<form method="post" class="workshop">
				<input type="hidden" name="workshopID" value="10409">
				
				<br>
					<div>
						<strong>Title</strong>: ${workShop.name }
					</div>
					<br>
					<div>
						<strong>Room</strong>:	${room.roomLocation }
						</div>
						<br>
						<div>
							<strong>Date</strong>: ${workShop.startDate } - ${workShop.endDate }
						</div>
						<br>
						<div>
							<strong>Time</strong>: ${workShop.days }
						</div>
						<br>

						<div>
							<strong>Target Group</strong>: ${workShop.targetGroup }
						</div>
						<br>

						<div>
							<strong>What it covers</strong>: ${workShop.description }
						</div>
						<br>

						<div>
							<strong>Places available</strong>: ${workShop.placeAvailable }
						</div>
						<br>
			</form>

			<p></p>
			<input id="del_${workShop.workShopId }" type="button" value="Book this workshop"></input>
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