<%-- 
    Document   : apply
    Created on : Apr 23, 2023, 4:02:23 PM
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
            Statement st;
            Connection c1=null;
            String q="";
            String name = request.getParameter("sname");
            String branch = request.getParameter("branch");
            String reason = request.getParameter("reason");
            int rollno = Integer.parseInt(request.getParameter("rollno"));
            long contact = Long.parseLong(request.getParameter("contact"));
            int id=Integer.parseInt(request.getParameter("applicationid"));
            //out.print(""+name+"<br>"+branch+"<br>"+reason+"<br>"+rollno+"<br>"+contact);
            
            try
            {
              Class.forName("com.mysql.jdbc.Driver"); 
              c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","kranti");
              //out.println("Database Connected Succesfully");
              
                           
              st=c1.createStatement();
              q="insert into leaveapplications values('"+name+"',"+rollno+","+contact+",'"+reason+"','',"+id+",'"+branch+"')";
              int r=st.executeUpdate(q);
              if(r>0)
              {
                  out.print("added");
              }
              else
              {
                     out.print("not added");
              }
              
              st.close();
            }
            catch(Exception e)
            {
                out.println("Student Exception"+e);
            }
        
        
        %>
        <script type='text/javascript'>
            alert("Leave Application send Successfully..");
            location="studentpannel.html";
        </script>
    </body>
</html>
