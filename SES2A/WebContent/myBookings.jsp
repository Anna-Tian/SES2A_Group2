<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HELPS booking system</title>
	<link rel="stylesheet" href="css/myBookings.css" />
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js" ></script>
	<script type="text/javascript">
		$(function(){
			
			$("[id^='del_']").click(function(){
				var workshop_id = this.id.split("_")[1];
				if(confirm("confirm cancel?")){
					$.ajax({
						url:"MyBookingsServlet_delete",
						type:"post",
						data:"workshop_id="+workshop_id,
						dataType:"text",
						success:function(data){
							alert("Cancel Successfully!")
							window.location.reload(true);
						}
					});
				}
			});
			
			{
				$(".head").load("student_menu.html");
				$(".foot").load("foot.html");
				
				var sessions1 = "${sessions }";
				var sessions2 = "${upcoming }";
				var sessions3 = "${past }";
				if(sessions1==""){
					$("#session1").show();
					$("#session2").hide();
				}else{
					$("#session1").hide();
					$("#session2").show();
				}
				if(sessions2==""){
					$("#session3").show();
					$("#session4").hide();
				}else{
					$("#session3").hide();
					$("#session4").show();
				}
				if(sessions3==""){
					$("#session5").show();
					$("#session6").hide();
				}else{
					$("#session5").hide();
					$("#session6").show();
				}
			}
			
		});
	</script>
