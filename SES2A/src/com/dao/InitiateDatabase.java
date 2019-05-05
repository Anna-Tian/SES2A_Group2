package com.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.bean.Message;
import com.dao.MessageDatabase;
import com.util.HibernateUtil;

public final class InitiateDatabase {

	//THIS FUNCTION IS SUPPOSED TO BE EXECUTED ONLY ONCE FOR THE ENTIRE PROJECT
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//Creates 12 rows of data in message table
		/*Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		String sql = "INSERT INTO message (messageLocation, messageDetailed, messageTempDetailed) " +
		        "VALUES (NULL, NULL, NULL)";
		for(int i=0; i < 12; i++){
			session.createSQLQuery(sql).executeUpdate();
		}
		transaction.commit();*/
		
		Message message1 = MessageDatabase.getCurrentMessage(1);
		message1.setMessageLocation("message1.jsp");
		message1.setMessageDetailed("message1");
		MessageDatabase.updateMessage(message1);
		Message message2 = MessageDatabase.getCurrentMessage(2);
		message2.setMessageLocation("message2.jsp");
		message2.setMessageDetailed("message2");
		MessageDatabase.updateMessage(message2);
		Message message3 = MessageDatabase.getCurrentMessage(3);
		message3.setMessageLocation("stu_login.jsp");
		message3.setMessageDetailed("message3");
		MessageDatabase.updateMessage(message3);
		Message message4 = MessageDatabase.getCurrentMessage(4);
		message4.setMessageLocation("WR_Step1.jsp");
		message4.setMessageDetailed("<h3>"+
					"<strong>Important information:</strong>"+
				"</h3>"+
				"<ul>"+
					"<li>"+
						"<p>"+
							"<strong>Follow </strong>each step to complete your booking"+
						"</p>"+
					"</li>"+
					"<li>"+
						"<p>"+
							"<strong>Check </strong>the time to ensure "+
								"that there is no timetable clash"+
						"</p>"+
					"</li>"+
					"<li>"+
						"<p>"+
							"<strong>Check your email</strong> (UTS&nbsp;email address) for the booking confirmation"+
						"</p>"+
					"</li><li>"+
					
						"<p>"+
							"<strong>Cancel, </strong>if no longer available, <strong>24 "+
								"hours before </strong>the scheduled session by clicking on '<strong>My "+
								"Booking</strong>' tab and then the '<strong>detail</strong>' link"+
						"</p>"+
					"</li>"+
					"<li>"+
						"<p>Please know that failing to turn up for your registered "+
							"workshop is not fair to those on the waiting list. Repeat "+
							"offenders (2 no-shows) may be barred from registering for "+
							"workshops.</p>"+
					"</li>"+
				"</ul>"+
				"<p>&nbsp;</p>"+
				"<p>"+
					"<strong>Registration is now open for 2019 Autumn "+
						"workshops!&nbsp;</strong>"+
				"</p>"+
				"<p>"+
					"<strong>At this stage, we only open registration for March "+
						"and April workshops. For the remaining workshops, registration "+
						"will be open in week 5.&nbsp;</strong>"+
				"</p>"+
				"<p>&nbsp;</p>"+
				"<h2>Step 1:</h2>"+
				"<p>"+
					"<strong>To start the booking process, please click on the "+
						"skill-set that you want to improve.</strong>"+
				"</p>"+
				"<p>&nbsp;</p>");
		MessageDatabase.updateMessage(message4);
		Message message5 = MessageDatabase.getCurrentMessage(5);
		message5.setMessageLocation("my_information.jsp");
		message5.setMessageDetailed("<p>This page displays your profile. Please update it whenever necessary (especially your contact details).</p>"+
					"<p>Questions marked with an asterisk (*) are compulsory.</p>"+
					"<p>&nbsp;</p>");
		MessageDatabase.updateMessage(message5);
		Message message6 = MessageDatabase.getCurrentMessage(6);
		message6.setMessageLocation("my_information.jsp");
		message6.setMessageDetailed("<p>"+
				"The collected information (after removing any of your personal details) may also be used to:</p>"+
				"<ul>"+
					"<li>analyse demographics of HELPS students and the use of HELPS programs in order to find better ways to assist you; and/or,</li>" +
					"<li>report to the University community on how HELPS programs are utilised</li>" +
				"</ul>" +
				"<p>"+
					"Please be advised that any information you provide:</p>"+
				"<ul>"+
					"<li>"+
						"will be kept in the system for the purposes outlined above; and</li>"+
					"<li>"+
						"will not be disclosed unless required or permitted by law.</li>"+
				"</ul>");
		MessageDatabase.updateMessage(message6);
		Message message7 = MessageDatabase.getCurrentMessage(7);
		message7.setMessageLocation("stu_login.jsp");
		message7.setMessageDetailed("message7");
		MessageDatabase.updateMessage(message7);
		Message message8 = MessageDatabase.getCurrentMessage(8);
		message8.setMessageLocation("stu_login.jsp");
		message8.setMessageDetailed("message8");
		MessageDatabase.updateMessage(message8);
		Message message9 = MessageDatabase.getCurrentMessage(9);
		message9.setMessageLocation("stu_login.jsp");
		message9.setMessageDetailed("message9");
		MessageDatabase.updateMessage(message9);
		Message message10 = MessageDatabase.getCurrentMessage(10);
		message10.setMessageLocation("stu_login.jsp");
		message10.setMessageDetailed("<h1>Welcome to HELPS booking system.</h1>"+ 
					"<p>&nbsp;</p>"+
					"<h2>Logon to register for HELPS Programs.</h2>"+
					"<p>Registration is now open for 2019 Autumn workshops!&nbsp;</p>"+
					"<p>At this stage, we only open registration for March and April"+
						" workshops. For the remaining workshops, registration will be open in week 5.&nbsp;</p>");
		MessageDatabase.updateMessage(message10);
		Message message11 = MessageDatabase.getCurrentMessage(11);
		message11.setMessageLocation("stu_login.jsp");
		message11.setMessageDetailed("<ul>"+
						"<li>HELPS "+
								"home and contact details</li>"+
						"<li>IT "+
								"Help desk if you have login issues</a></li>"+
						"<li>Like us "+
								"on <strong>Facebook</strong> to keep up with "+
								"what's&nbsp;happening&nbsp;at HELPS"+
						"</li></ul>"+ 
						"<p>&nbsp;</p>");
		/*message11.setMessageDetailed("<ul>"+
				"<li><a href=\"http://www.ssu.uts.edu.au/helps/about.html\">HELPS"+
						"home and contact details</a></li>"+
				"<li><a href=\"https://servicedesk.uts.edu.au/CAisd/pdmweb.exe\">IT"+
						"Help desk if you have login issues</a></li>"+
				"<li><a href=\"https://www.facebook.com/UTSHELPS\">Like us"+
						"on <strong>Facebook</strong> to keep up with"+
						"what's&nbsp;happening&nbsp;at HELPS"+
				"</a></li></ul>"+ 
				"<p>&nbsp;</p>");*/
		MessageDatabase.updateMessage(message11);
		Message message12 = MessageDatabase.getCurrentMessage(12);
		message12.setMessageLocation("message12.jsp");
		message12.setMessageDetailed("message12");
		MessageDatabase.updateMessage(message12);
	}
}
