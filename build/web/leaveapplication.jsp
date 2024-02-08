<%-- 
    Document   : leaveapplication
    Created on : Apr 23, 2023, 3:33:54 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <title>JSP Page</title>
        <%
        int applicationid=0;
        %>
    </head>
    <body>
        <%
            if(session.getAttribute("rollno")==null)
            {
        %>
            <h2>Your Not Logged In</h2> 
            <a href="studentlogin.html">Please Login</a>
            
            <%  }
            else
            {
                int rollno = (int)session.getAttribute("rollno");
               

                Statement st;
                Connection c1=null;
                String q="";
                String name="",branch="";
                long contact=0;
               
               //String nm="";
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
                    name=r.getString("name");
                    contact=r.getLong("contact");
                    branch=r.getString("branch");
                  }
                  q="select max(applicationid) from leaveapplications";
                  r=st.executeQuery(q);
                  if(r.next())
                  {
                    //nm=r.getString("name");
                    
                   //applicationid;  
                  }
%>
            <center>
    <h1>Apply for Leave</h1><br><br>
    <hr>
        
        <form action="apply.jsp" method="post">
        
            
            <label for="applicationid"> Application Id:</label> <input type="text" name="applicationid" value="<%= applicationid %>" ><br><br>
    
        <label for="sname"> Your Name :</label> <input type="text" name="sname" value="<%= name%>" readonly="true"><br><br>
        <label for="rollno"> Your rollno :</label> <input type="number" name="rollno" value="<%= rollno%>" readonly="true"><br><br>
        <label for="contact"> Contact :</label> <input type="tel" name="contact" value="<%= contact%>" readonly="true"><br><br>
        <label for="branch"> Your Branch :</label> <input type="text" name="branch" value="<%= branch%>" readonly="true"><br><br>
        <label for="reason"> Reason For Leave:</label> <textarea name="reason" rows="5" cols="30"></textarea>
        
        <br><hr>
        <input class="btn btn-secondary" type="submit" Value="Apply">
        <input class="btn btn-secondary" type="reset" value="clear">
        
        </form>

    </center>
        
            
            <%

                  st.close();
                }
                catch(Exception e)
                {
                    out.println("Student Exception"+e);
                }
                
            }
        
            
        
        %>
        

            
        <!---->
    </body>
</html>
