<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ROOM TAB</title>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<style>
table, th, td{
	border: 0px solid black;
	}
th, td {
	padding: 10px;
}
th {
	text-align: left;
	font-size: 18px;
}
table tr:nth-child(even) {
  background-color: #eee;
}
table tr:nth-child(odd) {
 background: #fff;
}
</style> 

<script type="text/javascript">
	$(function() {
		$('.head').load('admin_head.html');
		$('.footer').load('admin_footer.html');
	});
</script>
</head>

<body>
<div class = "head"></div>

<b>List campus</b>


<form action = "roomServlet" method = "post">
<table id = "RoomTable" style="width:50%">

<%

String id = request.getParameter("userID");
String driName = "com.mysql.jdbc.Driver";
String connectionURL = "jdbc:mysql://localhost:3306/";
String dtbName = "uts_help";
String dtbId = "root";
String dtbPass = "rootroot";

try {
	Class.forName(driName);	
}catch(Exception e) {
	e.printStackTrace();
}

Statement statement = null;
Connection connection = null;
ResultSet rSet = null;

%>
	<tr>
		<th><input type=  "checkbox" ></th>
		<th>Room</th>
	</tr>
	
	<%
	try{
		connection = DriverManager.getConnection(connectionURL + dtbName, dtbId, dtbPass);
		statement = connection.createStatement();
		String dtb = "SELECT * FROM room";
		rSet = statement.executeQuery (dtb);
		while(rSet.next())
		{
	%>
	<tr>
	<td><input type = "checkbox" name = "roomId" value = "<%=rSet.getString("roomId")%>"></td> 	
	<td><input contenteditable="true" name = "roomNumber_<%=rSet.getString("roomId")%>" value = <%=rSet.getString("roomLocation") %>></td>
	</tr>
	<%
		}
		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	%>
	
</table>

<center><input type="submit" name = "action" value="Delete"> <input type = "submit" name = "action" value = "Update"></form> </center>


<form action = "roomServlet" method = "post">
<b>Add campus</b>
</br>Campus: <input type="text" name="roomLocation"></br>
<input type="submit" name = "action" value="Add" > 
</form>

<div class = "footer"></div>

</body>
</html>