package com.emoc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MailDispatcherServlet extends HttpServlet 
{

	private MailSenderBean mailSender;
	
	public void service(HttpServletRequest req, HttpServletResponse res )
	{ 
		res.setContentType("text/html;charset=UTF-8");
		
		try 
		{
			PrintWriter out = res.getWriter();
			
			String emailTo = (String)req.getAttribute("emailTo");
			String conferenceName = (String)req.getAttribute("ConferenceName");
		
			 String senderEmailID = Constants.senderEmail;
			 String senderPassword = Constants.password;
			 String emailSMTPserver = "smtp.gmail.com"; 
			 final String emailServerPort = "465";
			 String receiverEmailID = emailTo; 
			 String emailSubject = "Confirmation Mail for "+conferenceName+" Conference."; 
			 String emailBody = "Hi, Thank you for registering for "+conferenceName+" Conference. Congratulations, You have registered successfully! Don't forgot to join us on ocassion. For more information or any questions visit conference page for contacts."; 
			 
			 mailSender.sendEmail(senderEmailID, Constants.userName, senderPassword, receiverEmailID, emailSubject, emailBody);
			 
			/* Confirmation on Screen! */
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Mail Status</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Mail Status ! :)</h1>");
			out.println("<b>Mail Sent Successfully! <br>Congratulations, You have registered for conference.</b>");
			out.println("Click <a herf='index.jsp'>here</a> to get back to home screen.");
			out.println("</body>");
			out.println("/html");
		
		} 
		catch (Exception e) 
		{
			System.out.println(e.getMessage());
		}
		
	}

}
