<%-- 
    Document   : edit
    Created on : Apr 23, 2023, 1:55:32 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
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
                out.println("Database Connected Succesfully");
              
                int rollno=Integer.parseInt(request.getParameter("rollno"));
           
                st=c1.createStatement();
                
                sname = request.getParameter("sname");
                contact = Long.parseLong(request.getParameter("contact"));
                
                q="update student set name='"+sname+"',contact="+contact+" where rollno="+rollno;
                st.executeUpdate(q);
                st.close();
            }
            catch(Exception e)
            {
                out.println("Student Exception"+e);
            }

        %>
        <script type="text/javascript">
            window.alert("Student updated Successfully");
            window.location="hodpannel.html";
        </script>
        

    </body>
</html>
