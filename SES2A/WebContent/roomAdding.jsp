<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.dao.saveRoom" %>
    
<jsp:useBean id="obj" class="com.bean.Room">  
</jsp:useBean>  
<jsp:setProperty property="roomLocation" name="obj"/>  

    
<%
	
	saveRoom.addRoom(obj);
	response.sendRedirect("roomIndex.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

</body>
</html>