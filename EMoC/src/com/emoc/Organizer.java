package com.emoc;

// Software Handler
public class Organizer {
	private String UserName;
	private String Name;
	private String EmailID;
	private String PhoneNo;
	private String Password;
	
	public Organizer(String userName, String name, String emailID,
			String phoneNo, String password) {
		super();
		UserName = userName;
		Name = name;
		EmailID = emailID;
		PhoneNo = phoneNo;
		Password = password;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getEmailID() {
		return EmailID;
	}

	public void setEmailID(String emailID) {
		EmailID = emailID;
	}

	public String getPhoneNo() {
		return PhoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		PhoneNo = phoneNo;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	@Override
	public String toString() {
		return "Organizer [UserName=" + UserName + ", Name=" + Name
				+ ", EmailID=" + EmailID + ", PhoneNo=" + PhoneNo
				+ ", Password=" + Password + "]";
	}
	
}
