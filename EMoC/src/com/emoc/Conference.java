package com.emoc;

public class Conference {
	 private int ConfID;
	 private String Name;
	 private String FromDate;
	 private String ToDate;
	 private String Time; 
	 private String Keywords;
	 private String Venue;
	 private String Description;
	 private int RegFees;
	 private int RegCount;
	 private String PhoneNo;
	 private String Email;
	 private String CreaterName;
	public Conference(int confID,String name, String fromDate, String toDate,
			String time, String keywords, String venue, String description,
			int regFees, int regCount, String phoneNo, String email,
			String createrName) {
		ConfID = confID;
		Name = name;
		FromDate = fromDate;
		ToDate = toDate;
		Time = time;
		Keywords = keywords;
		Venue = venue;
		Description = description;
		RegFees = regFees;
		RegCount = regCount;
		PhoneNo = phoneNo;
		Email = email;
		CreaterName = createrName;
	}
	public Conference(String name, String fromDate, String toDate,
			String time, String keywords, String venue, String description,
			int regFees, int regCount, String phoneNo, String email,
			String createrName) {
		Name = name;
		FromDate = fromDate;
		ToDate = toDate;
		Time = time;
		Keywords = keywords;
		Venue = venue;
		Description = description;
		RegFees = regFees;
		RegCount = regCount;
		PhoneNo = phoneNo;
		Email = email;
		CreaterName = createrName;
	}
	public int getID() {
		return ConfID;
	}
	public void setID(int id) {
		ConfID = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getFromDate() {
		return FromDate;
	}
	public void setFromDate(String fromDate) {
		FromDate = fromDate;
	}
	public String getToDate() {
		return ToDate;
	}
	public void setToDate(String toDate) {
		ToDate = toDate;
	}
	public String getTime() {
		return Time;
	}
	public void setTime(String time) {
		Time = time;
	}
	public String getKeywords() {
		return Keywords;
	}
	public void setKeywords(String keywords) {
		Keywords = keywords;
	}
	public String getVenue() {
		return Venue;
	}
	public void setVenue(String venue) {
		Venue = venue;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public int getRegFees() {
		return RegFees;
	}
	public void setRegFees(int regFees) {
		RegFees = regFees;
	}
	public int getRegCount() {
		return RegCount;
	}
	public void setRegCount(int regCount) {
		RegCount = regCount;
	}
	public String getPhoneNo() {
		return PhoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		PhoneNo = phoneNo;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getCreaterName() {
		return CreaterName;
	}
	public void setCreaterName(String createrName) {
		CreaterName = createrName;
	}
	@Override
	public boolean equals(Object arg0) {
		// TODO Auto-generated method stub
		return super.equals(arg0);
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return Name+"Created By: "+CreaterName;
	}
	 
	


	 

}
