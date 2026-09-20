<%-- 
    Document   : resigtration
    Created on : 3 Sep, 2026, 2:11:30 PM
    Author     : 24uad083
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String uname = request.getParameter("user");
        String pass = request.getParameter("pass");
        String name = request.getParameter("name1");
        String ccn = request.getParameter("ccn");
        String mail = request.getParameter("mail");
        String num = request.getParameter("num");
        %>
        <center>
            <p>Registration details</p>
        <p><strong>User Name:</strong><%=uname%></p>
         <p><strong>Password:</strong><%=pass%></p>
         <p><strong>Name:</strong><%=name%></p>
         <p><strong>Credit Card Number:</strong><%=ccn%></p>
         <p><strong>Email:</strong><%=mail%></p>
         <p><strong>Phone Number:</strong><%=num%></p></center>
    </body>
</html>
