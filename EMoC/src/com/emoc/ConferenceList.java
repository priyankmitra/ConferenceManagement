package com.emoc;


import java.util.ArrayList;
import java.sql.*;

public class ConferenceList {
	public static ArrayList<Conference> conferenceList = new ArrayList<>();
	
	public ConferenceList(String sortType)
	{
		try
		{
			conferenceList = new ArrayList<>();
			DbManager db = new DbManager();
			Connection conn = db.getConnection();
			String sql = null;
			switch(sortType){
			case "Popular": 
				sql = "select * from conference order by RegCount desc;";
				break;
			case "Recent": 
				sql = "select * from conference where FromDate>curdate() order by FromDate;";
				break;
			case "start":
				sql = "select * from conference;";
				break;
			default:
				sql = "select * from conference;";
			}
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				conferenceList.add(
						new Conference(
								rs.getInt("ConfID"),
								rs.getString("Name"),
								rs.getString("FromDate"),
								rs.getString("ToDate"),
								rs.getString("Time"),
								rs.getString("Keywords"),
								rs.getString("Venue"),
								rs.getString("Description"),
								rs.getInt("RegFees"),
								rs.getInt("RegCount"),
								rs.getString("PhoneNo"),
								rs.getString("Email"),
								rs.getString("CreaterName")
						));
			}
			
		}
		catch(Exception e)
		{
			System.out.print("Default Run!");
			new ConferenceList("start");
		}
	}
}
