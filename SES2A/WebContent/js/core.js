//Quickly edit a field
function quickEdit(id)
{
   document.getElementById("view_" + id).style.display = "none";
   document.getElementById("editLink_" + id).style.display = "none";
   document.getElementById("edit_" + id).style.display = "inline";
   document.getElementById("cancel_" + id).style.display = "inline";
   document.getElementById("save_" + id).style.display = "inline";
   document.getElementById("editField_" + id).value = reverseEscaping(document.getElementById("view_" + id).innerHTML);
   
}

//Quickly edit a text area field
function quickEditBig(id)
{
   document.getElementById("view_" + id).style.display = "none";
   document.getElementById("editLink_" + id).style.display = "none";
   document.getElementById("edit_" + id).style.display = "inline";
   document.getElementById("cancel_" + id).style.display = "inline";
   document.getElementById("save_" + id).style.display = "inline";
   document.getElementById("editField_" + id).value = reverseEscaping(document.getElementById("view_" + id).innerHTML);
   
}

//Cancel the quick editing
function cancelQuickEdit(id)
{
   document.getElementById("edit_" + id).style.display = "none";
   document.getElementById("view_" + id).style.display = "inline";
   document.getElementById("editLink_" + id).style.display = "inline";
   document.getElementById("cancel_" + id).style.display = "none";
   document.getElementById("save_" + id).style.display = "none";
   document.getElementById("editField_" + id).value = "";
}

//Complete the quick editing
function completeQuickEdit(id)
{
   document.getElementById("edit_" + id).style.display = "none";
   document.getElementById("view_" + id).style.display = "inline";
   document.getElementById("editLink_" + id).style.display = "inline";
   document.getElementById("cancel_" + id).style.display = "none";
   document.getElementById("save_" + id).style.display = "none";
   document.getElementById("view_" + id).innerHTML = escaping(document.getElementById("editField_" + id).value);
}

//Delete
function toDelete(type, name, frm)
{
   if (name != '')
   {
      name = " '" + name  + "'";
   }
   
   if (confirm("Are you sure to delete the " + type + name + "?"))
   {
      document.forms[frm].deleting.value = 1;
      document.forms[frm].submit();
   }
}

//Switch between layers
function switchLayer(id1,id2,btnTxt1,btnTxt2,headingTxt1,headingTxt2,switchBtn,heading)
{
   if (document.getElementById(id1).style.display == "none")
   {
      document.getElementById(id2).style.display = "none";
      document.getElementById(id1).style.display = "block";      
      document.getElementById(switchBtn).value = btnTxt2;
      document.getElementById(heading).innerHTML = headingTxt1;
   }
   else
   {
      document.getElementById(id1).style.display = "none";
      document.getElementById(id2).style.display = "block";
      document.getElementById(switchBtn).value = btnTxt1;
      document.getElementById(heading).innerHTML = headingTxt2;
   }
}

//Preview
function switchPreviewEdit(btn,helping)
{
   var tagged=document.getElementsByTagName('a');
   var newDisplay = "";
   var newLabel = "";
   
   if (document.getElementById(btn).value == "Preview")
   {
      newDisplay = "none";
      newLabel = "Edit";
      newHelpDisplay = "none";
   }
   else
   {
      newDisplay = "inline";
      newLabel = "Preview";
      newHelpDisplay = "block";
   }
      
   for(var i = 0 ; i < tagged.length ; i++)
   {
      if (tagged[i].className=="editLink")
      {
         tagged[i].style.display = newDisplay;
      }
   }
   document.getElementById(helping).style.display = newHelpDisplay;
   
   document.getElementById(btn).value = newLabel;
}

//Encode HTML
function escaping(str)
{
   str = str.replace("&", "&amp;");
   str = str.replace("<", "&lt;");
   str = str.replace(">", "&gt;");     
   str = str.replace("\n", "<br>"); 
   return str;
}

//Decode HTML
function reverseEscaping(str)
{
   str = str.replace("<br>", "\n");
   str = str.replace("&lt;", "<");
   str = str.replace("&gt;", ">");     
   str = str.replace("&amp;", "&");
   return str;   
}

