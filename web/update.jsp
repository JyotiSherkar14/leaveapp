<%-- 
    Document   : update
    Created on : Apr 23, 2023, 1:54:48 PM
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
    </head>
    <body>
        
       
        <div class="container my-3">
            <center><h1>Update Student</h1></center>
        </div>
        <div class="container my-3">
        <form action="edit.jsp" method="post">
        <table class="table table-hover">
            <%
                Statement st=null;
                Connection c1=null;
                String q="";
                
                String sname="",branch="";
                long contact=0;
                try
                {
                    Class.forName("com.mysql.jdbc.Driver"); 
                    c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","kranti");
                    //out.println("Database Connected Succesfully");
 
                    int rollno=Integer.parseInt(request.getParameter("update"));
                    st=c1.createStatement();
                    q="select * from student where rollno="+rollno;
                   
                    ResultSet r = st.executeQuery(q);
                    if(r.next())
                    {
                        sname=r.getString("name");
                        contact=r.getLong("contact");
                        branch=r.getString("branch");
                    }
            %>
                    <tr>
                        <td>Student Name :</td>
                        <td><input type="text" name="sname" value="<%= sname%>"></td>
                    </tr>
                    <tr>
                        <td>Roll No :</td>
                        <td><input type="number" name="rollno" value="<%= rollno%>" readonly="true"></td>
                    </tr>
                    <tr>
                        <td>Contact No :</td>
                        <td><input type="tel" name="contact" value="<%= contact%>"></td>
                    </tr>
                    <tr>
                        <td>Students Branch :</td>
                        <td><input type="text" name="branch" value="<%= branch%>" readonly="true"></td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td><input class="btn btn-success" type="submit" value="Update"></td>
                    </tr>

            
            
            <%
                    st.close();
                }
                catch(Exception e)
                {
                    out.println("Student Exception"+e);
                }

            %>
        </table>
        </div>
    </body>
</html>
