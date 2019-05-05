package com.util;

import java.util.Date;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
 
public class MailUtils {
	public static void main(String[] args) {
		try {
			MailUtils.sendMail("12990560@student.uts.edu.au", "647�������Ķ�Ha");
			System.out.println("Success");
		} catch (Exception e) {
			System.out.println("mail error");
			e.printStackTrace();
		}
	}
	    public static void sendMail(String email, String emailMsg)
	    		throws Exception {
	    	// �����˵� ���� �� ���루�滻Ϊ�Լ�����������룩
	        // PS: ĳЩ���������Ϊ���������䱾������İ�ȫ�ԣ��� SMTP �ͻ��������˶������루�е������Ϊ����Ȩ�롱��, 
	        //     ���ڿ����˶������������, ����������������ʹ������������루��Ȩ�룩��
	       String myEmailAccount = "SESUTSHelps@gmail.com";
	       String myEmailPassword = "UTSHelps999";
 
	        // ����������� SMTP ��������ַ, ����׼ȷ, ��ͬ�ʼ���������ַ��ͬ, һ��(ֻ��һ��, ���Ǿ���)��ʽΪ: smtp.xxx.com
	        // ����163����� SMTP ��������ַΪ: smtp.163.com
	       String myEmailSMTPHost = "smtp.gmail.com";
 
	        // �ռ������䣨�滻Ϊ�Լ�֪������Ч���䣩
	       String receiveMailAccount = email;
	       // 1. ������������, ���������ʼ��������Ĳ�������
	        Properties props = new Properties();                    // ��������
	        props.setProperty("mail.transport.protocol", "smtp");   // ʹ�õ�Э�飨JavaMail�淶Ҫ��
	        props.setProperty("mail.smtp.host", myEmailSMTPHost);   // �����˵������ SMTP ��������ַ
	        props.setProperty("mail.smtp.auth", "true");            // ��Ҫ������֤
	        props.put("mail.smtp.starttls.enable", "true");
 
	        // 2. �������ô����Ự����, ���ں��ʼ�����������
	        Session session = Session.getDefaultInstance(props);
	        session.setDebug(true);                                 // ����Ϊdebugģʽ, ���Բ鿴��ϸ�ķ��� log
 
	        // 3. ����һ���ʼ�
	        MimeMessage message = createMimeMessage(session, myEmailAccount, receiveMailAccount,emailMsg);
 
	        // 4. ���� Session ��ȡ�ʼ��������
	        Transport transport = session.getTransport();
 
	        // 5. ʹ�� �����˺� �� ���� �����ʼ�������, ������֤����������� message �еķ���������һ��, ���򱨴�
	        // 
	        //    PS_01: �ɰܵ��жϹؼ��ڴ�һ��, ������ӷ�����ʧ��, �����ڿ���̨�����Ӧʧ��ԭ��� log,
	        //           ��ϸ�鿴ʧ��ԭ��, ��Щ����������᷵�ش������鿴�������͵�����, ���ݸ����Ĵ���
	        //           ���͵���Ӧ�ʼ��������İ�����վ�ϲ鿴����ʧ��ԭ��
	        //
	        //    PS_02: ����ʧ�ܵ�ԭ��ͨ��Ϊ���¼���, ��ϸ������:
	        //           (1) ����û�п��� SMTP ����;
	        //           (2) �����������, ����ĳЩ���俪���˶�������;
	        //           (3) ���������Ҫ�����Ҫʹ�� SSL ��ȫ����;
	        //           (4) �������Ƶ��������ԭ��, ���ʼ��������ܾ�����;
	        //           (5) ������ϼ��㶼ȷ������, ���ʼ���������վ���Ұ�����
	        //
	        //    PS_03: ��ϸ��log, ���濴log, ����log, ����ԭ����log��˵����
	        transport.connect(myEmailAccount, myEmailPassword);
 
	        // 6. �����ʼ�, �������е��ռ���ַ, message.getAllRecipients() ��ȡ�������ڴ����ʼ�����ʱ��ӵ������ռ���, ������, ������
	        transport.sendMessage(message, message.getAllRecipients());
 
	        // 7. �ر�����
	        transport.close();
	}
	    /**
	     * ����һ��ֻ�����ı��ļ��ʼ�
	     *
	     * @param session �ͷ����������ĻỰ
	     * @param sendMail ����������
	     * @param receiveMail �ռ�������
	     * @return
	     * @throws Exception
	     */
	    public static MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail, String emailMsg) throws Exception {
	        // 1. ����һ���ʼ�
	        MimeMessage message = new MimeMessage(session);

	        // 2. From: ������
	        message.setFrom(new InternetAddress(sendMail, "Send", "UTF-8"));
 
	        // 3. To: �ռ��ˣ��������Ӷ���ռ��ˡ����͡����ͣ�
	        Address[] ccAdresses = new InternetAddress[1];
	        ccAdresses[0] = new InternetAddress(receiveMail, "Receive", "UTF-8");
	        message.addRecipients(MimeMessage.RecipientType.TO, ccAdresses);
	        //message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "Receive", "UTF-8"));
 
	        // 4. Subject: �ʼ�����
	        message.setSubject("SES2A UTSHelps Booking System", "UTF-8");
 
	        // 5. Content: �ʼ����ģ�����ʹ��html��ǩ��
	        message.setContent(emailMsg, "text/html;charset=UTF-8");
 
	        // 6. ���÷���ʱ��
	        message.setSentDate(new Date());
 
	        // 7. ��������
	        message.saveChanges();
 
	        return message;
	    }
}
