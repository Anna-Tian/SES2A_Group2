<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

p{background-color:#4DB8FF; font-size:25px; margin: 0px;}
</style>	
</head>
<body>

<p><b>List campus</b></p>

<table style="width:50%">
	<tr>
		<th><input type="checkbox" ></th>
		<th>Room</th>
	</tr>
</table>
<center><input type="button" value="Delete"> <input type="button" value="Update"></center>

<p><b>Add campus</b></p>
</br>Campus: <input type="text" name="name"></br>
<input type="button" value="Add"> 

</body>
</html>