</head>
<body>
	<div class="head"></div>
	<!-- <div id="global-utility-bar">
		UTS Logo
		<div id="uts-logo">
			<a href="http://www.uts.edu.au"><img src="https://web-common.uts.edu.au/images/utslogo.gif" alt="University of Technology, Sydney homepage" width="132" height="30" /></a>
		</div>
	</div> -->
	
	<div id="main-container">
		<!-- <div id="header">
			<a href="http://www.ssu.uts.edu.au/helps/index.html" id="logo-elssa">HELPS</a>
			<div id="navigation">
				<a href="index.cfm?scope=profile">My Information</a>
				<a href="index.cfm?scope=newsession">My bookings</a>
				<a href="index.cfm?scope=workshop">Workshop registration</a>
				<a href="index.cfm?scope=Program">Programs</a>
				<a href="index.cfm?scope=help">FAQ</a>
				<a href="index.cfm?scope=logout">Exit</a>
			</div>
		</div> -->
		<!-- Content -->
		<div id="content">
			<div>
				<h2>Sessions</h2>
				<div id="session1" style="display: none">
					<p>There are no sessions to display.</p>
				</div>
				<div id="session2">
					<!-- <h4>Past</h4> -->
					<table align="center" width="500px" class="table table-hover">
						<tr align="left">
							<th>Date</th>
							<!-- <th>Days</th> -->
							<th>Time</th>
							<th>Room</th>
							<th>Advisor</th>
							<th>Type</th>
						</tr>
						<c:forEach var="thisSession" items="${sessions }">
						  	<tr align="left">
							  	<td><fmt:formatDate type="date" value="${thisSession.date }" /></td>
							  	<%-- <td>${thisSession.endTime } - ${thisSession.startTime }</td> --%>
							  	<td><fmt:formatDate pattern="HH:mm" value="${thisSession.startTime }" /></td>
							  	<td>${thisSession.room.roomLocation }</td>
							  	<td>${thisSession.advisorName }</td>
							  	<td>${thisSession.type }</td>
						 	</tr>
					  </c:forEach>		
					</table>
				</div>
			</div>
			<br/><br/>
			<div>
				<h2>Workshop sessions</h2>
				<div id="session3" style="display: none">
					<p>There are no workshop sessions to display.</p>
				</div>
				<div id="session4">
					<h4>Upcoming</h4>
					<table align="center" width="500px" class="table table-hover">
						<tr align="left">
							<th>Topic</th>
							<th>Start date</th>
							<th>End date</th>
							<th>Days</th>
							<th>Time</th>
							<th>Room</th>
							<th>No. Of Session</th>
							<th>Cancel</th>
						</tr>
						<c:forEach var="workShop" items="${upcoming }">
						  	<tr align="left">
							  	<td>${workShop.name }</td>
							  	<td><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${workShop.startDate }" /></td>
							  	<td><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${workShop.endDate }" /></td>
							  	<td>${workShop.days }</td>
							  	<td>${workShop.placeAvailable }</td>
							  	<td>${workShop.room.roomLocation }</td>
							  	<td>${workShop.noOfSessions }</td>
							  	<td><input class="btn btn-primary btn-sm" type="button" value="Cancel" id="del_${workShop.workShopId}"/></td>
						 	</tr>
					 	</c:forEach>
					</table>
				</div>
				
				<div id="session5" style="display: none">
					<h4>Past</h4>
					<p>There are no workshop sessions to display.</p>
				</div>
				<div id="session6">
					<h4>Past</h4>
					<table align="center" width="500px" class="table table-hover">
						<tr align="left">
							<th>Topic</th>
							<th>Start date</th>
							<th>End date</th>
							<th>Days</th>
							<th>Time</th>
							<th>Room</th>
							<th>No. Of Session</th>
						</tr>
						<c:forEach var="workShop" items="${past }">
						  	<tr align="left">
							  	<td>${workShop.name }</td>
							  	<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${workShop.startDate }" /></td>
							  	<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${workShop.endDate }" /></td>
							  	<td>${workShop.days }</td>
							  	<td>${workShop.placeAvailable }</td>
							  	<td>${workShop.room.roomLocation }</td>
							  	<td>${workShop.noOfSessions }</td>
						 	</tr>
					  </c:forEach>		
					</table>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<!-- <div id="footer-wrapper">		
			<div class="footer-navigation">
				<a href="index.cfm?scope=profile">My Information</a>
				<a href="index.cfm?scope=newsession">My bookings</a>
				<a href="index.cfm?scope=workshop">Workshop registration</a>
				<a href="index.cfm?scope=Program">Programs</a>
				<a href="index.cfm?scope=help">FAQ</a> 
				<a href="index.cfm?scope=logout">Exit</a>	
			</div>
			
			<div id="footer-nav"></div>
			
			<div id="global-footer">
				<div id="footer-img">
					<a href="http://www.uts.edu.au/"><img src="https://web-common.uts.edu.au/images/uts_logo_footer.gif" alt="UTS homepage" width="130" height="29" /></a>
					<br />
					<a href="http://www.atn.edu.au">UTS is a member of the<br />Australian Technology Network of Universities</a>
				</div>

				<div id="footer-text">
					<div class="primary-links">
						<a href="http://email.itd.uts.edu.au/webapps/directory/byname/">Staff directory</a> 
						<img src="https://web-common.uts.edu.au/images/separator.gif" alt="" width="4" height="6" /> 
						<a href="http://www.uts.edu.au/about/mapsdirections/">Campus maps</a>
						<img src="https://web-common.uts.edu.au/images/separator.gif" alt="" width="4" height="6" /> 
						<a href="http://www.newsroom.uts.edu.au/">Newsroom</a>
						<img src="https://web-common.uts.edu.au/images/separator.gif" alt="" width="4" height="6" /> 
						<a href="http://www.events.uts.edu.au/web/">What's on</a>
					</div>
					&copy; Copyright UTS - CRICOS Provider No: 00099F - 27 November 2008 10:34 AM<br />
					The page is authorised by Director, SSU - 
					Send comments to 
					<a href="mailto:sang-eun.oh@uts.edu.au">operations manager</a><br />
					<a href="http://www.uts.edu.au/disclaimer.html">Disclaimer</a> |
					<a href="http://www.uts.edu.au/privacy.html">Privacy</a> |
					<a href="http://www.uts.edu.au/copyright.html">Copyright</a> |
					<a href="http://www.uts.edu.au/accessibility.html">Accessibility</a> |
					<a href="http://www.gsu.uts.edu.au/policies/webpolicy.html">Web policy</a> |
					<a href="http://www.uts.edu.au/">UTS homepage</a>
				</div>
			</div>
		</div> -->
			
	</div> <!-- end main-container -->
	<div class="foot"></div>
</body>
</html>