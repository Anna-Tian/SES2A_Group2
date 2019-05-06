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

<table id = "RoomTable" style="width:50%">
	<tr>
		<th><input type="checkbox" ></th>
		<th>Room</th>
	</tr>
</table>
<center><input type="button" value="Delete"> <input type="button" value="Update"></center>

<p><b>Add campus</b></p>
</br>Campus: <input type="text" name="Campus"></br>
<input type="button" value="Add" onclick = "insertData()"> 



<!-- <script>
var index = 1;
function insertData(){
            var table=document.getElementById("RoomTable");
            var row=table.insertRow(table.rows.length);
         
            
            var cell1=row.insertCell(0);
            var t1=document.createElement("input");
            	t1.type = "checkbox";
                t1.id = "check"+index;
                cell1.appendChild(t1);
                
            var cell2=row.insertCell(1);
            var t2=document.createElement("input");
                t2.id = "room"+index;
                cell2.appendChild(t2);
                
               	
      index++;

}
</script>  -->

</body>
</html>
