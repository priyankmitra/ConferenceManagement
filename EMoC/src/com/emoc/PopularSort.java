package com.emoc;

import java.util.ArrayList;
import java.util.Collections;
import java.util.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PopularSort extends HttpServlet{
	
	public void service(HttpServletRequest req, HttpServletResponse res ) 
	{

		try{
			
		String sorttype = req.getParameter("sortPopular");   // value is popular
	
		// For Synchronizing List with Database.
		new ConferenceList("sortPopular");
		/*
		Collections.sort(list,new Comparator<Conference>()
		{
			public int compare(Conference c1,Conference c2)
			{
				if(c1.getRegCount() > c2.getRegCount())
				{
					return 1;
				}else {
					return -1;
				}
			}
		});
		*/
		
		/*PrintWriter out = res.getWriter();
		
		Iterator<Conference> listIterator = list.iterator();
		 
		while(listIterator.hasNext())
		 {
			 System.out.println("Conference: "+listIterator.next());
			 
		 }*/
	
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
}
