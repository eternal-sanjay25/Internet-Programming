<%-- 
    Document   : dbm
    Created on : 3 Sep, 2026, 3:05:18 PM
    Author     : 24uad083
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Details</title>
</head>

<body>

<%
    // Get values from HTML form
    String name = request.getParameter("fname");
    String num = request.getParameter("phone");
    String mail = request.getParameter("email");
    String add = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String pcode = request.getParameter("pincode");
    String product = request.getParameter("category");
    String quantity = request.getParameter("quantity");
    String payment = request.getParameter("payment");

    // Database connection
    String url = "jdbc:mysql://localhost:3306/dbm?useSSL=false&serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "test@123";

    // INSERT query
    String insertSql =
        "INSERT INTO register " +
        "(Name, Number, Mail, Address, City, State, Pincode, Product, Quantity, Payment) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    // SELECT query
    String selectSql = "SELECT * FROM register";

    try {

        // Load MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to database
        Connection con = DriverManager.getConnection(
            url, dbUser, dbPass
        );

        // =========================
        // INSERT
        // =========================

        PreparedStatement insertPs = con.prepareStatement(insertSql);

        insertPs.setString(1, name);
        insertPs.setString(2, num);
        insertPs.setString(3, mail);
        insertPs.setString(4, add);
        insertPs.setString(5, city);
        insertPs.setString(6, state);
        insertPs.setString(7, pcode);
        insertPs.setString(8, product);
        insertPs.setString(9, quantity);
        insertPs.setString(10, payment);

        insertPs.executeUpdate();

        insertPs.close();


        // =========================
        // SELECT
        // =========================

        PreparedStatement selectPs = con.prepareStatement(selectSql);
        ResultSet rs = selectPs.executeQuery();
%>

<h1 align="center">REGISTER DETAILS</h1>

<table border="1" align="center" cellpadding="10">

    <tr>
        <th>Name</th>
        <th>Number</th>
        <th>Mail</th>
        <th>Address</th>
        <th>City</th>
        <th>State</th>
        <th>Pincode</th>
        <th>Product</th>
        <th>Quantity</th>
        <th>Payment</th>
    </tr>

<%
        while (rs.next()) {
%>

    <tr>
        <td><%= rs.getString("Name") %></td>
        <td><%= rs.getString("Number") %></td>
        <td><%= rs.getString("Mail") %></td>
        <td><%= rs.getString("Address") %></td>
        <td><%= rs.getString("City") %></td>
        <td><%= rs.getString("State") %></td>
        <td><%= rs.getString("Pincode") %></td>
        <td><%= rs.getString("Product") %></td>
        <td><%= rs.getString("Quantity") %></td>
        <td><%= rs.getString("Payment") %></td>
    </tr>

<%
        }

        // Close resources
        rs.close();
        selectPs.close();
        con.close();

    } catch (ClassNotFoundException e) {

        out.println("<h3>MySQL Driver Error: " + e.getMessage() + "</h3>");

    } catch (SQLException e) {

        out.println("<h3>Database Error: " + e.getMessage() + "</h3>");
    }
%>

</table>

</body>
</html>
