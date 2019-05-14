<%@page import="java.util.Arrays"%>
<%@page import="com.bean.StudentProfile"%>
<%@ page import="com.dao.MessageDatabase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HELPS booking system</title>
	<link rel="stylesheet" href="css/myInformation.css" />
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			
			$(".head").load("student_menu.html");
			$(".foot").load("foot.html");
			
			var gender = "${studentProfile.gender}";
			var degree = "${studentProfile.degree}";
			var year = "${studentProfile.year}";
			var type = "${studentProfile.type}";
			var status = "${studentProfile.status}";
			var language = "${studentProfile.firstLanguage}";
			var country = "${studentProfile.countryOfOrigin}";
			$("[value="+gender+"]").prop("checked",true);
			$("[value="+degree+"]").prop("checked",true);
			if(degree=="UG"){
				var radio_id = $("[value="+degree+"]").attr("id").split("_")[1];
				$("p[id$='details']").hide();
				$("#"+radio_id+"").show();
				$("[value='"+year+"']").prop("selected",true);
			} else if(degree=="PG"){
				var radio_id = $("[value="+degree+"]").attr("id").split("_")[1];
				$("p[id$='details']").hide();
				$("#"+radio_id+"").show();
				$("[value='"+type+"']").prop("checked",true);
			}
			$("[value="+status+"]").prop("checked",true);
			$("[value='"+language+"']").prop("selected",true);
			$("[value='"+country+"']").prop("selected",true);
			
			
			<%
			String[] eduBg = (String[])session.getAttribute("eduBg");
			String[] eduBgMark = (String[])session.getAttribute("eduBgMark");
			if(eduBg!=null&&eduBgMark!=null&&!"ul".equals(eduBg[0])&&!"ul".equals(eduBgMark[0])){
				for(int i=0;i<eduBg.length;i++){	
					String name1 = eduBg[i].substring(3);
					pageContext.setAttribute("name1",name1);
					String val1 = eduBgMark[i];
					pageContext.setAttribute("val1",val1);%>
					$("[value='<%=eduBg[i]%>']").prop("checked",true);
					var name2 = "${name1}";
					var name = "txt"+name2+"_mark";
					var name3 = "txt_"+name2+"_mark";
					var value = "${val1}";
					$("#"+name+"").val(value);
					$("#"+name+"").show();
					$("#"+name3+"").show();
				<%}
			}%>
			
			
			
			$("input[id^='rdoDegree_']").click(function(){
				var radio_id = this.id.split("_")[1];
				$("p[id$='details']").hide();
				$("#"+radio_id+"").show();
			});
			$("input[id^='ckb']").click(function(){
				var name1 = $(this).attr("id");
				var name2 = "txt"+name1.substr(3)+"_mark";
				var name3 = "txt_"+name1.substr(3)+"_mark";
				if(this.checked==true){
					$("#"+name2+"").show();
					$("#"+name3+"").show();
				}else{
					$("#"+name2+"").val("");
					$("#"+name2+"").hide();
					$("#"+name3+"").hide();
				}
			});
			/* $("#btnRegister").click(function(){
				$("#btnRegister").submit();
			}); */
		});
	</script>
	<script>
	$(function(){
		var mess1 = "<%=MessageDatabase.getCurrentMessage(4).getMessageDetailed()%>";
		$("#a-box").html(mess);
		var mess2 = "<%=MessageDatabase.getCurrentMessage(6).getMessageDetailed()%>";
		$(".notes-box").html(mess);
	});
	</script>