/* Add a simple object */
function addSimple(addingRow, addingTotal, addingNumber, addingButton)
{
   document.getElementById(addingRow + adding_total).style.display = document.all?"block":"table-row";
   
   if (adding_total == addingNumber)
   {
      document.getElementById(addingButton).disabled = true;
   }
}

/* Remove a simple object */
function removeSimple(addingRow, row_number, addingButton)
{
   document.getElementById(addingRow + row_number).style.display = "none";
   document.getElementById(addingButton).disabled = false;
}

/* Notetaker javascript */

/* =================================== Functions to handle objects ===================================== */
function performAction(field, IDs_list, objName, frm, actionName)
{
   if (hasChecked(IDs_list))
   {      
      if (actionName == "delete")
      {
         if (confirm("Are you sure to delete those " + objName + "(s)?"))
         {      
            document.getElementById(field).value = 1;
            document.forms[frm].submit();
         }  
      }     
      else
      {
         document.getElementById(field).value = 1;
         document.forms[frm].submit();      
      }
   }
   else
   {
      alert("Please select at least one " + objName + " to " + actionName);
   }
}

//Function to check all/uncheck all
function checkAll(IDs_list, check_all)
{
   for (i=0; i<IDs_list.length; i++)
   {
      document.getElementById(IDs_list[i]).checked = document.getElementById(check_all).checked;
   }
}

//Check a list of check boxes
function checkList(IDs_list)
{
   for (i=0; i<IDs_list.length; i++)
   {
      document.getElementById(IDs_list[i]).checked = true;
   }
}

//Toggle a div: visible, invisilbe
function toggle(checkID, divID)
{
   document.getElementById(divID).style.display = document.getElementById(checkID).checked? "inline":"none";
}

//Toggle a div: visible, invisilbe
function toggleWithOnChange(selID, valueToShow, divID)
{
  document.getElementById(divID).style.display = document.getElementById(selID).value == valueToShow ? "inline":"none";
  document.getElementById(divID).value = '';
}

//Show a div, span or any container by ID
function showContainer(containerID)
{
   document.getElementById(containerID).style.display = "block";
}

//Hide a div, span or any container by ID
function hideContainer(containerID)
{
   document.getElementById(containerID).style.display = "none";
}

/* Check if any ID is checked */
function hasChecked(IDs_list)
{
   for (i=0; i<IDs_list.length; i++)
   {
      if (document.getElementById(IDs_list[i]).checked)
      {
         return true;
      }
   }  
   
   return false;
   
}

/* Clear radio button */
function clearRadio(radio)
{		
	 for (var i = 0; i < radio.length; i++) {
     	radio[i].checked = false;    	
    }
}

/* Clear select options */
function clearSelect(selects)
{
     	selects[0].selected = true;
}


/* Add a simple object: just name */
function addSimple(addingFrm, addingRow, addingTotal, addingNumber, addingButton)
{
   document.forms[addingFrm].style.display = "block";
   document.getElementById(addingRow + adding_total).style.display = document.all?"block":"table-row";
   
   if (adding_total == addingNumber)
   {
      document.getElementById(addingButton).disabled = true;
   }
}

/* Close the adding form*/
function hideAdding(addingFrm, addingButton)
{
   document.forms[addingFrm].style.display = "none";
   document.getElementById(addingButton).disabled = false;
}


/* =================================== Functions to handle calendar ===================================== */

var currentDate = new Date();
var viewingMonth = currentDate.getMonth();
var viewingYear = currentDate.getFullYear();
var showStartCal = 0;
var showEndCal = 0;

//Month name
var months = new Array(12);
months[0] = "January";
months[1] = "February";
months[2] = "March";
months[3] = "April";
months[4] = "May";
months[5] = "June";
months[6] = "July";
months[7] = "August";
months[8] = "September";
months[9] = "October";
months[10] = "November";
months[11] = "December";

