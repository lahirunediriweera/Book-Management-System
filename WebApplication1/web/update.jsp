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
        <title>Update Item</title>
        <script>
        function openEditPopup(bookId, name, author, price) {
            document.getElementById('editBookId').value = bookId;
            document.getElementById('editName').value = name;
            document.getElementById('editAuthor').value = author;
            document.getElementById('editPrice').value = price;
            document.getElementById('editPopup').style.display = 'block';
        }

        function closeEditPopup() {
            document.getElementById('editPopup').style.display = 'none';
        }
    </script>
    <link rel="stylesheet" href="css/styleup.css">
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
            <th>Book Price</th>
            <th>action</th>
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
                <td>
                    <button onclick="openEditPopup('<%=rs.getInt("bookid")%>', '<%=rs.getString("name")%>', '<%=rs.getString("author")%>', '<%=rs.getString("price")%>')">Update</button>
                </td>
            </tr>

            <% } %>
      </table>
      
    </div>
    </div>
      <div id="editPopup" class="editPopup-content">
        <span class="close" onclick="closeEditPopup()">&times;</span>
        <h2>Edit Book Details</h2>
        <form action="UpdateBook" method="post">
            <input type="hidden" id="editBookId" name="bookid">
            <label for="editName">Name:</label>
            <input type="text" id="editName" name="name"><br><br>
            <label for="editAuthor">Author:</label>
            <input type="text" id="editAuthor" name="author"><br><br>
            <label for="editAuthor">Price:</label>
            <input type="text" id="editPrice" name="price"><br><br>
            <input name="btn" type="submit" value="Update">
        </form>
    </div>
  </body>
</html>
