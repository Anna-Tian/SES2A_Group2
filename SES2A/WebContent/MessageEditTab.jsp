<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>MESSAGE EDIT TAB</title>
		<link rel="stylesheet" href="css/MessageEditTab.css" />
		<script src="https://cdn.ckeditor.com/4.11.3/standard/ckeditor.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	
		<script>

			
			$(function(){

				/* initiate the page */
				var txtEditor = CKEDITOR.replace( 'textEditor');
				txtEditor.on('change', function(){
					$("#cancelButton").show();
					$("#saveButton").show();
				}); 

				var choiceValue = localStorage.getItem("selectedOption");
				document.getElementById("messageTabSelectList").options[choiceValue].selected = 'selected';
				

				/*handle select list event*/
				$("#messageTabSelectList").change(function(){
					var selectedOptionValue = this.value;

					if(selectedOptionValue != "0"){
	                    /* CKEDITOR.instances.textEditor.setData('<p>This is the editor data.</p>');
	                    this line of code is working
	                    is expected to retrieve html from the database and apply it here */
						$("#previewButton").hide();
						$("#publishButton").hide();
						$("#cancelButton").hide();
						$("#saveButton").hide();
					}
					else{
						window.location = "MessageTab.jsp";
					}	
				});

				/*handle preview button click*/
				$("#previewButton").click(function(){
					//open preview window
					
				});

				/*handle publish button click*/
				$("#publishButton").click(function(){
					//save changes made to the message
					
				});

				/*handle cancel button click*/
				$("#cancelButton").click(function(){
					//cancel changes and hide buttons
					$("#previewButton").hide();
					$("#publishButton").hide();
				});

				/*handle save button click*/
				$("#saveButton").click(function(){
					//save changes and enable preview and publish button
					$("#previewButton").show();
					$("#publishButton").show();
					$("#updateMessage").show();
				});
			});
		</script>
	</head>
	
	<body>
		<p id="updateMessage">Updated the message</p>
		
		<div id="div1">
			<select id="messageTabSelectList">
				<option value="0"></option>
				<option value="1">FAQ in student interface</option>
				<option value="2">Instruction of file upload in student interface</option>
				<option value="3">Instruction of nav in student interface</option>
				<option value="4">Instruction of skill set in student interface</option>
				<option value="5">Instruction of student Profile in student interface</option>
				<option value="6">Instruction of student Profile in student interface - bottom</option>
				<option value="7">Instruction of workshops in attendance interface</option>
				<option value="8">Instruction of workshops in student interface</option>
				<option value="9">Logon page announcement in attendance interface</option>
				<option value="10">Logon page announcement in student interface</option>
				<option value="11">Logon page box on the right in student interface</option>
				<option value="12">Program in student interface</option>
			</select>
			<button id="previewButton" type="button">Preview</button>
			<button id="publishButton" type="button">Publish</button>
		</div>
		
		<textarea id="textEditor"></textarea>
		
		<div id="cancelSaveButton">
			<button id="cancelButton" type="button">Cancel</button>
			<button id="saveButton" type="button">Save</button>
		</div>
		
		<p id="logo">©HELPS Booking System</p>
              
               
		
		<!-- In case browser doesnot enable JS -->
		<noscript>Sorry, your browser does not support JavaScript!</noscript>
	</body>
</html>