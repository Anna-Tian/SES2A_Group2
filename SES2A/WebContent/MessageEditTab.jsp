<%@ page import="com.dao.MessageDatabase"%>
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
				$('.head').load('admin_head.html');
				$('.footer').load('admin_footer.html');
				CKEDITOR.config.allowedContent = true;
				var choiceValue = localStorage.getItem("selectedOption");
				document.getElementById("messageTabSelectList").options[choiceValue].selected = "selected";
				var txtEditor = CKEDITOR.replace( 'textEditor', {
					/* on: {
						instanceReady: function(evt){
						var editor = evt.editor;
						editor.config.allowedContent = true;
						}
					} */
				});
				
				
				var mess1 = "<%=MessageDatabase.getCurrentMessage(1).getMessageDetailed()%>";
				var mess2 = "<%=MessageDatabase.getCurrentMessage(2).getMessageDetailed()%>";
				var mess3 = "<%=MessageDatabase.getCurrentMessage(3).getMessageDetailed()%>";
				var mess4 = "<%=MessageDatabase.getCurrentMessage(4).getMessageDetailed()%>";
				var mess5 = "<%=MessageDatabase.getCurrentMessage(5).getMessageDetailed()%>";
				var mess6 = "<%=MessageDatabase.getCurrentMessage(6).getMessageDetailed()%>";
				var mess7 = "<%=MessageDatabase.getCurrentMessage(7).getMessageDetailed()%>";
				var mess8 = "<%=MessageDatabase.getCurrentMessage(8).getMessageDetailed()%>";
				var mess9 = "<%=MessageDatabase.getCurrentMessage(9).getMessageDetailed()%>";
				var mess10 = "<%=MessageDatabase.getCurrentMessage(10).getMessageDetailed()%>";
				var mess11 = "<%=MessageDatabase.getCurrentMessage(11).getMessageDetailed()%>";
				var mess12 = "<%=MessageDatabase.getCurrentMessage(12).getMessageDetailed()%>";

				//TODO: if there is any way to directly use choiceValue for getCurrentMessage, it would be much less of hard-coding
				switch(choiceValue){
				    case '1': txtEditor.setData(mess1); break;
					case '2': txtEditor.setData(mess2); break;
					case '3': txtEditor.setData(mess3); break;
					case '4': txtEditor.setData(mess4); break;
					case '5': txtEditor.setData(mess5); break;
					case '6': txtEditor.setData(mess6); break;
					case '7': txtEditor.setData(mess7); break;
					case '8': txtEditor.setData(mess8); break;
					case '9': txtEditor.setData(mess9); break;
					case '10': txtEditor.setData(mess10); break;
					case '11': txtEditor.setData(mess11); break;
					case '12': txtEditor.setData(mess12); break;
					default: break;
				}
				/*text area change event*/
				txtEditor.on('change', function(){
					$("#cancelButton").show();
					$("#saveButton").show();
				}); 
				
			
				/*handle select list event*/
				$("#messageTabSelectList").change(function(){
					var selectedOptionValue = document.getElementById("messageTabSelectList").value;
					if(selectedOptionValue != '0'){   
						$("#previewButton").hide();
						$("#publishButton").hide();
						$("#cancelButton").hide();
						$("#saveButton").hide();
						switch(selectedOptionValue){
						    case '1': txtEditor.setData(mess1); break;
							case '2': txtEditor.setData(mess2); break;
							case '3': txtEditor.setData(mess3); break;
							case '4': txtEditor.setData(mess4); break;
							case '5': txtEditor.setData(mess5); break;
							case '6': txtEditor.setData(mess6); break;
							case '7': txtEditor.setData(mess7); break;
							case '8': txtEditor.setData(mess8); break;
							case '9': txtEditor.setData(mess9); break;
							case '10': txtEditor.setData(mess10); break;
							case '11': txtEditor.setData(mess11); break;
							case '12': txtEditor.setData(mess12); break;
							default: break;
						}	
					}
					else{
						window.location = "MessageTab.jsp";
					}	
				});
				/*handle preview button click*/
				$("#previewButton").click(function(){
					//open preview window
					var myWindow = window.open("", "width=200,height=100");
				    
				});
				/*handle publish button click*/
				$("#publishButton").click(function(){
					//save changes made to the message into the database
					var message = txtEditor.html();
					
					$("#updateMessage").show();
				});
				/*handle cancel button click*/
				$("#cancelButton").click(function(){
					window.location = "MessageTab.jsp";
				});
				/*handle save button click*/
				$("#saveButton").click(function(){
					//save changes and enable preview and publish button
					$("#previewButton").show();
					$("#publishButton").show();
					$("#saveButton").hide();
					$("#cancelButton").hide();
				});
			});
		</script>
	</head>
	
	<body>
		<div class="header"></div>
		
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
		
		<div class="footer"></div>
              
		<!-- In case browser doesnot enable JS -->
		<noscript>Sorry, your browser does not support JavaScript!</noscript>
	</body>
</html>