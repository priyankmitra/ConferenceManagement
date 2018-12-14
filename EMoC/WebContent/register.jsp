<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.emoc.*" %>
<%
DbManager db = new DbManager();
Connection conn = db.getConnection();
Statement statement = null;
ResultSet resultSet = null;
String Ide = request.getParameter("eventId");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<link href="css/register/style.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
	<div class="center-container">
		<div class="main">
			<h1 class="w3layouts_head">Event Registration Form</h1>
			<!---728x90--->
				<div class="w3layouts_main_grid">
					<form action="RegisterServlet" method="post" class="w3_form_post">
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Name </label>
								<input type="text" name="name" placeholder="Your Name" required="">
							</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Aadhaar number </label>
								<input type="number" name="anumber" placeholder="Your Aadhaar" required="">
							</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Email </label>
								<input type="email" name="email" placeholder="Your Email" required="">
							</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Phone Number </label>
								<input type="number" name="phone" placeholder="Phone Number" required="">
								</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Trasnsaction id </label>
							  <input type="number" name="tid" placeholder="Trasnsaction id" required="">
							</span>
						</div>
						
					<div class="w3_main_grid">
						<div class="w3_main_grid_right">
							<input type="submit" value="Submit">
							<input type="hidden" name="eventId" value='<%=Ide%>'>
						</div>
					</div>
					
				</form>
				<div>
							<div class="w3_main_grid_right" style="margin-top: 20px;">
								<a href="payment.jsp?id=<%=Ide %>" target="blank" style="cursor: pointer;"><button style = "cursor: pointer;padding: 9px;background-color: #cd31c1;outline: 0;border: 0;color: white;">Payment</button></a>
							</div>
						</div>
						<div >
						<div class="w3_main_grid_right" style="margin-top: 20px;">
							<a href="index.jsp"><button style = "float: right;margin-top: -36px;padding: 9px;background-color: #cd31c1;outline: 0;border: 0;color: white;">Home</button></a>
						</div>
					</div>
			</div>
		<!-- Calendar -->

		<!-- //Calendar -->
		<!---728x90--->

		</div>
	</div>
</body>
</html>