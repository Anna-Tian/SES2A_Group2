<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "com.bean.Advisor" %>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.SQLException"%>
<%@ page import = "java.sql.Statement"%>  
<%@ page import = "java.sql.ResultSet"%>    
    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HELPS Booking System</title>
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<style>  
	.wrapper .table_session_available{
		padding: 1px 12px;
		border-collapse: collapse;
		box-sizing: border-box;
		width: 100%;
	}
	
	.wrapper .table_session_available tr:nth-child(even){
		background-color: #f2f2f2;
	}
	
	.wrapper .table_session_available tr:hover {
		background-color: #ddd;
	}
	
	.wrapper .table_session_available th{
		border: 1px solid #ddd;
		padding: 8px;
		padding-top: 10px;
		padding-bottom: 10px;
		text-align: left;
		background-color: #929292;
		font-weight: bold;
		font-size: 10pt;
	}
	
	.wrapper .table_session_available td{
		border: 1px solid #ddd;
		padding: 8px;
	}
	
	</style>  
</head>
 
<!----------------------------------------------------------------------------------- Line break for Avaialable Advisors Section ----------------------------------------------------------------------------------->
																											<hr>
<!----------------------------------------------------------------------------------- Line break for Avaialable Advisors Section ----------------------------------------------------------------------------------->
<script type="text/javascript">
	$(function(){
		$('.head').load('admin_head.html');
		$('.footer').load('admin_footer.html');
	});
</script> 


