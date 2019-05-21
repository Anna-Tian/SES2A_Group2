<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			      url:"DetailsServlet",
			      type:"post",
			      data:"wid="+id,
			      dataType:"text",
			      success:function(data){
			       	window.location.href="WR_Details_new.jsp";
			      }
			     });
		});
	});
</script>
</head>
<body>

<div class="head"></div>
	<div id="content" style="padding-left:40px; padding-right:40px">


			<h2>The skill-set title</h2>

			<div id="student_workshop_list_instruction">
				<h4
					style="margin: 10px 0px; padding: 0px; border: 0px; vertical-align: baseline; font-size: 1.154em; color: rgb(0, 0, 0); font-family: 'Lucida Grande', 'Lucida Sans Unicode', sans-serif; line-height: 20.0063px;">
					&nbsp;</h4>
				<h2>Step 2:</h2>
				<ul>
					<li>
						<p>
							<strong>To avoid a timetable clash</strong>, please check the
							date, time and location of each session carefully.
						</p>
					</li>
					<li>
						<p>
							For additional session information and to register, click on the
							<strong>‘detail’</strong> link.
						</p>
					</li>
				</ul>
				<p>&nbsp;</p>
			</div>


			<div>


				<br>
				<h3>Sessions</h3>
				

				<table class="collapsed" style="width: 100%; height: 100px;">
					<tbody align="left">
						<tr>
							<th>Topics</th>
							<th>Start date</th>
							<th>Finish date</th>
							<th>Days</th>
							<th>Time</th>
							<th>No.<br>Sessions
							</th>
							<th>Places<br>avail.
							</th>
							<th>Detail</th>
						</tr>
						
						<c:forEach var="sessions1" items="${qqq }">
						  	<tr >
							  	<td>${sessions1.name }</td>
							  	<td><fmt:formatDate type="date" value="${sessions1.startDate }" /></td>
							  	<td><fmt:formatDate type="date" value="${sessions1.endDate }" /></td>
							  	<td>${sessions1.days }</td>
							  	<td><fmt:formatDate pattern="HH:mm" value="${sessions1.startDate }"/> - <fmt:formatDate pattern="HH:mm" value="${sessions1.endDate }"/></td>
							  	<td>${sessions1.noOfSessions }</td>
							  	<td>${sessions1.placeAvailable }</td>
							
							  	<td><input value="Detail" type="button" id="del_${sessions1.workShopId }"></td>
						 	</tr>
					
					  </c:forEach>
 
					</tbody>
				</table>

			</div>
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

<div class="foot" style="margin-top:3em"></div>

</body>
</html>