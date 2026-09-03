Fixes applied to WebApplication1:

1. src/java/DbServlet.java
   - Fixed broken SQL: was "insert into sanjay1(Name,Number,Email,Password values(?,?,?,?,?,?)"
     (missing closing column list, only 4 columns named but 6 placeholders).
     Now: insert into sanjay1 (Name, Number, Email, Password, Date, Membership) values (?,?,?,?,?,?)
   - Fixed JDBC driver class: was "com.mysql.jdbc.Driver" (old driver, not present in the
     bundled mysql-connector-j-9.0.0.jar), changed to "com.mysql.cj.jdbc.Driver" (Connector/J 8+).
   - Added ?useSSL=false&serverTimezone=UTC to the JDBC URL (required by Connector/J 8+,
     otherwise you get SSL/timezone warnings or connection errors).
   - Kept DB credentials as-is: user "root", password "test@123", database "DbServlet".
   - On successful insert, redirects to success.html (created) instead of a non-existent "login" page.
   - On failure, prints the actual SQL error to the response instead of failing silently,
     so you can see what went wrong instead of a blank page.
   - Used try-with-resources for the PreparedStatement as well as the Connection.

2. src/java/DriverManger.java
   - Deleted. It was an unused, broken stub class (name clashes with java.sql.DriverManager,
     body just threw UnsupportedOperationException) and was not referenced anywhere.

3. web/index.html
   - Changed the booking <form> method from "get" to "post", since GET would put the
     password in the URL/query string and browser history.

4. web/success.html
   - New file. Shown after a successful DB insert.

Required MySQL table (create this before submitting the form):

  CREATE DATABASE IF NOT EXISTS DbServlet;
  USE DbServlet;
  CREATE TABLE sanjay1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Number VARCHAR(20),
    Email VARCHAR(100),
    Password VARCHAR(100),
    Date VARCHAR(20),
    Membership VARCHAR(20)
  );

Note: "Date" and "Password" are reserved-ish words in some SQL dialects; MySQL allows
them as column names but if you see a syntax error, wrap them in backticks in both the
CREATE TABLE and the servlet's SQL, e.g. `Date`, `Password`.
