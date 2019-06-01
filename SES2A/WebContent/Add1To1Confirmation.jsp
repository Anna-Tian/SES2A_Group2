<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page 
import="java.sql.*" 
import="java.text.*"
import="java.util.*"
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add Confirmation Page</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('.head').load('admin_head.html');
			$('.footer').load('admin_footer.html');
		});
	</script>
</head>
<body>
	<div class="head"></div>
	<h1 style="text-align: center;">Added One To One Session!</h1>
	<%
	String host = "jdbc:mysql://localhost:3306/uts_help";
	PreparedStatement stat = null;
	
	String astr = request.getParameter("datePicker");
	String bstr = request.getParameter("startTimePicker");
	String cstr = request.getParameter("endTimePicker");
	String d = request.getParameter("roomDropbtn");
	String e = request.getParameter("ANADropbtn");
	String f = request.getParameter("typeDropbtn");
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
	
	java.util.Date util_a = dateFormat.parse(astr);
	java.util.Date util_b = timeFormat.parse(bstr);
	java.util.Date util_c = timeFormat.parse(cstr);
	java.sql.Date a = new java.sql.Date(util_a.getTime());
	java.sql.Timestamp b = new java.sql.Timestamp(util_b.getTime());
	java.sql.Timestamp c = new java.sql.Timestamp(util_c.getTime());
	
	
	
	Class.forName("com.mysql.jdbc.Driver").getDeclaredConstructor().newInstance();
	if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null){
		Connection conn=DriverManager.getConnection(host, "root", "rootroot");
		String insert = "INSERT INTO session(date, startTime, endTime, roomId, adminId, type) values(?,?,?,?,?,?)";
		stat = conn.prepareStatement(insert);
		stat.setDate(1,a);
		stat.setTimestamp(2,b);
		stat.setTimestamp(3,c);
		stat.setString(4,d);
		stat.setString(5,e);
		stat.setString(6,f);
		int i = stat.executeUpdate();
		if(i>0){
		}else{
			out.println("please fill all the fields!");
		}
		
		
		String view="select * from session LEFT JOIN admin ON session.adminId=admin.adminId order by sessionid desc limit 1";
		Statement stm = conn.createStatement();
		ResultSet rs = stm.executeQuery(view);
		while(rs.next()){
			String get_sessionId = rs.getString("sessionId").toString();
			String get_adminId = rs.getString("adminId").toString();
			String get_adminFirstName = rs.getString("firstName").toString();
			String get_adminLastName = rs.getString("lastName").toString();
			String advisorName = get_adminFirstName + " " + get_adminLastName;
	
			String updateAdvisorName = "UPDATE Session SET advisorName = '" + advisorName + "' WHERE sessionID = '" +get_sessionId+"'";
			Statement stmUpdate = conn.createStatement();
			int rsUpdate = stmUpdate.executeUpdate(updateAdvisorName);
			
		}
		
		
		
	}
	%>
	
	<%-- <table width="100%" border="1" align="center">
		<tr bgcolor="#949494">
			<th style="width:10%;">Date</th>
				<th style="width:10%;">Start Time</th>
				<th style="width:10%;">End Time</th>
				<th style="width:15%;">Room</th>
				<th style="width:15%;">A/NA</th>
				<th style="width:15%;">Type</th>
				<th style="width:5%;"></th>
		</tr>
		<%
		   Enumeration paramNames = request.getParameterNames();
		
		   while(paramNames.hasMoreElements()) {
		      String paramName = (String)paramNames.nextElement();
		      out.print("<tr><td>" + paramName + "</td>\n");
		      String paramValue = request.getParameter(paramName);
		      out.println("<td> " + paramValue + "</td></tr>\n");
		   }
		%>
	</table> --%>
	
	<div class="footer" style="width:100%; float:left"></div>
</body>
</html>