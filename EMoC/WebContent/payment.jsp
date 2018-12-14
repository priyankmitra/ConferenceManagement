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

connection = db.getConnection();
statement=connection.createStatement();

String id = request.getParameter("id");

String sql ="select RegFees from conference where ConfId = "+id+" ";
resultSet = statement.executeQuery(sql);
resultSet.next();

String fee = resultSet.getString("RegFees");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Scan and Pay</title>

<style>
body{
height: 100vh;
overflow: hidden;
width: 100%;
background: linear-gradient(#c150a0,#286ea1);
}
.pay{
	top: 0;
bottom: 0;
left: 0;
right: 0;
position: absolute;
margin: auto;
}
h1{
text-align: center;
padding-top: 5%;
font-size: 25px;
color: white;
}
p{
text-align: center;
color: white;
font-size:20px;
}
</style>
</head>
<body>
	<h1>Make payment to this qrcode and save the transaction id for further use</h1>
	<p>Total amount to be paid is <%=fee %> Rupees.</p>
	<img src="images/qrcode.jpeg" class="pay" width="200px">
</body>
</html>