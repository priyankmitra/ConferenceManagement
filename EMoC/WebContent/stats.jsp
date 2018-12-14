<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.emoc.*"%>
<%
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String count=null;
String popular=null;
String lpopular=null;
String key =null;
String average=null;
DbManager db = new DbManager();
try{
	
connection = db.getConnection();
statement=connection.createStatement();

// count number of events
String sql ="select count(ConfID) from conference";
resultSet = statement.executeQuery(sql);
resultSet.next();
count = resultSet.getString("count(ConfID)");

// most popular event and keyword
sql ="select Name,RegCount,keywords from conference order by RegCount DESC";
resultSet = statement.executeQuery(sql);
resultSet.next();
popular = resultSet.getString("Name");
key = resultSet.getString("Keywords");

//least popular event
sql ="select Name,RegCount from conference order by RegCount ASC";
resultSet = statement.executeQuery(sql);
resultSet.next();
lpopular = resultSet.getString("Name");

// avrage participent
sql ="select Avg(RegCount) from conference";
resultSet = statement.executeQuery(sql);
resultSet.next();
average = resultSet.getString("Avg(RegCount)");

connection.close();
} 
catch (Exception e) 
{
	System.out.println(e.getMessage());
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Organizer</title>

  <link href="css/dashboard/11.b4cac.css" rel="stylesheet">
  <link href="css/dashboard/app.7e30b.css" rel="stylesheet">

</head>
<body>
<div id="app">
      <div data-reactroot="">
         <div id="main">
            <div></div>
            <div class="content">
               <div class="index--container--1vE6I">
                  <nav class="index--nav-container--2sb97">
                     <div class="index--side-nav-compact--2veZ0">
                        <div class="_nav--nav-container--1dKGC">
                           <div class="index--primary-nav--3__ux">
                              <h1 class="_nav--nav-header--ZI506">
                                 <span>
                                    <span class="_nav--glyph--oMMOJ ureact-glyph-module--icon-umark-lg--1tmwF ureact-glyph-module--icon--1oZQL" title="Udacity"><i>Udacity</i></span><!-- react-text: 133 --> <!-- /react-text --><em>Udacity</em>
                                 </span>
                              </h1>
                              <ul class="_nav--top-link-container--3oSil">
                                 <li><a target="" title="Home" class="_nav--nav-group-expanded--2Fbk_ _nav--nav-group--22h5l _nav--nav-link-active--2C92c" href="welcome.jsp"><span class="_nav--nav-link--1xAta">Dashboard</span></a></li>
                                 <li><a target="" title="My Profile" class="_nav--nav-group-expanded--2Fbk_ _nav--nav-group--22h5l" href="stats.jsp"><span class="_nav--nav-link--1xAta">Statistics</span></a></li>
                                 <li><a target="" title="My Profile" class="_nav--nav-group-expanded--2Fbk_ _nav--nav-group--22h5l" href="newevent.jsp"><span class="_nav--nav-link--1xAta">Create event</span></a></li>
                                
                              </ul>
                              <ul class="_nav--bottom-link-container--BoYhW">
                                 <li><a target="" title="Logout" class="_nav--nav-group-expanded--2Fbk_ _nav--nav-group--22h5l" href="index.jsp"><span class="_nav--nav-link--1xAta">Logout</span></a></li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </nav>
                  <main class="index--main--2yIqi index--home--3cPpm">
                     <div class="index--title-area--1aZtJ">
                        <div>
                           <div class="index--no-hamburger--3Ntdr">
                              <div class="_header--header--29qWR">
                                 <h2 class="_header--page-title--3aUAQ">Home</h2>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div id="content" class="index--content-area--1FEjE">
                        <div aria-hidden="true" class="index--hidden-header--rLUgf">
                           <div class="_header--header--29qWR">
                              <h2 class="_header--page-title--3aUAQ">Dashboard</h2>
                           </div>
                        </div>
                        <div id="main-layout-content" aria-labelledby="header-title" class="_body--body---gSRI">
                           <div class="_main--body--164fy layout--body--3U2qN">
                              <div class="_main--main--15fYB">
                                 <div>
                                    
                                          <h3 class="index--title--3XRU5 _main--title--1Hy0o">Statistics</h3>
                                          
                                          <div class="_large-card--card--dLRfT shared--card--3X88h">
                                             <div class="_large-card--body--1EXty">
                                                <div>
                                                   <h1>Total number of events</h1>
                                                              <p><%=count %></p>
                                                </div>
                                             </div>
                                          </div>
                                          
                                          <div class="_large-card--card--dLRfT shared--card--3X88h">
                                             <div class="_large-card--body--1EXty">
                                                <div>
                                                   <h1>Most popular event</h1>
                                                   <p class="_large-card--last-viewed--1RfWk"><%=popular %></p>
                                                   <p></p>
                                                </div>
                                             </div>
                                          </div>
                                          
                                          <div class="_large-card--card--dLRfT shared--card--3X88h">
                                             <div class="_large-card--body--1EXty">
                                                <div>
                                                   <h1>Least popular event</h1>
                                                   <p class="_large-card--last-viewed--1RfWk"><%=lpopular %></p>
                                                   <p></p>
                                                </div>
                                             </div>
                                          </div>
                                          
                                          <div class="_large-card--card--dLRfT shared--card--3X88h">
                                             <div class="_large-card--body--1EXty">
                                                <div>
                                                   <h1>Average number of participents</h1>
                                                   <p class="_large-card--last-viewed--1RfWk"><%=average %></p>
                                                   <p></p>
                                                </div>
                                             </div>
                                          </div>
                                          
                                          <div class="_large-card--card--dLRfT shared--card--3X88h">
                                             <div class="_large-card--body--1EXty">
                                                <div>
                                                   <h1>Organizer should organize events related to </h1>
                                                   <p class="_large-card--last-viewed--1RfWk"><%=key %></p>
                                                   <p></p>
                                                </div>
                                             </div>
                                          </div>
                                          
                                          
                                                <%
					try{
						connection = db.getConnection();
						statement=connection.createStatement();
					String sql ="select * from conference";
					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){
					%>
						<div class="_large-card--card--dLRfT shared--card--3X88h">
                                             <div class="_large-card--body--1EXty">
                                                <div>
                  		  <h1>Event name : <%=resultSet.getString("Name") %></h1>
                          <p class="_large-card--last-viewed--1RfWk">Number of participents <%=resultSet.getString("RegCount") %></p>
                           <p></p>
                                                </div>
                                             </div>
                                          </div>
					<%
					}
					connection.close();
					} 
					catch (Exception e) 
					{
						System.out.println(e.getMessage());
					}
					%>
                                                   
                                                  
                                       

                              </div>
                           </div>
                        </div>
                     </div>
                  </main>
               </div>
            </div>
            <!-- react-empty: 186 -->
         </div>
      </div>
   </div>
   </div>
</body>
</html>