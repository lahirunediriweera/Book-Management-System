<%-- 
    Document   : Gents
    Created on : Apr 15, 2024, 12:16:55 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Item</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
    <div class="container">
        <a href="index.html"><input type="submit" value="Back" class="btn"></a>
    <div class="product-display">
      <table class="product-display-table">
         <thead>
         <tr>
            <th>Book ID</th>
            <th>Book Name</th>
            <th>Book Author</th>
            <th>Book price</th>
            
         </tr>
         </thead>
         
         <%
                String url = "jdbc:mysql://localhost:3306/librarybd";
                String query = "SELECT * FROM books";
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, "root", "");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(query);
                
                while(rs.next()) { %>
                
                <tr>
                    <td><%=rs.getInt("bookid")%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("author")%></td>
                    <td><%=rs.getString("price")%></td>
                   
                </tr>
                
                <% } %>
         
      </table>
    </div>
    </div>
  </body>
</html>
