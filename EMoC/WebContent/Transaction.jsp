<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.emoc.*"%>
<%
DbManager db = new DbManager();
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Scan and Pay</title>
</head>
<body>
	<form action="Transaction.jsp">
	<input type="text" name="file">
	<input type="submit" value="submit">
	</form>
	
	<%
	try{
		String file = request.getParameter("file");

		connection = db.getConnection();
		statement=connection.createStatement();

		String sql ="LOAD DATA INFILE '"+file+"' INTO TABLE TransactionId LINES TERMINATED BY '\n'IGNORE 1 ROWS";
		statement.executeUpdate(sql);

		sql = "select * from atendee,TransactionId where atendee.TransactionID=TransactionId.TransactionID";
		statement.executeQuery(sql);
		
	while(resultSet.next()){
	%>
	<p><%=resultSet.getString("Name") %></p>
	<p><%=resultSet.getString("EmailID") %></p>
	<p><%=resultSet.getString("PhoneNo") %></p>
		
	<%
	}
	} 
	catch (Exception e) 
	{
		System.out.println(e.getMessage());
	}
	%>
	
</body>
</html>