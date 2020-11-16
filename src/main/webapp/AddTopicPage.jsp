<%-- 
    Document   : AddTopicPage
    Created on : Dec 4, 2019, 11:07:03 AM
    Author     : Marcel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.DatabaseBean"%>
<!DOCTYPE html>
<html>
    <%    
            if(session.getAttribute("logginStatus") != null){
                /**
                 * variable holds the loggin status of the current session
                 */
                boolean logginStatus = (boolean)request.getSession().getAttribute("logginStatus");
                
                if(logginStatus == false){
                    response.sendRedirect("index.jsp");
                }
            }
            
            /**
             * This holds the URI the previous setRequest method loaded to the session variable
             */
            DatabaseBean db = new DatabaseBean();
            String loc = request.getRequestURI();
            loc = loc.substring(loc.lastIndexOf("/") + 1);
            request.getSession().setAttribute("loc", loc);
            request.getSession().setAttribute("hasTopic", "false");
            
            String[][] feed = db.getFeed();
            /**
             * Holds the value of username currently in the ssession variable
             */
            String username = (String)request.getSession().getAttribute("username");
            
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DeBugged</title>
        <!--Links to Bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="container">
            <div class="jumbotron">
                <h2 class="head">DeBugged</h2>
            </div>    
        </div>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index2.jsp">Home</a></li>              
                </ul>
                <form class="navbar-form" action="Search" method="POST">
                    <div class="form-group">
                        <input type="text" class="form-control" name="search" placeholder="Search...">
                    </div>
                    <button type="submit" class="btn btn-default">Search</button>
                    
                    <ul class="nav navbar-nav navbar-right">
                        <li class="navbar-brand">Hello <%=username%></li>
                        <li><a href="LogOff"><span class="glyphicon glyphicon-log-in"></span>Log Out</a></li>   
                    </ul> 
                   
                </form>
            </div>
        </nav>
        
        <div class="container-fluid" > 
            <div class="col-sm-2 sidenav"></div>    
            <div class="col-sm-8">
                <div class="media">
                    <div class="media-left"></div>
                    <div class="media-body">
<%
                        for(int i = 0 ; i < feed.length ; i++){
                            
%>
                        <h3 class="media-heading"><a href="TopicPage2.jsp?topic=<%=feed[i][0]%>"><%=feed[i][0]%></a><small><%="  " + feed[i][2]%></small></h3>
                        <br/>
                        <div class="content"><%=feed[i][1]%></div>
                        <br/>
<%
                        }   
%>
                    </div>
                    <div class="form-group">
                        <form action="AddTopic" method="POST">
                            <label for="topic">Topic Name:</label>
                            <textarea class="form-control" rows="1" name="topic" id="topic" required=""></textarea>
                            <br/>
                            <label for="desc">Explain your problem:</label>
                            <textarea class="form-control" rows="5" name="desc" id="desc" required=""></textarea>
                            <input type="hidden" name="username" value="<%=username%>">
                            <input type="submit" name="Submit" class="btn btn-default pull-right">
                            <br/> 
                        </form>
                    </div>
                </div>
            </div>  
            <div class="col-sm-2 sidenav"></div>
        </div>
                    
        <nav class="navbar fixed-bottom navbar-inverse ">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">DeBugged</a>
                </div>
            </div>
        </nav>
    </body>
</html>

