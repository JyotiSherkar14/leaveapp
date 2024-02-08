
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("branch")==null)
            {
        %>
        <div class="container">
            <h2>Your Not Logged In</h2> 
            <a href="hodlogin.html">Please Login</a>
        </div>
        <%  }
            else
            {
                String branch = (String)session.getAttribute("branch");
        %>           
        
        <div class="container my-4">
            <h1>Leave Applications</h1>
        </div>    
        
    <div class="container">    
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Name</th>
                <th>roll no</th>
                <th>contact no</th>
                <th>Application id</th>
                <th>branch</th> 
            </tr>
        </thead>
        <tbody>

<%
                Statement st=null;
                Connection c1=null;
                String q="";
                try
                {
                    Class.forName("com.mysql.jdbc.Driver"); 
                    c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","kranti");
                    //out.println("Database Connected Succesfully");


                    st=c1.createStatement();
                    q="select * from leaveapplications where branch='"+branch+"' and status=''";
                    ResultSet r=st.executeQuery(q);
                    while(r.next())
                    {
                        
                     
        %>
        
            <tr>
                <td><%= r.getString("name")%></td>
                <td><%= r.getInt("rollno") %></td>
                <td><%= r.getLong("contact") %></td>
                <td><%= r.getInt("applicationid") %></td>
                <td><%= r.getString("branch")%></td>
                <td><a href="viewapplication.jsp?appid=<%= r.getInt(6)%>">view</a></td>
                <td><a href="applicationStatus.jsp?status=accept&&appid=<%= r.getInt(6)%>">Accept</a></td>
                <td><a href="applicationStatus.jsp?status=reject&&appid=<%= r.getInt(6)%>">Reject</a></td>
            </tr>
        <%
                    }
                    st.close();
                }
                catch(Exception e)
                {
                  out.println("Student Exception"+e);
                }
            }

        %>
        </tbody>
    </table>
        
    </div>
    </body>
</html>
