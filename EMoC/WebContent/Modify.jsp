<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="com.emoc.*" %>
<%
DbManager db = new DbManager();
Connection connection = db.getConnection();
Statement statement = null;
ResultSet resultSet = null;
String eid = request.getParameter("eventId");

connection = db.getConnection();
statement=connection.createStatement();
String sql ="select * from conference where ConfID = "+eid+" ";
resultSet = statement.executeQuery(sql);
resultSet.next();

String name = resultSet.getString("Name");
String key = resultSet.getString("Keywords");
String venue = resultSet.getString("Venue");
String de = resultSet.getString("Description");
String mail = resultSet.getString("Email");
String phone = resultSet.getString("PhoneNo");
String fdate = resultSet.getString("FromDate");
String tdate = resultSet.getString("ToDate");
String fee = resultSet.getString("RegFees");

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modify Conference</title>
<link href="css/register/style.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
	<div class="center-container">
		<div class="main">
			<h1 class="w3layouts_head">Conference Modification Form</h1>

				<div class="w3layouts_main_grid">
					<form action="Modify" method="post" class="w3_form_post">
					<input type='hidden' value = '<%=eid%>' name = 'cid'>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Conference Name </label>
								<input type="text" name="ename" placeholder="Conference Name"  value="<%=name%>">
							</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Email ID </label>
								<input type="email" name="oemail" placeholder="Email Address"  value="<%=mail%>">
							</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Phone Number </label>
								<input type="number" name="ophone" placeholder="Phone Number" value="<%=phone%>" >
								</span>
						</div>
						<div class="agileits_w3layouts_main_grid w3ls_main_grid">
							<span class="agileinfo_grid">
								<label>From Date </label>
								<div class="agileits_w3layouts_main_gridl">
									<input class="date hasDatepicker" id="datepicker" name="fdate" type="date" value="<%=fdate %>" onfocus="this.value = &#39;&#39;;" onblur="if (this.value == &#39;&#39;) {this.value = &#39;&#39;;}" >
								</div>
								
									<div class="clear"> </div>
							</span>
						</div>
						<div class="agileits_w3layouts_main_grid w3ls_main_grid">
							<span class="agileinfo_grid">
								<label>To Date </label>
								<div class="agileits_w3layouts_main_gridl">
									<input class="date hasDatepicker" id="datepicker" name="tdate" type="date" value="<%=tdate %>" onfocus="this.value = &#39;&#39;;" onblur="if (this.value == &#39;&#39;) {this.value = &#39;&#39;;}" >
								</div>
								
									<div class="clear"> </div>
							</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Keyword </label>
								<input type="text" name="kwords" placeholder="keyword"   value="<%=key%>">
								</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Venue </label>
								<input type="text" name="venue" placeholder="Venue"  value="<%=venue%>">
								</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Description </label>
								<input type="text" name="desc" placeholder="Description"  value="<%=de%>">
								</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label>Fee </label>
								<input type="number" name="rfee" placeholder="Fee" value="<%=fee %>" >
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