package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateBook", urlPatterns = {"/UpdateBook"})
public class UpdateBook extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        // Retrieve parameters from the request
        int bookid = Integer.parseInt(request.getParameter("bookid"));
        String name = request.getParameter("name");
        String author = request.getParameter("author");
        String price = request.getParameter("price");
        
        
        try {
            // Establish the database connection
            String url = "jdbc:mysql://localhost:3306/librarybd";
            String username = "root";
            String password = "";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, username, password);
            
            // Prepare the SQL statement to update the book
            String query = "UPDATE books SET name=?, author=?, price=?  WHERE bookid=?";
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, name);
            st.setString(2, author);
            st.setInt(3, bookid);
            st.setString(4, price);
            // Execute the update operation
            int rowsAffected = st.executeUpdate();
            
            // Close the database resources
            st.close();
            con.close();
            
            // Check if the update operation was successful
            if (rowsAffected > 0) {
                out.println("<h3>Book with ID " + bookid + " updated successfully!</h3>");
            } else {
                out.println("<h3>Failed to update book with ID " + bookid + "!</h3>");
            }
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
