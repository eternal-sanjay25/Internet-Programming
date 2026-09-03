/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 24uad083
 */
public class DbServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String url = "jdbc:mysql://localhost:3306/DbServlet?useSSL=false&serverTimezone=UTC";
        String dbUser = "root";
        String dbPass = "test@123";

        String sql = "SELECT * FROM sanjay1";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(url, dbUser, dbPass);
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            PrintWriter out = response.getWriter();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Event Details</title>");
            out.println("</head>");

            out.println("<body>");

            // Event name at top
            out.println("<h1 align='center'>EVENT DETAILS</h1>");
            out.println("<br>");

            // Table at center
            out.println("<table border='1' align='center' cellpadding='10'>");

            out.println("<tr>");
            out.println("<th>Name</th>");
            out.println("<th>Number</th>");
            out.println("<th>Email</th>");
            out.println("<th>Password</th>");
            out.println("<th>Date</th>");
            out.println("<th>Membership</th>");
            out.println("</tr>");

            // Display all rows
            while (rs.next()) {

                out.println("<tr>");

                out.println("<td>" + rs.getString("Name") + "</td>");
                out.println("<td>" + rs.getString("Number") + "</td>");
                out.println("<td>" + rs.getString("Email") + "</td>");
                out.println("<td>" + rs.getString("Password") + "</td>");
                out.println("<td>" + rs.getString("Date") + "</td>");
                out.println("<td>" + rs.getString("Membership") + "</td>");

                out.println("</tr>");
            }

            out.println("</table>");

            out.println("</body>");
            out.println("</html>");

            rs.close();
            ps.close();
            con.close();

        } catch (ClassNotFoundException | SQLException ex) {
            response.getWriter().println("Error: " + ex.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DbServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Handles form submission and stores data into the sanjay1 table.";
    }// </editor-fold>

}
