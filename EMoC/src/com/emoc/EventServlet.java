package com.emoc;

import java.io.PrintWriter;
import java.sql.*;
import java.text.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventServlet extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse res ) 
	{
		

		res.setContentType("text/html");

		PrintWriter out;
		
		try{
			out = res.getWriter();
		String name = req.getParameter("ename");
		String fromdate = null, todate = null;
			fromdate = req.getParameter("fdate");
		    todate = req.getParameter("tdate");
		String fromtime = req.getParameter("ftime");
		String totime = req.getParameter("ttime");
		String keywords = req.getParameter("kwords");
		String venue = req.getParameter("venue");
		String description = req.getParameter("desc");
		int regfees = Integer.parseInt(req.getParameter("rfee"));
		int regcount = 0 ;
		String orgemail = req.getParameter("oemail");
		String orgphone = req.getParameter("ophone");
		String creatorname = req.getParameter("uname");
		
		String time = fromtime+"-"+totime;
		
		DbManager db = new DbManager();
		Connection conn = db.getConnection();
		
		if(conn == null)
		{
			System.out.println("Failed");
		}
		else
		{
			String sql = "insert into Conference(Name,FromDate,ToDate,Time,Keywords,Venue,Description,RegFees,RegCount, PhoneNo, Email, CreaterName) values('"+name+"','"+fromdate+"','"+todate+"','"+time+"','"+keywords+"','"+venue+"','"+description+"','"+regfees+"','"+regcount+"','"+orgphone+"','"+orgemail+"','"+creatorname+"')";
			
			Statement stmt = null;
			try 
			{
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);

				out.println("<h1>New Conference Created Successfully!</h1>");
				out.println("Click <a href='index.jsp'> here </a> to get back to home!");
				
				// ConferenceList.conferenceList.add(new Conference(name, fromdate, todate, time, keywords, venue, description, regfees, regcount, orgphone, orgemail, creatorname));
				//System.out.print(ConferenceList.conferenceList.get(0).toString());
			} catch (SQLException e) 
			{
				System.out.println(e.getMessage());

				out.println("<h1>Creation Failed!</h1>");
				out.println("<h4>"+e.getMessage()+"</h4>");
			}
		}
	}catch(Exception e)
	{
		System.out.print(e.getMessage());
		}
	}
}