<body>
	<div class="head"></div>
	<!-- Create the table of Available Advisors -->
	<div class="wrapper" style="padding-left:40px; padding-right:40px">
		<h2>Advisors Available</h2>
		<form action="advisorServlet" method="post">
			<table class="table_session_available" id = "availableAD" style="border-bottom: 1px solid black">
			<tr>  
			<th><input type = "checkbox" name ="chk1"> <b>Staff Number</b></th> <th><b>First Name</b></th> <th><b>Last Name</b></th> <th><b>Email</b></th>
			</tr>
			
			  <%
			  String id = request.getParameter("id");
			  String driver = "com.mysql.jdbc.Driver"; 
			  String connectionURL = "jdbc:mysql://localhost:3306/"; 
			  String dtbName = "uts_help"; 
			  String dtbId =  "root"; 
			  String dtbPass = "rootroot";
			  
			  try{ 
				  Class.forName(driver); 
				}catch(ClassNotFoundException e) 
			  		{
			  			e.printStackTrace(); 
			 		}
			  
			  Connection connection = null; 
			  Statement statement = null; 
			  ResultSet resultSet =  null; 
			  %> 
			  <tr> 
			  <% 
			  try{ 
				connection = DriverManager.getConnection(connectionURL + dtbName, dtbId, dtbPass); 
			  	statement = connection.createStatement(); 
			  	String  dtb = "SELECT * FROM advisor"; 
			  	resultSet = statement.executeQuery(dtb); 
			  while  (resultSet.next()) {
			 %>
			
			  <tr> 
			  
			  <td><input type = "checkbox" name = "chk" value="<%=resultSet.getString("advisorId")%>"/> 
			  		<input type="hidden" name="adId" value = <%=resultSet.getString("advisorId")%>> 
			  	  <input contenteditable = "true" name = "staffno" value = <%=resultSet.getString("staffNumber")%> /></td> 
			  <td><input contenteditable = "true" name = "fname" value = <%=resultSet.getString("firstName")%> /></td> 
			  <td><input contenteditable = "true" name = "lname" value = <%=resultSet.getString("lastName")%> /></td>
			  <td><input contenteditable = "true" name = "staffemail" value = <%=resultSet.getString("email") %> /></td>
			  </tr> 
			
			
			<%
			} 
			  connection.close();
			  }catch
			  (Exception e) { e.printStackTrace(); }
			  
			%>
			
			</table>
			
			
			
			<!-- Note displayed in Advisors Tab -->
			<b>Please note:</b>
			<ul>
			<li>If  you delete an advisor, all sessions run by that advisor will also be deleted.</li>
			<li>Inactive advisors will not be able to log in, and their names will be removed from the drop down list.</li>
			</ul>
			<div class= 'buttonholder'> 
			<input type = "submit" name = "action" value = "Delete"/> 
			<input type = "submit" name = "action" value = "Update"/> 
			<input type = "submit" name = "action" value = "inActive"/> </div>
		</form>
		
		
		<!----------------------------------------------------------------------------------- Line break for Add Advisors Sections ----------------------------------------------------------------------------------->
																		 										<hr>
		<!----------------------------------------------------------------------------------- Line break for Add Advisors Sections ----------------------------------------------------------------------------------->
		
		
		<!-- Note  -->
		
		To enter more advisors, please enter their details below and click "Add". <br>
		<b>Please note:</b>all the fields are compulsory, otherwise that advisors will not be added.<br>
		
		
		<!-- Add Advisors Table -->
		<h2>Add Advisors</h2>
		<form action="advisorServlet" method="post">
		<table class="table_session_available" id = "addAD">  
		<tr><th><b>Staff Number</b></th> <th><b>First Name</b></th> <th><b>Last Name</b></th> <th><b>Email</b></th></tr>
		<tr id = "add1">
			<td> 1  <input type = "number" name = "staffnumberadd" id = "staffnumberadd1"></td> 
			<td><input type = "text" name = "firstnameadd" id = "firstnameadd1"></td>
			<td><input type = "text" name = "lastnameadd" id = "lastnameadd1"></td> 
			<td><input type = "text" name = "emailadd" id = "emailadd1"></td> 
		</tr>
		
		<tr id = "add2">
			<td> 2  <input type = "number" name = "staffnumberadd" id = "staffnumberadd2"></td> 
			<td><input type = "text" name = "firstnameadd" id = "firstnameadd2"></td> 
			<td><input type = "text" name = "lastnameadd" id = "lastnameadd2"></td> 
			<td><input type = "text" name = "emailadd" id = "emailadd2"></td> 
		</tr>
		
		<tr id = "add3">
			<td> 3  <input type = "number" name = "staffnumberadd" id = "staffnumberadd3"></td> 
			<td><input type = "text" name = "firstnameadd" id = "firstnameadd3"></td> 
			<td><input type = "text" name = "lastnameadd" id = "lastnameadd3"></td> 
			<td><input type = "text" name = "emailadd" id = "emailadd3"></td> 
		
		</tr>
		</table>
		
		<!-- Create button and functions to add advisors  -->
		<div class= 'buttonholder'> 
		<input type="submit" name = "action" value="Add" /> 
		</div>
		</form>
		
		
		<!----------------------------------------------------------------------------------- Line break for Inactive Advisors Section ----------------------------------------------------------------------------------->
																												<hr>
		<!----------------------------------------------------------------------------------- Line break for Inactive Advisors Section ----------------------------------------------------------------------------------->
		
		
		<!-- Inactive Advisor -->
		<h2>Inactive advisors</h2>
		
		<table class="table_session_available" id = "inactiveAD">
		<tr><th><b>Staff Number</b></th> <th><b>First Name</b></th> <th><b>Last Name</b></th> <th><b>Email</b></th></tr>
		
		<tr>
			<td><input type="checkbox" name = "chk"><input type = "number" name = "inactivestaffnumber"></td> 
			<td><input type = "text" name = "inactivefirstname"></td> <td><input type = "text" name = "inactivelastname"></td> 
			<td><input type = "text" name = "inactiveemail"></td> 
		</tr>
		</table> 
		
		<div class= 'buttonholder'> <button onclick = "activate()">Active</button> </div>
		
		<script>
		</script>
	</div>
	
	<div class="footer" style="margin-top:3em"></div>
</body>

</html>

