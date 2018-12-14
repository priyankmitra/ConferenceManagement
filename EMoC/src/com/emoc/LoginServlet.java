package com.emoc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet{
	public void service(HttpServletRequest req, HttpServletResponse res ) 
	{
		String name = req.getParameter("email");
		String password = req.getParameter("pass");
		
		DbManager db = new DbManager();
		Connection conn = db.getConnection();
		
		if(conn == null)
		{
			System.out.println("Failed");
		}
		else
		{
			String sql = "select * from organizer where EmailID=? and Password=?";

			if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals(""))))
			{
				try{
					PreparedStatement ps = null;
					ResultSet rs = null;
					ps = conn.prepareStatement(sql);
					ps.setString(1, name);
					ps.setString(2, password);
					rs = ps.executeQuery();
					if(rs.next())
					{ 
						String userdbName = rs.getString("EmailID");
						String userdbPsw = rs.getString("Password");

						if(name.equals(userdbName) && password.equals(userdbPsw))
						{
						//	session.setAttribute("name",userdbName);
							res.sendRedirect("welcome.jsp?email="+userdbName); 
						}
					}
					else
					{
						res.sendRedirect("signin.jsp");
						System.out.println("Error in Login Process");
					}
					rs.close();
					ps.close();
				}
				catch(SQLException | IOException sqe)
				{	
					System.out.println(sqe.getMessage());
				}
			}
			else
			{
				System.out.println("Fill all fields");
			}
		}
	}
}