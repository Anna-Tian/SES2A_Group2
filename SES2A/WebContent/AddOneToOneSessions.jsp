<%@page import="java.sql.*" %>

<div class="add_sessions">
	<p>To add sessions, please enter their details below and click "Add". If you do not wish to add a session that you selected date & time, please click "Clear" next to that session before adding.</p>
	<p>Please note: all the fields are compulsory, otherwise that session will not be added.</p>
	<table class="table_add_sessions" id="tAddSessions" style="padding-bottom:10px">
		<tr class="header" align="left" style="width:90%">
			<th style="width:10%;">Date</th>
			<th style="width:10%;">Start Time</th>
			<th style="width:10%;">End Time</th>
			<th style="width:15%;">Room</th>
			<th style="width:15%;">A/NA</th>
			<th style="width:15%;">Type</th>
			<th style="width:5%;"></th>
		</tr>
		
		<tr class="add_session_content">
			<td><input type="text" name="datePicker" style="width:100%" value="" /></td>
			<td><input type="text" name="startTimePicker" style="width:100%" value="" /></td>
			<td><input type="text" name="endTimePicker" style="width:100%" value="" /></td>
			<td>
				<select name="roomDropbtn" style="width:100%">
					<option value=""></option>
					<%
					try{
						String Query="SELECT * FROM room";
						String host = "jdbc:mysql://localhost:3306/uts_help";
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection conn=DriverManager.getConnection(host, "root", "rootroot");
						Statement stm = conn.createStatement();
						ResultSet rs = stm.executeQuery(Query);
						while(rs.next()){
							%>
							<option value="<%=rs.getInt("roomId")%>"><%=rs.getString("roomLocation") %></option>
							<%
						}
					} catch(Exception ex){
						ex.printStackTrace();
					}
					%>
				</select>
			</td>
			<td>
				<select name="ANADropbtn" style="width:100%">
					<option value=""></option>
					<%
					try{
						String Query="SELECT * FROM student";
						String host = "jdbc:mysql://localhost:3306/uts_help";
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection conn=DriverManager.getConnection(host, "root", "rootroot");
						Statement stm = conn.createStatement();
						ResultSet rs = stm.executeQuery(Query);
						while(rs.next()){
							%>
							<option value="<%=rs.getInt("studentId")%>"><%=rs.getString("firstName") %> <%=rs.getString("lastName") %></option>
							<%
						}
					} catch(Exception ex){
						ex.printStackTrace();
					}
					%>
				</select>
			</td>
			<td>
				<select name="typeDropbtn" style="width:100%">
					<option value=""></option>
					<option value="Type1">Type1</option>
					<option value="Type2">Type2</option>
				</select>
			</td>
			<td><input type="submit" name="btnClearAddSessions" value="Clear" id="btnClearAddSessions"/></td>					
		</tr>
		

	
	</table>
	<div align="center">
		<input type="submit" name="btnAddSessions" value="Add" id="btnAddSessions" ></button>
		<p>To use the template, please select one week.</p>
	</div>
</div>

<%
String a = request.getParameter("datePicker");
String b = request.getParameter("startTimePicker");
String c = request.getParameter("endTimePicker");
String d = request.getParameter("roomDropbtn");
String e = request.getParameter("ANADropbtn");
String f = request.getParameter("typeDropbtn");
String host = "jdbc:mysql://localhost:3306/uts_help";
PreparedStatement stat = null;
Class.forName("com.mysql.jdbc.Driver").getDeclaredConstructor().newInstance();
if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null){
	Connection conn=DriverManager.getConnection(host, "root", "rootroot");
	String data = "INSERT INTO session(date, startTime, endTime, room, attendances,type) values(?,?,?,?,?,?)";
	stat = conn.prepareStatement(data);
	stat.setString(1,a);
	stat.setString(2,b);
	stat.setString(3,c);
	stat.setString(4,d);
	stat.setString(5,e);
	stat.setString(6,f);
	out.println("data stored!" );  
}else{
	out.println("please fill all the fields!");
}

%>