</head>
<body>
	<div class="head"></div>
	
	<!-- <div id="global-utility-bar">
		UTS Logo
		<div id="uts-logo">
			<a href="http://www.uts.edu.au"><img src="https://web-common.uts.edu.au/images/utslogo.gif" alt="University of Technology, Sydney homepage" width="132" height="30" /></a>
		</div>
	</div> -->
	
	<div id="main-container">
		<!-- <div id="header">
			<a href="http://www.ssu.uts.edu.au/helps/index.html" id="logo-elssa">HELPS</a>
			<div id="navigation">
				<a href="index.cfm?scope=Program">Programs</a>
				<a href="index.cfm?scope=help">FAQ</a>
				<a href="index.cfm?scope=logout">Exit</a>
			</div>
		</div> -->
		<!-- Content -->
		<div id="content">
			<div id="a-box">
				<h2>Student Registration</h2>
				<div id="student_profile_instruction">
					<p>This page displays your profile. Please update it whenever necessary (especially your contact details).</p>
					<p>Questions marked with an asterisk (*) are compulsory.</p>
					<p>&nbsp;</p>
				</div>
			</div>
			
			<form action="MyInformationServlet" method="post" id="profile">
				<div class="profile-left">
					<input type="Hidden" name="studentID" value="12990747">
					<input type="Hidden" name="dob" value="19960502">
					<p>Student Name: <strong>${sessionScope.student.firstName} ${sessionScope.student.lastName}</strong></p>
					<p>Preferred First Name: <input type="Text" name="preferred_name" value="${sessionScope.studentProfile.preferredFirstName}" maxlength="50"/></p>
					<p>Faculty: ${sessionScope.student.faculty}</p>
					<p>Course: <strong>${sessionScope.student.course}</strong></p>
					<p>Email: <strong>${sessionScope.student.email}</strong></p>
					
					<p>Home phone: ${sessionScope.student.phone}</p>
					<p>Mobile: <strong>${sessionScope.student.mobile}</strong></p>
					<p>Best contact no*: <input type="Text" name="alternativecontact" value="${sessionScope.studentProfile.bestContactNum}" maxlength="15" /></p>
					
					<p>DOB: <strong>${sessionScope.student.dob}</strong></p>
					<p>Gender:&nbsp;
					    &nbsp;<input type="Radio" name="rdoGender" value="M" />M (male)
					    &nbsp;&nbsp;<input type="Radio" name="rdoGender" value="F"  />F (female)
					    &nbsp;&nbsp;<input type="Radio" name="rdoGender" value="X"  />X (indeterminate/unspecified/intersex)
					</p>
					<p>Degree*: 
						<input type="Radio" name="rdoDegree" value="UG" id="rdoDegree_UGdetails"/>Undergraduate
						<input type="Radio" name="rdoDegree" value="PG" id="rdoDegree_PGdetails"/>Postgraduate
					</p>
					<p id="UGdetails" style="display:none;">Year*: 
						<select name="rdoUGDegreeDetails">
							<option value=""></option>
							<option value="1st" >1<sup>st</sup> year</option>
							<option value="2nd" >2<sup>nd</sup> year</option>
							<option value="3rd" >3<sup>rd</sup> year</option>
							<option value="4th" >4<sup>th</sup> year</option>
							<option value="5th" >5<sup>th</sup> year</option>
						</select>
					</p>
					<p id="PGdetails" style="display:none;">Type*: 
						<input type="Radio" name="rdoPGDegreeDetails"  value="course work" />Course work &nbsp;&nbsp;
						<input type="Radio" name="rdoPGDegreeDetails"  value="research" />Research &nbsp;&nbsp;		
					</p>
					<p>Status*: 
						<input type="Radio" name="rdoStatus" value="Permanent"  />Permanent
						&nbsp;
						<input type="Radio" name="rdoStatus" value="International"  />International
					</p>
					<p>First Language*: 
						<select name="selLang">
							<option value=""></option>
							<option value="Abkhazian" >Abkhazian</option>	
							<option value="Afar" >Afar</option>
							<option value="Afrikaans" >Afrikaans</option>
							<option value="Albanian" >Albanian</option>
							<option value="Amharic" >Amharic</option>
							<option value="Arabic" >Arabic</option>
							<option value="Armenian" >Armenian</option>
							<option value="Assamese" >Assamese</option>
							<option value="Aymara" >Aymara</option>
							<option value="Azerbaijani" >Azerbaijani</option>
							<option value="Bashkir" >Bashkir</option>
							<option value="Basque" >Basque</option>
							<option value="Belarusian" >Belarusian</option>
							<option value="Bengali" >Bengali</option>
							<option value="Bhutani" >Bhutani</option>
							<option value="Bihari" >Bihari</option>
							<option value="Bislama" >Bislama</option>
							<option value="Bosnian" >Bosnian</option>
							<option value="Breton" >Breton</option>
							<option value="Bulgarian" >Bulgarian</option>
							<option value="Burmese" >Burmese</option>
							<option value="Catalan" >Catalan</option>
							<option value="Chinese (Cantonese)" >Chinese (Cantonese)</option>
							<option value="Chinese (Mandarin)" >Chinese (Mandarin)</option>
							<option value="Chinese (other)" >Chinese (other)</option>
							<option value="Corsican" >Corsican</option>
							<option value="Croatian" >Croatian</option>
							<option value="Czech" >Czech</option>
							<option value="Danish" >Danish</option>
							<option value="Dhivehi" >Dhivehi</option>
							<option value="Dutch" >Dutch</option>
							<option value="English">English</option>
							<option value="Esperanto" >Esperanto</option>
							<option value="Estonian" >Estonian</option>
							<option value="Faroese" >Faroese</option>
							<option value="Farsi" >Farsi</option>
							<option value="Fiji" >Fiji</option>
							<option value="Finnish" >Finnish</option>
							<option value="French" >French</option>
							<option value="Frisian" >Frisian</option>
							<option value="Galician" >Galician</option>
							<option value="Ganda" >Ganda</option>
							<option value="Georgian" >Georgian</option>
							<option value="German" >German</option>
							<option value="Gree" >Greek</option>
							<option value="Greenlandic" >Greenlandic</option>
							<option value="Guarani" >Guarani</option>
							<option value="Gujarati" >Gujarati</option>
							<option value="Haitian Creole" >Haitian Creole</option>
							<option value="Hausa" >Hausa</option>
							<option value="Hebrew" >Hebrew</option>
							<option value="Hindi" >Hindi</option>
							<option value="Hungarian" >Hungarian</option>
							<option value="Icelandic" >Icelandic</option>
							<option value="Indonesian" >Indonesian</option>
							<option value="Inuktitut" >Inuktitut</option>
							<option value="Inupiak" >Inupiak</option>
							<option value="Irish" >Irish</option>
							<option value="Italian" >Italian</option>
							<option value="Japanese" >Japanese</option>
							<option value="Javanese" >Javanese</option>
							<option value="Kannada" >Kannada</option>
							<option value="Kashmiri" >Kashmiri</option>
							<option value="Kazakh" >Kazakh</option>
							<option value="Khmer" >Khmer</option>
							<option value="Kinyarwanda" >Kinyarwanda</option>
							<option value="Kirundi" >Kirundi</option>
							<option value="Korean" >Korean</option>
							<option value="Kurdish" >Kurdish</option>
							<option value="Kyrgyz" >Kyrgyz</option>
							<option value="Laothian" >Laothian</option>
							<option value="Latin" >Latin</option>
							<option value="Latvian" >Latvian</option>
							<option value="Lingala" >Lingala</option>
							<option value="Lithuanian" >Lithuanian</option>
							<option value="Macedonian" >Macedonian</option>
							<option value="Malagasy" >Malagasy</option>
							<option value="Malay" >Malay</option>
							<option value="Malayalam" >Malayalam</option>
							<option value="Maltese" >Maltese</option>
							<option value="Maori" >Maori</option>
							<option value="Marathi" >Marathi</option>
							<option value="Moldavian" >Moldavian</option>
							<option value="Mongolian" >Mongolian</option>
							<option value="Nauru" >Nauru</option>
							<option value="Nepali" >Nepali</option>
							<option value="Norwegian (Bokmal)" >Norwegian (Bokmal)</option>
							<option value="Norwegian (Nynorsk)" >Norwegian (Nynorsk)</option>
							<option value="Oriya" >Oriya</option>
							<option value="Oromo" >Oromo</option>
							<option value="Pashto/Pushto" >Pashto/Pushto</option>
							<option value="Polish" >Polish</option>
							<option value="Portuguese (Brazil)" >Portuguese (Brazil)</option>
							<option value="Portuguese" >Portuguese (Portugal)</option>
							<option value="Punjabi" >Punjabi</option>
							<option value="Quechua" >Quechua</option>
							<option value="Rhaeto-Romance" >Rhaeto-Romance</option>
							<option value="Romanian" >Romanian</option>
							<option value="Russian" >Russian</option>
							<option value="Samoan" >Samoan</option>
							<option value="Sangho" >Sangho</option>
							<option value="Sanskrit" >Sanskrit</option>
							<option value="Scots Gaelic" >Scots Gaelic</option>
							<option value="Serbian" >Serbian</option>
							<option value="Serbo-Croatian" >Serbo-Croatian</option>
							<option value="Sesotho" >Sesotho</option>
							<option value="Setswana" >Setswana</option>
							<option value="Shona" >Shona</option>
							<option value="Sindhi" >Sindhi</option>
							<option value="Sinhalese" >Sinhalese</option>
							<option value="Siswati" >Siswati</option>
							<option value="Slovak" >Slovak</option>
							<option value="Slovenian" >Slovenian</option>
							<option value="Somali" >Somali</option>
							<option value="Spanish" >Spanish</option>
							<option value="Sundanese" >Sundanese</option>
							<option value="Swahili" >Swahili</option>
							<option value="Swedish" >Swedish</option>
							<option value="Tagalog" >Tagalog</option>
							<option value="Tajik" >Tajik</option>
							<option value="Tamil" >Tamil</option>
							<option value="Tatar" >Tatar</option>
							<option value="Telugu" >Telugu</option>
							<option value="Thai" >Thai</option>
							<option value="Tibetan" >Tibetan</option>
							<option value="Tigrinya" >Tigrinya</option>
							<option value="Tonga" >Tonga</option>
							<option value="Tsonga" >Tsonga</option>
							<option value="Turkish" >Turkish</option>
							<option value="Turkmen" >Turkmen</option>
							<option value="Twi" >Twi</option>
							<option value="Uighur" >Uighur</option>
							<option value="Ukrainian" >Ukrainian</option>
							<option value="Urdu" >Urdu</option>
							<option value="Uzbek" >Uzbek</option>
							<option value="Vietnamese" >Vietnamese</option>
							<option value="Volapuk" >Volapuk</option>
							<option value="Welsh" >Welsh</option>
							<option value="Wolof" >Wolof</option>
							<option value="Xhosa" >Xhosa</option>
							<option value="Yiddish" >Yiddish</option>
							<option value="Yiddish" >Yiddish</option>
							<option value="Zhuang" >Zhuang</option>
							<option value="Zulu" >Zulu</option>
						</select>
					</p>
					<p>Country of Origin*: 
						<select name="selCountry">
							<option value=""></option>
							<option value="Afghanistan"  >Afghanistan</option>
							<option value="Albania"  >Albania</option>
							<option value="Algeria"  >Algeria</option>
							<option value="American Samoa"  >American Samoa</option>
							<option value="Andorra"  >Andorra</option>
							<option value="Angola"  >Angola</option>
							<option value="Anguilla"  >Anguilla</option>
							<option value="Antarctica"  >Antarctica</option>
							<option value="Antigua"  >Antigua</option>
							<option value="Argentina"  >Argentina</option>
							<option value="Armenia"  >Armenia</option>
							<option value="Aruba"  >Aruba</option>
							<option value="Ascension Island"  >Ascension Island</option>
							<option value="Australia"  >Australia</option>
							<option value="Austria"  >Austria</option>
							<option value="Azerbaijan"  >Azerbaijan</option>
							<option value="Bahamas"  >Bahamas</option>
							<option value="Bangladesh"  >Bangladesh</option>
							<option value="Barbados"  >Barbados</option>
							<option value="Barbuda"  >Barbuda</option>
							<option value="Belarus"  >Belarus</option>
							<option value="Belgium"  >Belgium</option>
							<option value="Belize"  >Belize</option>
							<option value="Benin"  >Benin</option>
							<option value="Bermuda"  >Bermuda</option>
							<option value="Bhutan"  >Bhutan</option>
							<option value="Bolivia"  >Bolivia</option>
							<option value="Bosnia and Herzegowina"  >Bosnia and Herzegowina</option>
							<option value="Botswana"  >Botswana</option>
							<option value="Brazil"  >Brazil</option>
							<option value="British Virgin Islands"  >British Virgin Islands</option>
							<option value="Brunei Darussalam"  >Brunei Darussalam</option>
							<option value="Bulgaria"  >Bulgaria</option>
							<option value="Burkina Faso"  >Burkina Faso</option>
							<option value="Burundi"  >Burundi</option>
							<option value="Cambodia"  >Cambodia</option>
							<option value="Cameroon"  >Cameroon</option>
							<option value="Canada"  >Canada</option>
							<option value="Cape Verde Islands"  >Cape Verde Islands</option>
							<option value="Cayman Islands"  >Cayman Islands</option>
							<option value="Central African Republic"  >Central African Republic</option>
							<option value="Chad"  >Chad</option>
							<option value="Chatham Island"  >Chatham Island</option>
							<option value="Chile"  >Chile</option>
							<option value="China"  >China</option>
							<option value="Christmas Island"  >Christmas Island</option>
							<option value="Cocos-Keeling Islands"  >Cocos-Keeling Islands</option>
							<option value="Colombia"  >Colombia</option>
							<option value="Comoros"  >Comoros</option>
							<option value="Congo"  >Congo</option>
							<option value="Cook Islands"  >Cook Islands</option>
							<option value="Costa Rica"  >Costa Rica</option>
							<option value="Cuba"  >Cuba</option>
							<option value="Croatia"  >Croatia</option>
							<option value="Curacao"  >Curacao</option>
							<option value="Cyprus"  >Cyprus</option>
							<option value="Czech Republic"  >Czech Republic</option>
							<option value="Denmark"  >Denmark</option>
							<option value="Diego Garcia"  >Diego Garcia</option>
							<option value="Dominica"  >Dominica</option>
							<option value="Dominican Republic"  >Dominican Republic</option>
							<option value="D'Jibouti"  >D'Jibouti</option>
							<option value="Easter Island"  >Easter Island</option>
							<option value="Ecuador"  >Ecuador</option>
							<option value="Egypt"  >Egypt</option>
							<option value="El Salvador"  >El Salvador</option>
							<option value="Equatorial Guinea"  >Equatorial Guinea</option>
							<option value="Eritrea"  >Eritrea</option>
							<option value="Estonia"  >Estonia</option>
							<option value="Ethiopia"  >Ethiopia</option>
							<option value="Faroe Islands"  >Faroe Islands</option>
							<option value="Falkland Islands"  >Falkland Islands</option>
							<option value="Fiji Islands"  >Fiji Islands</option>
							<option value="Finland"  >Finland</option>
							<option value="France"  >France</option>
							<option value="French Antilles"  >French Antilles</option>
							<option value="French Giuana"  >French Giuana</option>
							<option value="French Polynesia"  >French Polynesia</option>
							<option value="Gabon"  >Gabon</option>
							<option value="Gambia"  >Gambia</option>
							<option value="Georgia"  >Georgia</option>
							<option value="Germany"  >Germany</option>
							<option value="Ghana"  >Ghana</option>
							<option value="Gibraltar"  >Gibraltar</option>
							<option value="Greece"  >Greece</option>
							<option value="Greenland"  >Greenland</option>
							<option value="Grenada"  >Grenada</option>
							<option value="Grenadine Islands"  >Grenadine Islands</option>
							<option value="Guadalupe"  >Guadalupe</option>
							<option value="Guam"  >Guam</option>
							<option value="Guantanamo Bay (Cuba)"  >Guantanamo Bay (Cuba)</option>
							<option value="Guatemala"  >Guatemala</option>
							<option value="Guinea"  >Guinea</option>
							<option value="Guinea-Bissau"  >Guinea-Bissau</option>
							<option value="Guyana"  >Guyana</option>
							<option value="Haiti"  >Haiti</option>
							<option value="Honduras"  >Honduras</option>
							<option value="Hong Kong"  >Hong Kong</option>
							<option value="Hungary"  >Hungary</option>
							<option value="Iceland"  >Iceland</option>
							<option value="India"  >India</option>
							<option value="Indonesia"  >Indonesia</option>
							<option value="Iran"  >Iran</option>
							<option value="Iraq"  >Iraq</option>
							<option value="Ireland"  >Ireland</option>
							<option value="Israel"  >Israel</option>
							<option value="Italy"  >Italy</option>
							<option value="Ivory Coast"  >Ivory Coast</option>
							<option value="Jamaica"  >Jamaica</option>
							<option value="Japan"  >Japan</option>
							<option value="Jordan"  >Jordan</option>
							<option value="Kazakhstan"  >Kazakhstan</option>
							<option value="Kenya"  >Kenya</option>
							<option value="Kiribati"  >Kiribati</option>
							<option value="Korea (Republic of)"  >Korea (Republic of)</option>
							<option value="Kuwait"  >Kuwait</option>
							<option value="Kyrgyz Republic"  >Kyrgyz Republic</option>
							<option value="Laos"  >Laos</option>
							<option value="Latvia"  >Latvia</option>
							<option value="Lebanon"  >Lebanon</option>
							<option value="Lesotho"  >Lesotho</option>
							<option value="Liberia"  >Liberia</option>
							<option value="Libya"  >Libya</option>
							<option value="Liechtenstein"  >Liechtenstein</option>
							<option value="Lithuania"  >Lithuania</option>
							<option value="Luxembourg"  >Luxembourg</option>
							<option value="Macau"  >Macau</option>
							<option value="Macedonia"  >Macedonia</option>
							<option value="Madagascar"  >Madagascar</option>
							<option value="Malawi"  >Malawi</option>
							<option value="Malaysia"  >Malaysia</option>
							<option value="Maldives"  >Maldives</option>
							<option value="Mali"  >Mali</option>
							<option value="Malta"  >Malta</option>
							<option value="Marshall Islands"  >Marshall Islands</option>
							<option value="Martinique"  >Martinique</option>
							<option value="Mauritania"  >Mauritania</option>
							<option value="Mauritus"  >Mauritus</option>
							<option value="Mayotte Island"  >Mayotte Island</option>
							<option value="Mexico"  >Mexico</option>
							<option value="Micronesia"  >Micronesia</option>
							<option value="Midway Island"  >Midway Island</option>
							<option value="Moldova (Republic of)"  >Moldova (Republic of)</option>
							<option value="Monaco"  >Monaco</option>
							<option value="Mongolia"  >Mongolia</option>
							<option value="Montserat"  >Montserat</option>
							<option value="Morocco"  >Morocco</option>
							<option value="Mozambique"  >Mozambique</option>
							<option value="Myanmar"  >Myanmar</option>
							<option value="Namibia"  >Namibia</option>
							<option value="Nauru"  >Nauru</option>
							<option value="Nepal"  >Nepal</option>
							<option value="Netherlands"  >Netherlands</option>
							<option value="Netherlands Antilles"  >Netherlands Antilles</option>
							<option value="Nevis"  >Nevis</option>
							<option value="New Caledonia"  >New Caledonia</option>
							<option value="New Zealand"  >New Zealand</option>
							<option value="Nicaragua"  >Nicaragua</option>
							<option value="Niger"  >Niger</option>
							<option value="Nigeria"  >Nigeria</option>
							<option value="Niue"  >Niue</option>
							<option value="Norfolk Island"  >Norfolk Island</option>
							<option value="Northern Marianas Islands"  >Northern Marianas Islands</option>
							<option value="Norway"  >Norway</option>
							<option value="Oman"  >Oman</option>
							<option value="Pakistan"  >Pakistan</option>
							<option value="Palau"  >Palau</option>
							<option value="Palestine"  >Palestine</option>
							<option value="Panama"  >Panama</option>
							<option value="Papua New Guinea"  >Papua New Guinea</option>
							<option value="Paraguay"  >Paraguay</option>
							<option value="Peru"  >Peru</option>
							<option value="Philippines"  >Philippines</option>
							<option value="Poland"  >Poland</option>
							<option value="Portugal"  >Portugal</option>
							<option value="Puerto Rico"  >Puerto Rico</option>
							<option value="Qatar"  >Qatar</option>
							<option value="RĂ©union Island"  >RĂ©union Island</option>
							<option value="Romania"  >Romania</option>
							<option value="Russian Federation"  >Russian Federation</option>
							<option value="Rwanda"  >Rwanda</option>
							<option value="San Marino"  >San Marino</option>
							<option value="Sao Tome and Principe"  >Sao Tome and Principe</option>
							<option value="Saudi Arabia"  >Saudi Arabia</option>
							<option value="Senegal"  >Senegal</option>
							<option value="Serbia"  >Serbia</option>
							<option value="Seychelles"  >Seychelles</option>
							<option value="Sierra Leone"  >Sierra Leone</option>
							<option value="Singapore"  >Singapore</option>
							<option value="Slovakia"  >Slovakia</option>
							<option value="Slovenia"  >Slovenia</option>
							<option value="Solomon Islands"  >Solomon Islands</option>
							<option value="Somalia"  >Somalia</option>
							<option value="South Africa"  >South Africa</option>
							<option value="Spain"  >Spain</option>
							<option value="Sri Lanka"  >Sri Lanka</option>
							<option value="St. Helena"  >St. Helena</option>
							<option value="St. Kitts"  >St. Kitts</option>
							<option value="St. Lucia"  >St. Lucia</option>
							<option value="St. Pierre et Miquelon"  >St. Pierre et Miquelon</option>
							<option value="Sudan"  >Sudan</option>
							<option value="Suriname"  >Suriname</option>
							<option value="Swaziland"  >Swaziland</option>
							<option value="Sweden"  >Sweden</option>
							<option value="Switzerland"  >Switzerland</option>
							<option value="Syria"  >Syria</option>
							<option value="Tahiti"  >Tahiti</option>
							<option value="Taiwan"  >Taiwan</option>
							<option value="Tajikistan"  >Tajikistan</option>
							<option value="Tanzania"  >Tanzania</option>
							<option value="Thailand"  >Thailand</option>
							<option value="Timor-Leste"  >Timor-Leste</option>
							<option value="Togo"  >Togo</option>
							<option value="Tokelau Islands"  >Tokelau Islands</option>
							<option value="Tonga Islands"  >Tonga Islands</option>
							<option value="Trinidad and Tobago"  >Trinidad and Tobago</option>
							<option value="Tunisia"  >Tunisia</option>
							<option value="Turkey"  >Turkey</option>
							<option value="Turkmenistan"  >Turkmenistan</option>
							<option value="Turks and Caicos Islands"  >Turks and Caicos Islands</option>
							<option value="Tuvalu"  >Tuvalu</option>
							<option value="Uganda"  >Uganda</option>
							<option value="Ukraine"  >Ukraine</option>
							<option value="United Arab Emirates"  >United Arab Emirates</option>
							<option value="United Kingdom"  >United Kingdom</option>
							<option value="United States"  >United States</option>
							<option value="Uruguay"  >Uruguay</option>
							<option value="US Virgin Islands"  >US Virgin Islands</option>
							<option value="Uzbekistan"  >Uzbekistan</option>
							<option value="Vanuatu"  >Vanuatu</option>
							<option value="Vatican City"  >Vatican City</option>
							<option value="Venezuela"  >Venezuela</option>
							<option value="Vietnam"  >Vietnam</option>
							<option value="Wake Island"  >Wake Island</option>
							<option value="Wallis and Futuna Islands"  >Wallis and Futuna Islands</option>
							<option value="Western Samoa"  >Western Samoa</option>
							<option value="Yemen-Arab Republic"  >Yemen-Arab Republic</option>
							<option value="Zambia"  >Zambia</option>
							<option value="Zanzibar"  >Zanzibar</option>
							<option value="Zimbawe"  >Zimbawe</option>
						</select>
					</p>
				</div>
				
				<div class="profile-right">
					<p>Educational Backgound:</p>
						<table border="0">
							<tr>
								<td><input type="Checkbox" id="ckbHSC" name="ckb" value="ckbHSC" />HSC</td>
								<td id="txt_HSC_mark" style="display:none;">Mark <input type="Text" id="txtHSC_mark"  name="txt_mark" value="" size="5" /></td>
							</tr>
							<tr>
								<td><input type="Checkbox" id="ckbIELTS" name="ckb" value="ckbIELTS" />IELTS</td>
								<td id="txt_IELTS_mark"  style="display:none;">Mark <input type="Text" id="txtIELTS_mark" name="txt_mark" value="" size="5"/></td>
							</tr>
							<tr>
								<td><input type="Checkbox" id="ckbTOEFL" name="ckb" value="ckbTOEFL" />TOEFL</td>
								<td id="txt_TOEFL_mark" style="display:none;">Mark <input type="Text" id="txtTOEFL_mark" name="txt_mark" value="" size="5" /></td>
							</tr>
							<tr>
								<td><input type="Checkbox" id="ckbTAFE" name="ckb" value="ckbTAFE" />TAFE</td>
								<td id="txt_TAFE_mark" style="display:none;">Mark <input type="Text" id="txtTAFE_mark" name="txt_mark" value="" size="5" /></td>
							</tr>
							<tr>
								<td><input type="Checkbox" id="ckbCULT" name="ckb" value="ckbCULT" />CULT</td>
								<td id="txt_CULT_mark" style="display:none;">Mark <input type="Text" id="txtCULT_mark" name="txt_mark" value="" size="5" /></td>
							</tr>
							<tr>
								<td><input type="Checkbox" id="ckbInsearchDEEP" name="ckb" value="ckbInsearchDEEP" />Insearch DEEP</td>
								<td id="txt_InsearchDEEP_mark" style="display:none;">Mark <input type="Text" id="txtInsearchDEEP_mark" name="txt_mark" value="" size="5" /></td>
							</tr>
							<tr>
								<td><input type="Checkbox" id="ckbInsearchDiploma" name="ckb" value="ckbInsearchDiploma" />Insearch Diploma</td>
								<td id="txt_InsearchDiploma_mark" style="display:none;">Mark <input type="Text" id="txtInsearchDiploma_mark" name="txt_mark" value="" size="5" /></td>
							</tr>
							<tr>
								<td><input type="Checkbox" id="ckbfoundationcourse" name="ckb" value="ckbfoundationcourse" />Foundation Course</td>
								<td id="txt_foundationcourse_mark" style="display:none;">Mark <input type="Text" id="txtfoundationcourse_mark" name="txt_mark" value="" size="5" /></td>
							</tr>
						</table>	
						<p>Other:<br/>
							<textarea name="txtBackground" cols="30" rows="5" wrap="soft" ></textarea>
						</p>	
				</div>
				
				<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
				
				<div class="clear notes-box-form">
					<p>When you submit your writing to us, we would like to use it (after removing any of your personal details) for educational or research purposes. Is this okay with you?
					Yes <input type="Radio" name="privacy_approval" value="1" checked />
					No <input type="Radio" name="privacy_approval" value="0"  /> <br/>
					UTS  is committed to privacy. For more information, please visit <a href="http://www.uts.edu.au/about-uts/uts-governance/privacy" target="_blank">Privacy at UTS</a>.
					</p>
				</div>
				
				<div class="clear">
					<input type="submit" name="btnRegister" value="Register" id="btnRegister" />
				</div>
			</form>
			
			<div class="notes-box">
				<p -webkit-text-stroke-width:="" font-size:="" font-style:="" font-variant-caps:="" font-variant-ligatures:="" font-weight:="" letter-spacing:="" new="" orphans:="" style="color: rgb(0, 0, 0); font-family: " text-align:="" text-indent:="" text-transform:="" times="" white-space:="" widows:="" word-spacing:="">
				The collected information (after removing any of your personal details) may also be used to:</p>
				<ul -webkit-text-stroke-width:="" font-size:="" font-style:="" font-variant-caps:="" font-variant-ligatures:="" font-weight:="" letter-spacing:="" new="" orphans:="" style="color: rgb(0, 0, 0); font-family: " text-align:="" text-indent:="" text-transform:="" times="" white-space:="" widows:="" word-spacing:="">
					<li>
						analyse demographics of HELPS students and the use of HELPS programs in order to find better ways to assist you; and/or,</li>
					<li>
						report to the University community on how HELPS programs are utilised</li>
				</ul>
				<p -webkit-text-stroke-width:="" font-size:="" font-style:="" font-variant-caps:="" font-variant-ligatures:="" font-weight:="" letter-spacing:="" new="" orphans:="" style="color: rgb(0, 0, 0); font-family: " text-align:="" text-indent:="" text-transform:="" times="" white-space:="" widows:="" word-spacing:="">
					Please be advised that any information you provide:</p>
				<ul -webkit-text-stroke-width:="" font-size:="" font-style:="" font-variant-caps:="" font-variant-ligatures:="" font-weight:="" letter-spacing:="" new="" orphans:="" style="color: rgb(0, 0, 0); font-family: " text-align:="" text-indent:="" text-transform:="" times="" white-space:="" widows:="" word-spacing:="">
					<li>
						will be kept in the system for the purposes outlined above; and</li>
					<li>
						will not be disclosed unless required or permitted by law.</li>
				</ul>
			</div>
		</div>

		<!-- Footer -->
		<!-- <div id="footer-wrapper">		
			<div class="footer-navigation">
				<a href="index.cfm?scope=Program">Programs</a>
				<a href="index.cfm?scope=help">FAQ</a> 
				<a href="index.cfm?scope=logout">Exit</a>	
			</div>
			
			<div id="footer-nav"></div>
			
			<div id="global-footer">
				<div id="footer-img">
					<a href="http://www.uts.edu.au/"><img src="https://web-common.uts.edu.au/images/uts_logo_footer.gif" alt="UTS homepage" width="130" height="29" /></a>
					<br />
					<a href="http://www.atn.edu.au">UTS is a member of the<br />Australian Technology Network of Universities</a>
				</div>

				<div id="footer-text">
					<div class="primary-links">
						<a href="http://email.itd.uts.edu.au/webapps/directory/byname/">Staff directory</a> 
						<img src="https://web-common.uts.edu.au/images/separator.gif" alt="" width="4" height="6" /> 
						<a href="http://www.uts.edu.au/about/mapsdirections/">Campus maps</a>
						<img src="https://web-common.uts.edu.au/images/separator.gif" alt="" width="4" height="6" /> 
						<a href="http://www.newsroom.uts.edu.au/">Newsroom</a>
						<img src="https://web-common.uts.edu.au/images/separator.gif" alt="" width="4" height="6" /> 
						<a href="http://www.events.uts.edu.au/web/">What's on</a>
					</div>
					&copy; Copyright UTS - CRICOS Provider No: 00099F - 27 November 2008 10:34 AM<br />
					The page is authorised by Director, SSU - 
					Send comments to 
					<a href="mailto:sang-eun.oh@uts.edu.au">operations manager</a><br />
					<a href="http://www.uts.edu.au/disclaimer.html">Disclaimer</a> |
					<a href="http://www.uts.edu.au/privacy.html">Privacy</a> |
					<a href="http://www.uts.edu.au/copyright.html">Copyright</a> |
					<a href="http://www.uts.edu.au/accessibility.html">Accessibility</a> |
					<a href="http://www.gsu.uts.edu.au/policies/webpolicy.html">Web policy</a> |
					<a href="http://www.uts.edu.au/">UTS homepage</a>
				</div>
			</div>
			
		</div> -->
		
		
		
		
		
	</div> <!-- end main-container -->
	<div class="foot"></div>
</body>
</html>