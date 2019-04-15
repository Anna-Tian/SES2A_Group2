<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>  
td {  
    border: 1px solid black;  
    border-collapse: collapse; 
}  

td {
    padding: 10px; 
}

div {
    background-color: #4db8ff;
}

.tab {
            max-width: 810px;
            width: 98%;
            margin: 0px auto;
            text-align: left;
}
</style>  
</head>
 
<body class ="tab">

<!-- Create the table of Available Advisors -->
<div><b><font color = "white" size = "+2">Advisors Available</font></b></div>

<table id = "availableAD" style="border-bottom: 1px solid black">  
<th><b>Staff Number</b></th> <th><b>First Name</b></th> <th><b>Last Name</b></th> <th><b>Email</b></th>
<tr>
	<td><input type="checkbox" name = "chk"><input type = "text" name = "staffnumber" ></td> 
	<td><input type = "text" name = "firstname" ></td> <td><input type = "text" name = "lastname" ></td> 
	<td><input type = "text" name = "email" ></td> 
</tr>
<tr>
	<td><input type="checkbox" name = "chk"><input type = "text" name = "staffnumber" ></td> 
	<td><input type = "text" name = "firstname" ></td> <td><input type = "text" name = "lastname" ></td> 
	<td><input type = "text" name = "email" ></td> 
</tr>
<tr>
	<td><input type="checkbox" name = "chk"><input type = "text" name = "staffnumber" ></td> 
	<td><input type = "text" name = "firstname" ></td> <td><input type = "text" name = "lastname" ></td> 
	<td><input type = "text" name = "email" ></td> 
</tr>
<tr>
	<td><input type="checkbox" name = "chk"><input type = "text" name = "staffnumber" ></td> 
	<td><input type = "text" name = "firstname" ></td> <td><input type = "text" name = "lastname" ></td> 
	<td><input type = "text" name = "email" ></td> 
</tr>
</table>  

<!-- Note -->
<b>Please note:</b>
<ul>
<li>If  you delete an advisor, all sessions run by that advisor will also be deleted.</li>
<li>Inactive advisors will not be able to log in, and their names will be removed from the drop down list.</li>
</ul>

<!-- Create Delete Update Inactive buttons and functions -->
<button padding-left = 10px onclick="delAd()">Delete</button> <button>Update</button> <button>Inactive</button>

<script>
function delAd(){
	var isTable = document.getElementById('availableAD');
	var nBoxes = document.getElementsByName('chk');
	for (i=nBoxes.length-1; i>=0; i--)
		{if (nBoxes[i].checked == true){isTable.deleteRow(i+1)}}
}
</script>

<!-------------------------------------------- Line break for each sections of Advisors tab -------------------------------------------->
																 	<hr>
<!-------------------------------------------- Line break for each sections of Advisors tab -------------------------------------------->


<!-- Note  -->

<text>To enter more advisors, please enter their details below and click "Add".</text> <br>
<text> <b>Please note:</b>all the fields are compulsory, otherwise that advisors will not be added.</text> <br>


<!-- Add Advisors Table -->
<table id = "addAD">  
<tr><th><b>Staff Number</b></th> <th><b>First Name</b></th> <th><b>Last Name</b></th> <th><b>Email</b></th></tr>
<tr id = "add1">
	<td><text> 1 </text> <input type = "number" name = "staffnumber1"></td> 
	<td><input type = "text" name = "firstname1"></td> <td><input type = "text" name = "lastname1"></td> 
	<td><input type = "text" name = "email1"></td> 
</tr>

<tr id = "add2">
	<td><text> 2 </text> <input type = "text" name = "staffnumber2"></td> 
	<td><input type = "text" name = "firstname2"></td> <td><input type = "text" name = "lastname2"></td> 
	<td><input type = "text" name = "email2"></td> 
</tr>

<tr id = "add3">
	<td><text> 3 </text> <input type = "text" name = "staffnumber3"></td> 
	<td><input type = "text" name = "firstname3"></td> <td><input type = "text" name = "lastname3"></td> 
	<td><input type = "text" name = "email3"></td> 
</tr>
</table>

<!-- Create button and functions to add advisors  -->
<center> <button onclick = "addAdvisors()">Add</button> </center>

<script>
var index = 1;
function addAdvisors() {
		var addtable = document.getElementById("addAD").rows[1].cells[1].innerHTML;
		var ADtable = document.getElementById("availableAD");
        var row=ADtable.insertRow(ADtable.rows.length);
        
        var cell1 = row.insertCell(0);
        var chkbox = document.createElement("input");
       		chkbox.type = "checkbox";
        	chkbox.name = "chk";
            cell1.appendChild(chkbox);
         
        	staffno = document.createElement("input");
	    	staffno.type = "text";
            staffno.name = "staffnumber"+index;
            cell1.appendChild(staffno);
            
        var cell2=row.insertCell(1);
        var fname = document.createElement("input");
	    	fname.type = "text";
            fname.name = "firstname"+index;
            cell2.appendChild(fname);
            
        var cell3 = row.insertCell(2);
        var lname = document.createElement("input");
      	  	lname.type = "text";
            lname.name = "lastname"+index;
            cell3.appendChild(lname);  
            
        var cell4 = row.insertCell(3);
        var email = document.createElement("input");
        	email.type = "text";
            email.name = "email"+index;
            cell4.appendChild(email);
     	 index++;
			}
</script>

<!-------------------------------------------- Line break for each sections of Advisors tab -------------------------------------------->
																	<hr>
<!-------------------------------------------- Line break for each sections of Advisors tab -------------------------------------------->


<!-- Inactive Advisor -->

<div><b><font color = "white" size = "+2">Inactive advisors</font></b></div>
<table id = "inactiveAD">  
<tr><th><b>Staff Number</b></th> <th><b>First Name</b></th> <th><b>Last Name</b></th> <th><b>Email</b></th></tr>
<tr>
	<td><input type="checkbox"><input type = "text" name = "staffnumber"></td> 
	<td><input type = "text" name = "firstname"></td> <td><input type = "text" name = "lastname"></td> 
	<td><input type = "text" name = "email"></td> 
</tr>
</table> 

<center><button onclick = "activate()">Active</button></center>

<script>
</script>

</body>
</html>