<%-- 
    Document   : viewapplication
    Created on : Apr 27, 2023, 2:33:01 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <title>view Page</title>
    </head>
    <body>
      
        <%
                Statement st=null;
                Connection c1=null;
                String q="",reason="";
                try
                {
                  Class.forName("com.mysql.jdbc.Driver"); 
                  c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","kranti");
                  //out.println("Database Connected Succesfully");

                  int appid=Integer.parseInt(request.getParameter("appid"));
                  st=c1.createStatement();
                  q="select reason from leaveapplications where applicationid="+appid;

                  ResultSet r =st.executeQuery(q);
                  if(r.next())
                  {
                      reason=r.getString("reason");
                  }
                  
        %>
        <div class="container">
            <p>
                <%= reason %>
            </p>
        </div>
        
        <%          
                  st.close();
                }
                catch(Exception e)
                {
                    out.println("Student Exception"+e);
                }
            
        %>
    </body>
</html>
