package com.emoc;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Modify extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse res ) 
	{
		

		res.setContentType("text/html");

		PrintWriter out = null;
		
		try
		{
			out = res.getWriter();
			
		}catch(Exception e)
		{
			System.out.print(e.getMessage());
		}
		
		try{
			
		int confid = Integer.parseInt(req.getParameter("cid")) ;
		String name = req.getParameter("ename");
		String fromdate = null, todate = null;
			fromdate = req.getParameter("fdate");
		    todate = req.getParameter("tdate");
		//String fromtime = req.getParameter("ftime");
		//String totime = req.getParameter("ttime");
		String keywords = req.getParameter("kwords");
		String venue = req.getParameter("venue");
		String description = req.getParameter("desc");
		String regfeesStr = req.getParameter("rfee");
		int regfees = 0;
		if(regfeesStr!=null){
		 regfees = Integer.parseInt(regfeesStr);
		}
		String orgemail = req.getParameter("oemail");
		String orgphone = req.getParameter("ophone");
		
		//String time = fromtime+"-"+totime;
		
		DbManager db = new DbManager();
		Connection conn = db.getConnection();
		
		if(conn == null)
		{
			System.out.println("Failed");
		}
		else
		{
			String sql = "update Conference set Name ='"+name+"',FromDate='"+fromdate+"',todate='"+todate+"',Keywords='"+keywords+"',Venue='"+venue+"',Description='"+description+"',RegFees='"+regfees+"',PhoneNo='"+orgphone+"',Email='"+orgemail+"' where ConfID = '"+confid+"';";
			
			Statement stmt = null;
			try 
			{
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);

				out.println("<h1>Conference Successfully Updated!</h1>");
				out.println("<a href='welcome.jsp'> Back To Dasboard </a>");
				
				// ConferenceList.conferenceList.add(new Conference(name, fromdate, todate, time, keywords, venue, description, regfees, regcount, orgphone, orgemail, creatorname));
				//System.out.print(ConferenceList.conferenceList.get(0).toString());
			} 
			catch (SQLException e) 
			{
				System.out.println("Error: "+e.getMessage());
				
				out.println("<h1>Modification Failed!</h1>");
				out.println("<h4>"+e.getMessage()+"</h4>");
			}
		}
	}catch(Exception e)
	{
		System.out.print(e.getMessage());
		out.println("<h1>Modification Failed!</h1>");
		out.println("<h4>"+e.getMessage()+"</h4>");
	}
	}
}