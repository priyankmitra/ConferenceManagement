<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
    <%@page import="com.emoc.*" %>
    <%@page import="java.io.*" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
    
    
<%
SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");

Date date = new Date(); 
String strDate= formatter.format(date);
strDate = "2018-12-13";
DbManager db = new DbManager();
Connection connection = db.getConnection();
Statement statement = null;
ResultSet resultSet = null;
String name = request.getParameter("name");  
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Event</title>
<link href="css/register/style.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
	<div class="center-container">
		<div class="main">
			<h1 class="w3layouts_head">Conference Registration Form</h1>
			<!---728x90--->

				<div class="w3layouts_main_grid">
					<form action="EventServlet" method="post" class="w3_form_post">
					<input type="hidden" value="<%=name%>" name="uname">
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Conference Name </label>
								<input type="text" name="ename" placeholder="Conference Name" required="">
							</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Email ID </label>
								<input type="email" name="oemail" placeholder="Email Address" required="">
							</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Phone Number </label>
								<input type="number" name="ophone" placeholder="Phone Number" required="">
								</span>
						</div>
						<div class="agileits_w3layouts_main_grid w3ls_main_grid">
							<span class="agileinfo_grid">
								<label>From Date </label>
								<div class="agileits_w3layouts_main_gridl">
									<input class="date hasDatepicker" id="datepicker" name="fdate" type="date" value="yyyy/mm/dd" min="<%=strDate%>" onfocus="this.value = &#39;&#39;;" onblur="if (this.value == &#39;&#39;) {this.value = &#39;&#39;;}" required="">
								</div>
								
									<div class="clear"> </div>
							</span>
						</div>
						<div class="agileits_w3layouts_main_grid w3ls_main_grid">
							<span class="agileinfo_grid">
								<label>To Date </label>
								<div class="agileits_w3layouts_main_gridl">
									<input class="date hasDatepicker" id="datepicker" name="tdate" type="date" value="yyyy/mm/dd" min="<%=strDate%>" onfocus="this.value = &#39;&#39;;" onblur="if (this.value == &#39;&#39;) {this.value = &#39;&#39;;}" required="">
								</div>
								
									<div class="clear"> </div>
							</span>
						</div>
						
						<div class="agileits_w3layouts_main_grid w3ls_main_grid">
							<span class="agileinfo_grid">
								<label>From Time </label>
								<div class="agileits_w3layouts_main_gridr">
									<input type="time" name="ftime" placeholder=" " required="">
								</div>
									<div class="clear"> </div>
							</span>
						</div>
						<div class="agileits_w3layouts_main_grid w3ls_main_grid">
							<span class="agileinfo_grid">
								<label>To Time </label>
								<div class="agileits_w3layouts_main_gridr">
									<input type="time" name="ttime" placeholder=" " required="">
								</div>
									<div class="clear"> </div>
							</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Keyword </label>
								<input type="text" name="kwords" placeholder="keyword" required="">
								</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Venue </label>
								<input type="text" name="venue" placeholder="Venue" required="">
								</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Description </label>
								<input type="text" name="desc" placeholder="Description" required="">
								</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Fee </label>
								<input type="number" name="rfee" placeholder="Fee" required="">
								</span>
						</div>
					<div class="w3_main_grid">
						<div class="w3_main_grid_right">
							<input type="submit" value="Submit">
						</div>
					</div>
					<div >
						<div class="w3_main_grid_right">
							<a href="welcome.jsp"><button style = "float: right;margin-top: -36px;padding: 9px;background-color: #cd31c1;outline: 0;border: 0;color: white;">Return to Dashboard</button></a>
						</div>
					</div>
				</form>
					
			</div>
		</div>
	</div>
</body>
</html>