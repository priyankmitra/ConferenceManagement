package com.emoc;

import java.util.Properties;
import java.util.logging.Level;

import javax.ejb.Stateless;
import javax.mail.Message;
import javax.mail.Session;
//import java.util.Map.Entry;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.istack.internal.logging.Logger;

@Stateless
public class MailSenderBean {

    public MailSenderBean() {
        // TODO Auto-generated constructor stub
    }

    public void sendEmail(String fromEmail, String username, String password, String toEmail, String Subject, String message)
    {
	    // Receiver Email Address this.receiverEmailID=receiverEmailID; 
	    // Subject this.emailSubject=Subject; 
	    // Body this.emailBody=Body;
	    try{
    	/* Gives Error for Import.
    	 * Properties props = new Properties(); 
	    props.put("mail.smtp.host", "smtp@gmail.com"); 
	    props.put("mail.smtp.port", "465"); 
	    props.put("mail.smtp.auth", "true"); 
	    props.put("mail.smtp.socketFactory.port", "465"); 
	    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
	    props.put("mail.smtp.socketFactory.fallback", "false");
	    Session mailSession = Session.getDefaultInstance(props, null); 
	    
	    Message mailMessage = new MimeMessage(mailSession);
	    mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail)); 
	    mailMessage.setContent(message,"text/html");
	    mailMessage.setFrom(new InternetAddress(fromEmail));
	    //mailMessage.setText(message);
	    mailMessage.setSubject(Subject);
	    
	    Transport transport = mailSession.getTransport("smtp");
	    		transport.connect("smtp@gmail.com",username,password);
	    transport.sendMessage(mailMessage,mailMessage.getAllRecipients()); 
	    */
	    System.out.println("Message send Successfully:)");
		}catch(Exception ex)
		    {
		    	Logger.getLogger(MailSenderBean.class.getName(), null).log(Level.SEVERE,null, ex);
		}
	}
}
