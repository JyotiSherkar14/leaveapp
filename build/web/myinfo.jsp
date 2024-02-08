<%-- 
    Document   : myinfo
    Created on : Apr 23, 2023, 2:37:44 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <title>MYinfo Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("rollno")==null)
            {
        %>
            <h2>Your Not LoggedIn</h2> 
            <a href="studentlogin.html">Please Login</a>
        <%  }
            else
            {
                int rollno = (int)session.getAttribute("rollno");
                
                //out.print("<br><h2>Hello!,"+rollno);
                //

                Statement st;
                Connection c1=null;
                String q="";
                try
                {
                  Class.forName("com.mysql.jdbc.Driver"); 
                  c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","kranti");
                  //out.println("Database Connected Succesfully");


                  st=c1.createStatement();
                  q="select * from student where rollno="+rollno;
                  ResultSet r=st.executeQuery(q);
                  if(r.next())
                  {
        %>
    <center>
        <h1>Hello!,<%= r.getString("name")%></h1><br>
        <h3>Your Roll no :<%= r.getInt("rollno") %></h3><br>
        <h3>Contact No :<%= r.getLong("contact") %></h3><br>
        <h3>Branch :<%= r.getString("branch") %></h3><br>
        
    </center>
        
        
        <%
                  }

                  st.close();
                }
                catch(Exception e)
                {
                    out.println("Student Exception"+e);
                }
                out.print("<br><center><a href='logout.jsp'>Logout</a></center>");
            }
        
            
        
        %>
    </body>
</html>
