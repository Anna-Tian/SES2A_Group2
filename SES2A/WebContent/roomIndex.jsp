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
/* p{background-color:#4DB8FF; font-size:25px; margin: 0px;} */
</style> 

<script type="text/javascript">
	$(function() {
		$('.head').load('admin_head.html');
		$('.footer').load('admin_footer.html');
	});
</script>
</head>

<script>
/* function uRoom()
{
	$.ajax ({
		
		url:"roomServlet",
		type:"post",
		data: {value: document.getElementById("roomNumber").value},
		dataType: "text",
		success: function(data){
			System.out.println("Success");
		}	
	});
} */

 $(document).ready(function(){
	$("updateRoomButton").click(function(){
		$.ajax ({
			
			url:"roomServlet",
			type:"POST",
			data: {value: document.getElementById("roomNumber").value},
			dataType: "text",
			success: function(data){
				System.out.println("Success");
			}	
		});
	});
}); 


</script>

<body>
<div class = "head"></div>

<b>List campus</b>


<form action = "roomDelete.jsp" method = "post">
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
		<th><input type="checkbox" ></th>
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
	<%-- <td><input type = "checkbox" name = "roomId"/> <input type="hidden" name="id" value = <%=rSet.getString("roomId")%>> --%>
	
	<td><input contenteditable="true" name = "roomNumber" value = <%=rSet.getString("roomLocation") %>></td>
	</tr>
	<%
		}
		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	%>
	
</table>

<center><input type="submit" value="Delete"> </form><input type = "button" id = "updateRoomButton" value = "Update"> </center>
<!--  <button type = "button" onclick = "uRoom(); return false;">Update</button>  -->



<form action = "roomAdding.jsp">
<b>Add campus</b>
</br>Campus: <input type="text" name="roomLocation" id = "fInput"></br>
<input type="submit" id = "fRoom" value="Add" > 
</form>

<div class = "footer"></div>



</body>
</html>