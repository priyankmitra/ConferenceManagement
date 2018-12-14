package com.emoc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse res ) 
	{

		res.setContentType("text/html");

		PrintWriter out;
		
		try{
			out = res.getWriter();
		
		
		String userid = req.getParameter("anumber");
		String name = req.getParameter("name");
		String emailid = req.getParameter("email");
		String phoneno = req.getParameter("phone");
		int confid = Integer.parseInt(req.getParameter("eventId"));
		/*if(req.getParameter("eventId").isEmpty())
		{
			System.out.print("Conference is not Selected!");
			return;
		}*/
		String transactionid = req.getParameter("tid");
		
		DbManager db = new DbManager();
		Connection conn = db.getConnection();
		
		if(conn == null)
		{
			System.out.println("Failed");
			out.print("Failed<br>Error in Database Connection!");
		}
		else
		{
			String sql = "insert into Atendee values('"+userid+"','"+name+"','"+emailid+"','"+phoneno+"','"+confid+"','"+transactionid+"')";
			
			String sqlConf = "SELECT Name,RegCount from Conference where ConfID = '"+confid+"';";  //for email
			
			Statement stmt = null;
			try 
			{
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);  
			
				stmt = conn.createStatement();
				
				ResultSet rs = stmt.executeQuery(sqlConf);   //for email
				System.out.println("Updating Conference Registratoin count.");
				rs.next();
				String ConferenceName = rs.getString("Name");     //for email
				
				int c = rs.getInt("RegCount");
				c=c+1;
				
				String updateCount = "update Conference set RegCount = '"+c+"' where ConfID='"+confid+"';";
				stmt.executeUpdate(updateCount);
				
				out.println("<h1>Registered Successfully!</h1>");
				out.println("Click <a href='index.jsp'> here </a> to get back to Dashboard!");
				//req.setAttribute("emailTo", emailid);         //for email
				//req.setAttribute("ConferenceName", ConferenceName);    //for email
				
				//RequestDispatcher rd = req.getRequestDispatcher("mds");
				//rd.forward(req, res);
				/*try {
					res.sendRedirect("user.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					Syatem.out.println(e.getMessage();
				}*/
			} catch (Exception e) 
			{
				e.printStackTrace();
				System.out.println("Error: "+e.getMessage());
			
				out.println("<h2>Error: "+e.getMessage()+".<br>Try Again!</h2>");
			}
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}