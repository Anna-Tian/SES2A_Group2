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
	<title>Confirmation Page</title>
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
	<h1>Booked One To One Session!</h1>
	<%
	String host = "jdbc:mysql://localhost:3306/uts_help";
	PreparedStatement stat = null;
	String sessionId = request.getParameter("get_sessionId");
	String a = request.getParameter("studentId");
	String b = request.getParameter("subjectName");
	String c = request.getParameter("assignmentTypeDropbtn");
	String assignmentStr = request.getParameter("rdoGroupAssignment");
	String checkValues[] = request.getParameterValues("helpType");
	String sendToStudentStr = request.getParameter("sendToStudent");
	String sendToLectureStr = request.getParameter("sendToLecture");
	boolean assignmentBool = assignmentStr.equals("Yes");
	boolean sendToStudentBool = Boolean.parseBoolean(sendToStudentStr); //boolean: sentToStudentStr == "true"
	boolean sendToLectureBool = Boolean.parseBoolean(sendToLectureStr);
	int assignment = (assignmentBool)? 1:0; //no need, write this code is because no value shows in terminal by using boolean, but it actually already saved the data
	int sendToStudent = (sendToStudentBool)? 1:0;
	int sendToLecture = (sendToLectureBool)? 1:0;
	out.println("sendToStudentStr?" + sendToStudentStr);
	String helpType = "";
	for(int i=0; i<checkValues.length; i++){
		helpType+=checkValues[i] + "; ";
	} 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	if(a!=null && b!=null && c!=null){
		Connection conn=DriverManager.getConnection(host, "root", "rootroot");
		String updateBookingDetails = "UPDATE session SET studentId='" + a + "', subjectName='" + b + "', assignType='" + c + "', isAssignment=" + assignmentBool + ", rule='" + helpType + "', isSendToStudent=" + sendToStudentBool + ", isSendToLecture=" + sendToLectureBool + ", booked=1 WHERE sessionId='" + sessionId + "'";
		out.println(updateBookingDetails);
		Statement updateStm = conn.createStatement();
		
		int updateRs = updateStm.executeUpdate(updateBookingDetails);
		if(updateRs>0){
			out.println("data stored!" );  
			
		}else{
			out.println(updateBookingDetails);
			out.println("please fill all the fields!");
		}
		
		
		
	}
	%>
	
	<div class="footer" style="width:100%; float:left"></div>
</body>
</html>