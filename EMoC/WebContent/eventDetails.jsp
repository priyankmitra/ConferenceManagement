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
ResultSet resultSet1 = null;
String Id = request.getParameter("eventId");
%>
<!DOCTYPE html>

<html lang="en" class="no-touch"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

      <title>Events</title>

      <link rel="stylesheet" href="css/eventDetails/bootstrap.min.css">
      <!-- Template styles-->
      <link rel="stylesheet" href="css/eventDetails/style.css">
      <!-- Responsive styles-->


   <body class="vsc-initialized">
      <div class="body-inner">
         <!-- Header start -->
         <header id="header" class="header header-transparent">
            <div class="container">
               <div class="row">
                  <div class="navbar-header">
                     <div class="logo">
                        <a href="index.jsp">
                        <img src="./logo.png" alt="">
                        </a>
                     </div>
                     
                  <div class="site-nav-inner">
                     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                     <span class="sr-only">Toggle navigation</span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     </button>
                     <nav class="collapse navbar-collapse navbar-responsive-collapse pull-right">
                        <ul class="nav navbar-nav">
                           <li class="dropdown active">
                              <a href="index.jsp" class="dropdown-toggle" data-toggle="dropdown">Home <i class="fa fa-angle-down"></i></a>
                           </li>
                           <!-- Home li end -->

                        </ul>
                        <!--/ Nav ul end -->
                     </nav>
                     <!--/ Collapse end -->
                  </div>
                  <!--/ Site nav inner end -->
               </div>
               <!--/ Row end -->
            </div>
            <!--/ Container end -->
         </header>
         <!--/ Header end -->

         <section id="banner">
            <div class="banner-item bg-overlay" style="background-image:url(images/hero-area/bg-main.jpg)">
               <div class="container">
                  <div class="banner-content text-center">
                     <div class="banner-content-wrap">

					<%
					try{
						String Ide = request.getParameter("eventId");
					connection = db.getConnection();
					statement=connection.createStatement();
					resultSet = statement.executeQuery("select * from Conference where ConfID = '" + Ide + "' ");
					while(resultSet.next()){
					%>
					<h1 class="banner-title"><%=resultSet.getString("Name") %> </h1>
                        <h2 class="banner-subtitle"><%=resultSet.getString("FromDate") %></h2>
                        <h3 class="banner-desc"><%=resultSet.getString("Venue") %></h3>
                        <p class="banner-btn">
                           <a href="register.jsp?eventId=<%=Ide %>" class="btn btn-primary">Register Now</a>
                        </p>
					<%
					}
					} 
					catch (Exception e) 
					{
						e.printStackTrace();
					}
					%>
		                        

         <section id="ts-intro" class="ts-intro no-padding">
            <div class="container">
               <div class="row">
                  <div class="col-xs-12 col-sm-12 col-md-6">
                     <div class="gap-60"></div>
                     <h2 class="intro-title">About the Event</h2>
                     <%
					try{
						String Ide = request.getParameter("eventId");
					connection = db.getConnection();
					statement=connection.createStatement();
					resultSet = statement.executeQuery("select * from Conference where ConfID = '" + Ide + "' ");
					while(resultSet.next()){
					%>
					<blockquote><%=resultSet.getString("Description") %></blockquote>
					<%
					}
					} 
					catch (Exception e) 
					{
						System.out.println(e.getMessage());
					}
					%>
                  </div>
                  <!-- Col end -->
                  <div class="col-xs-12 col-sm-12 col-md-6">
                     <div class="intro-video">
                        <img class="img-responsive" src="./intro-video.jpg" alt="">
                        <a class="popup cboxElement" href="#">
                           <div class="video-icon">
                              <i class="fa fa-play"></i>
                           </div>
                        </a>
                     </div>
                     <!-- Intro video end -->
                  </div>
                  <!-- Col end -->
               </div>
               <!-- Content row 1 end -->
               <div class="gap-30"></div>
               <!-- Content Row 2 end -->
            </div>
            <!-- Container end -->
         </section>
         <!-- Intro area end -->

         

         <section id="ts-venue" class="ts-venue" style="background: linear-gradient(#ad8adc,#e26db1);">
            <div class="container">
               <div class="row text-center">
                  <h2 class="section-title">Where to find us</h2>
                  <h3 class="section-sub-title">Venue and Info</h3>
               </div>
               <!--/ Title row end -->
               <div class="row">
                  <div class="col-md-6">
                     <h3>Venue Details</h3>
                     <div class="contact-info">
                        <div class="contact-info-box">
                           <i class="fa fa-map-marker">&nbsp;</i>
                           <div class="contact-info-box-content">
                              <h4>Address: </h4>
                              
                              <%
					try
                  	{
					String Ide = request.getParameter("eventId");
					connection = db.getConnection();
					statement=connection.createStatement();
					resultSet = statement.executeQuery("select * from Conference where ConfID = '" + Ide + "' ");
					
					while(resultSet.next()){
					%>
					<p><%=resultSet.getString("Venue") %></p>
                           
					<%
					}
					} 
					catch (Exception e) 
					{
						System.out.println(e.getMessage());
					}
					%>
                         
                         </div>
                        </div>
                        <div class="contact-info-box">
                           <i class="fa fa-envelope-o">&nbsp;</i>
                           <div class="contact-info-box-content">
                           <%
					try
                    {
					String Ide = request.getParameter("eventId");
					ResultSet rs = statement.executeQuery("select * from Conference where ConfID = '" + Ide + "' ");
					rs.next();
					String crname = rs.getString("CreaterName");
					connection = db.getConnection();
					statement=connection.createStatement();
					resultSet = statement.executeQuery("select * from Organizer where UserName ='"+crname+"';");
					while(resultSet.next()){
					%>
					
					          <h4>Email: </h4>
                              <p><%=resultSet.getString("EmailID") %> </p>
                           </div>
                        </div>
                        <div class="contact-info-box">
                           <i class="fa fa-phone">&nbsp;</i>
                           <div class="contact-info-box-content">
                              <h4>Phone: </h4>
                              <p><%=resultSet.getString("PhoneNo") %> </p>
                           </div>
                        </div>     
					<%
					}
					} 
					catch (Exception e) 
					{
						System.out.println(e.getMessage());
					}
					%>
                              
                     </div>
                     <!-- contact info end -->
                  </div>
                  <!-- Col end -->
                  <div class="col-md-6">
                     <img src="./venue-img.jpg" alt="">
                  </div>
                  <!-- Col end -->
               </div>
               <!-- Content row 1 end -->
               <div class="gap-60"></div>
               <!-- Content row end -->
            </div>
            <!-- Container end -->
         </section>
         <!-- Venue end -->

      </div>
      <!-- Body inner end -->
</body></html>