function displayCalendar(datePanel, dateField, m, y)
{
   var today = new Date();
   
   //Get the number of days for this month
   var daysNum = getDays(m,y);
   
   //Get the day of week of the 1/m/y
   var d = new Date();
   d.setDate(1);
   d.setMonth(m);
   d.setYear(y);
   var firstDay = d.getDay();   
   
   //Set the calendar size (6 rows and 7 cols)
   var calendar = new Array(6);
   for(i=0; i<7; i++)
   {
      calendar[i] = new Array(7);
   }
   
   //Populate the calendar
   var count = 0;
   var days_count = 1;
   for (i=0; i<6; i++)
   {
      for (j=0; j<7; j++)
      {
         //Check if to display empty space before the calendar
         if (count < firstDay)
         {
            calendar[i][j] = "&nbsp;";
         }         
         //Or display the calendar
         else if (count >= firstDay && days_count <= daysNum)
         {
            //Highlight today
            if (y == today.getFullYear() && m == today.getMonth() && days_count == today.getDate())
            {
               todayClass = "class = 'today' ";
            }
            else
            {
               todayClass = "";
            }
            
            calendar[i][j] = "<a href='javascript:selectDate(\"" + datePanel + "\",\"" + dateField + "\", \"" + days_count + "/" + (m + 1) + "/" + y + "\");' title='Select " + days_count + "/" + (m + 1) + "/" + y + "'" + todayClass + ">" + days_count + "</a>";
            days_count++;
         }         
         //Or display the empty space after the calendar
         else
         {
            calendar[i][j] = "&nbsp;";
         }
         count++;        
      }
   }
   
   //Get the calendar string
   var display = "";
   display += "<table border='1'>";
   display += "<tr><th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th></tr>";
   for (i=0; i<6; i++)
   {
      display += "<tr>";
      for (j=0; j<7; j++)
      {
         display += "<td>" + calendar[i][j] + "</td>";
      }
      display += "</tr>";
   }
   display += "</table>";
   
   //Display the calendar
   document.getElementById(datePanel + "_contents").innerHTML = display;
   document.getElementById(datePanel + "_viewing").innerHTML = months[viewingMonth] + " " + viewingYear;
}

//Get the number of days of a month
function getDays(m,y)
{
   var days = new Array(12);
   
   //Jan (0) to Dec (11)
   days[0] = 31;   
   days[1] = (y % 4 == 0)?29:28;   
   days[2] = 31;   
   days[3] = 30;   
   days[4] = 31;   
   days[5] = 30;   
   days[6] = 31;   
   days[7] = 31;   
   days[8] = 30;   
   days[9] = 31;   
   days[10] = 30;   
   days[11] = 31; 
   
   return days[m];
}

//Show the previous month
function showPrevious(datePanel, dateField)
{
   viewingMonth--;
   
   if (viewingMonth < 0)
   {
      viewingMonth = 11;
      viewingYear--;
   }
   
   displayCalendar(datePanel, dateField, viewingMonth, viewingYear);
}

//Show the next month
function showNext(datePanel, dateField)
{
   viewingMonth++;
   
   if (viewingMonth > 11)
   {
      viewingMonth = 0;
      viewingYear++;
   }
   
   displayCalendar(datePanel, dateField, viewingMonth, viewingYear);
}

//Select a date
function selectDate(datePanel, dateField, chosenDate)
{
   document.getElementById(dateField).value = chosenDate;
   togglePanel(datePanel);
}


/* =================================== Functions to handle time panel ===================================== */

//Select a time
function selectTime(timePanel, timeField, chosenTime)
{
   document.getElementById(timeField).value = chosenTime;
   togglePanel(timePanel);
}

//Time picker
$(function() {
    $( ".date_field" ).datepicker({
        showOn: "button",
        buttonImage: "images/calendar.gif",
        buttonImageOnly: true,
        dateFormat: 'd/m/yy'
    });
    $('.time_field').each(function(index){
    	var id = $(this).attr('id');
    	$(this).timepicker({
	    	hours: { starts: 9, ends: 21 },
			minutes: { interval: 20 },
   			showPeriodLabels: false,
			showOn: 'button',
			button: '.'+id
		});
    });
});