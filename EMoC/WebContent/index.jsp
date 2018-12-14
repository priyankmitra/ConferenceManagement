<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.emoc.*" %>
<%@page import="java.util.*" %>
<%
String flag = "start";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/basic-template8.css" rel="stylesheet">
<link href="css/wb14_basic8.css" rel="stylesheet">
<title>Home</title>
</head>
<body>
	<div id="wb_header">
      <div id="header">
         <div class="row">
            <div class="col-1">
               <div id="wb_ThemeableMenu1" style="display:inline-block;width:100%;z-index:1000;">
                  <div id="ThemeableMenu1" class="ThemeableMenu1" style="width:100%;height:auto !important;">
                     <div class="container">
                        <a id="ThemeableMenu1-logo" href="#"><img alt="" title="" src="images/logo.png"></a>
                        <div class="navbar-header">
                           <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".ThemeableMenu1-navbar-collapse">
                              <span class="icon-bar"></span>
                              <span class="icon-bar"></span>
                              <span class="icon-bar"></span>
                           </button>
                        </div>
                        <div class="ThemeableMenu1-navbar-collapse collapse">
                           <ul class="nav navbar-nav">
                              <li class="">
                                 <a href="#about">EMoC</a>
                              </li>
                              <li class="">
                                 <a href="#galleryGrid">Timeline</a>
                              </li>
                              <li class="">
                                 <a href="signin.jsp">Sign In</a>
                              </li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div id="wb_LayoutGrid1">
      <div id="LayoutGrid1">
         <div class="row">
            <div class="col-1">
            </div>
         </div>
      </div>
   </div>
   <div id="wb_about">
      <div id="about">
         <div class="row">
            <div class="col-1">
               <div id="wb_Carousel1" style="">
                  <div id="Carousel1" class="carousel slide">
                     <ol class="carousel-indicators">
                        <li data-target="#Carousel1" data-slide-to="0" class="active"></li>
                        <li data-target="#Carousel1" data-slide-to="1"></li>
                        <li data-target="#Carousel1" data-slide-to="2"></li>
                     </ol>
                     <div class="carousel-inner">
                        <div class="item active" style="background-image: url(images/manage.jpg);background-position: center;background-size: cover;">
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-2">
               <div id="wb_Text4">
                  <span style="color:#000000;font-family:Arial;font-size:27px;line-height:32px;"><strong>What our software do?</strong></span><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"><br><br>As many students and learner required to view the details of the scheduled conference to gain knowledge from them. This web application will support some aspects of the conference organization process. This includes:<br><br>Registration handling of the conference participants<br>Presenting conference timeline to users.<br><br>Conference Organizers can mail at softwarehandler@emoc.com for creating and displaying their conference.</span>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div id="wb_galleryGrid">
      <div id="galleryGrid">
         <div class="row">
            <div class="col-1">
               <div id="wb_Heading1" style="display:inline-block;width:100%;text-align:center;z-index:10;">
                  <h1 id="Heading1">Conferences Timeline</h1>
                  
                    <form action="index.jsp?sort=Popular" style="float: right;">
					<input type="submit" name="sort" value="Popular">
					</form>
					
					<form action="index.jsp?sort=Recent" style="float: right;">
					<input type="submit" name="sort" value="Recent">
					</form>
					
					<%
						try
						{
							flag = request.getParameter("sort");
							// For Synchronizing List with Database.
					    	new ConferenceList(flag);
						}
						catch(Exception e)
						{
							System.out.println(e.getMessage());
					}
					%>
					
					<h6 style="float: right;">Sort By: </h6>
               </div>
               <div id="wb_gallery" style="display:inline-block;width:100%;z-index:11;">
                  <div id="gallery">
                     <div class="thumbnails">
                     <%
                     Iterator<Conference> list = (ConferenceList.conferenceList).iterator();
             		while(list.hasNext())
             		 {
             			Conference obj = list.next();
             			System.out.println("About to print: "+obj);
             		 %>
         					<figure class="thumbnail">
                                    <a href="images/event.jpg" style="width: 40%" data-rel="" title="Photo Number 1"><img style="width:60%; margin:0 auto;" alt="Photo Number 1" src="images/event.jpeg" title="Photo Number 1"></a>
                                    <figcaption style="width: 60%;" class="caption"><h2><%=obj.getName()%></h2><p><b><%=obj.getFromDate()%></b></p><p><i><%=obj.getVenue() %></i></p><div class="description"><%=obj.getDescription()%></div>
                                    <form action="eventDetails.jsp" type="submit" method="GET">
                                    <input type="hidden" name="eventId" value='<%=obj.getID()%>'>
                                    <input type="submit" value="view more" style = "float: left;margin-top: 16px; padding: 9px;background-color: #cd31c1;outline: 0;border: 0;color: white;">
                                    </form>
                                    </figcaption>
                             </figure>
         					<%}%>
                        <div class="clearfix visible-col4"></div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
 
   <div id="wb_footer">
      <div id="footer">
         <div class="row">
            <div class="col-1">
               <div id="wb_Text6">
                  <span style="color:#FFFFFF;">Copyright © EMOC 2018</span>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>