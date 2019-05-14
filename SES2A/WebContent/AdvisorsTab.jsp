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

<style>  
td {  
    border: 1px solid black;  
    border-collapse: collapse; 
}  

td {
    padding: 10px; 
}

th{
	text-align:left;
}


.header {
    background-color: #4db8ff;
}

.tab {
            max-width: 810px;
            width: 98%;
            margin: 0px auto;
            text-align: left;
}
.buttonholder{
	text-align:center;
}

</style>  
</head>
 
<!----------------------------------------------------------------------------------- Line break for each sections of Advisors tab ----------------------------------------------------------------------------------->
 
 
<body class ="tab">

<!-- Create the table of Available Advisors -->
<div class = 'header'><b><font color = "white" size = "+2">Advisors Available</font></b></div>
<form method="post" action="">
<table id = "availableAD" style="border-bottom: 1px solid black">
<tr>  
<th><input type = "checkbox" name ="chk"> <b>Staff Number</b></th> <th><b>First Name</b></th> <th><b>Last Name</b></th> <th><b>Email</b></th>
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
  <td><input type = "checkbox" name = "chk"/> <input name = "staffno" value = <%=resultSet.getString("staffNumber")%> /></td> 
  <td><input name = "firstname"  value = <%=resultSet.getString("firstName")%> /></td> 
  <td><input name = "lastname"  value = <%=resultSet.getString("lastName")%> /></td>
  <td><input name = "email" value = <%=resultSet.getString("email") %> /></td>
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
<div class= 'buttonholder'> <button onclick="delAd()">Delete</button> <input type = "submit" value = "update"/> <button onclick = "inActivate()">Inactive</button> </div>
</form>


<!-- Create Delete Update Inactive buttons -->

<script>

// Delete function
function delAd(){
	var isTable = document.getElementById('availableAD');
	var nBoxes = document.getElementsByName('chk');
	for (i=nBoxes.length-1; i>=0; i--)
		{if (nBoxes[i].checked == true){isTable.deleteRow(i+1)}}
}



// Inactive function
function inActivate(){
	var inAcTable = document.getElementById('inactiveAD');
	var AcTable = document.getElementById('availableAD');
	var nBoxes = document.getElementsByName('chk');
	for (var i = 0;i < nBoxes.length;i++){
		if (nBoxes[i].checked){

			//Move (add) chosen Advisors to Inactive Advisors Table
			var newRow = inAcTable.insertRow(inAcTable.rows.length),
            cell1 = newRow.insertCell(0),
            cell2 = newRow.insertCell(1),
			cell3 = newRow.insertCell(2),
            cell4 = newRow.insertCell(3);
            // add values to the cells
			cell1.innerHTML = "<input type='checkbox' name='chk'>";
			cell1.innerHTML = AcTable.rows[i+1].cells[0].innerHTML;
			cell2.innerHTML = AcTable.rows[i+1].cells[1].innerHTML;
            cell3.innerHTML = AcTable.rows[i+1].cells[2].innerHTML;
			cell4.innerHTML = AcTable.rows[i+1].cells[3].innerHTML;

                
    		//Remove chosen Advisors to move to Inactive Advisors Table
    		var index = AcTable.rows[i+1].rowIndex;
    		AcTable.deleteRow(index);
    		
    		i--;
			}
		}
	
}

// Update function
/* function update(){
	var nBoxes = document.getElementsByName('chk');
	var staffnumberupdate = document.getElementsByName('staffno')

					connection = DriverManager.getConnection(connectionURL + dtbName, dtbId, dtbPass); 
				  	statement = connection.createStatement(); 
				  	String  dtbupdate = "update advisor set staffNumber = " + staffnumberupdate  
				  					", lastName = ng, firstName = h, email = @" ++; 
				  	resultSet = statement.executeUpdate(dtbupdate);
	
} */
</script>

<!----------------------------------------------------------------------------------- Line break for each sections of Advisors tab ----------------------------------------------------------------------------------->
																 											<hr>
<!----------------------------------------------------------------------------------- Line break for each sections of Advisors tab ----------------------------------------------------------------------------------->


<!-- Note  -->

To enter more advisors, please enter their details below and click "Add". <br>
<b>Please note:</b>all the fields are compulsory, otherwise that advisors will not be added.<br>


<!-- Add Advisors Table -->
<form action="AdvisorsTab" method="post">
<table id = "addAD">  
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
<div class= 'buttonholder'> <input type="submit" value="Add" /> </div>
</form>

<script>
var index = 1;
function addAdvisors() {
		var ADtable = document.getElementById("availableAD");
 		var i;
 		var count = 0;
 		
        for (i = 1; i <= 3; i++){
			//Check if all elements are filled
        	if(document.getElementById("staffnumberadd"+i).value.length == 0 && document.getElementById("firstnameadd"+i).value.length == 0
        			&& document.getElementById("lastnameadd"+i).value.length == 0 && document.getElementById("emailadd"+i).value.length == 0){
//         		if (count <=  3){
//         				count++;
//                 		alert ("Please input Advisors detail for all Advisor.");
//                 		break;
//         		}

        	}
        	else{
        		
        		
        		//If all elements are filled, then add each of them onto Avaialble Advisors table
        		//Add staffnumber 1,2,3 with checkbox
                var row=ADtable.insertRow(ADtable.rows.length);
            	var cell1 = row.insertCell(0);
                var chkbox = document.createElement("input");
           		chkbox.type = "checkbox";
            	chkbox.name = "chk";
                cell1.appendChild(chkbox);
             
            	staffno = document.createElement("input");
    	    	staffno.type = "number";
                staffno.name = "staffnumber"+index;
                staffno.value = document.getElementById('staffnumberadd'+i).value;
                cell1.appendChild(staffno);
                
                
                //Add firstname 1,2,3
                var cell2=row.insertCell(1);
                var fname = document.createElement("input");
        	    	fname.type = "text";
                    fname.name = "firstname"+index;
                    fname.value = document.getElementById('firstnameadd'+i).value;
                    cell2.appendChild(fname);
                    
                    
                //Add lastname 1,2,3    
                var cell3 = row.insertCell(2);
                var lname = document.createElement("input");
              	  	lname.type = "text";
                    lname.name = "lastname"+index;
                    lname.value = document.getElementById('lastnameadd'+i).value;
                    cell3.appendChild(lname);  
                    
                //Add email 1,2,3     
                var cell4 = row.insertCell(3);
                var email = document.createElement("input");
                	email.type = "text";
                    email.name = "email"+index;
                    email.value = document.getElementById('emailadd'+i).value;
                    cell4.appendChild(email);
                    
             	 index++;
             	 count--;
        	}
        } 
}
</script>

<!----------------------------------------------------------------------------------- Line break for each sections of Advisors tab ----------------------------------------------------------------------------------->
																											<hr>
<!----------------------------------------------------------------------------------- Line break for each sections of Advisors tab ----------------------------------------------------------------------------------->


<!-- Inactive Advisor -->

<div class = 'header'><b><font color = "white" size = "+2">Inactive advisors</font></b></div>
<table id = "inactiveAD">
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

</body>
</html>
