package com.emoc;

public class Atendee {
	private String UserID;
	private String Name;
	private String EmailID;
	private String PhoneNo;
	private int ConfID;
	private String TransactionID;
	
	// Constructor
	public Atendee(String userID, String name, String emailID, String phoneNo,
			int confID, String transactionID) {
		super();
		UserID = userID;
		Name = name;
		EmailID = emailID;
		PhoneNo = phoneNo;
		ConfID = confID;
		TransactionID = transactionID;
	}
	
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
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
	public int getConfID() {
		return ConfID;
	}
	public void setConfID(int confID) {
		ConfID = confID;
	}
	public String getTransactionID() {
		return TransactionID;
	}
	public void setTransactionID(String transactionID) {
		TransactionID = transactionID;
	}

	@Override
	public String toString() {
		return "Atendee [UserID=" + UserID + ", Name=" + Name + ", EmailID="
				+ EmailID + ", PhoneNo=" + PhoneNo + ", ConfID=" + ConfID
				+ ", TransactionID=" + TransactionID + "]";
	}
}
