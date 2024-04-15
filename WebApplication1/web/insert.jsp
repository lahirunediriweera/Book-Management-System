<%-- 
    Document   : gentssetting
    Created on : Apr 14, 2024, 11:45:23 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Items Gents Section</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="container">
        <h1>ADD NEW BOOK FOR THE SYSTEM</h1>
        <p></p>
        <form action="BookServlet" method="POST">
            <div class="row">
                <div class="column">
                    <label for="bid">Book ID</label>
                    <input type="number" id="bid" name="bid" placeholder="Book Id here">
                </div>
                <div class="column">
                    <label for="name">Name</label>
                    <input type="text" id="bname" name="bname" placeholder="Name here">
                </div>
            </div>
            <div class="row">
                <div class="column">
                    <label for="Author">Author</label>
                    <input type="text" id="bauthor" name="bauthor" placeholder="Author here">
                </div>
                <div class="column">
                    <label for="Price">Price</label>
                    <input type="number" id="bprice" name="bprice" placeholder="Price here">
                </div>
            </div>
            <div class="row">
                <div class="c">
                    <a href="index.html"><input type="button" value="Back" class="btn"></a>
                <input type="reset" value="Reset" class="btn">
                <input type="submit" value="Submit" class="btn">
                </div>
            </div>
        </form>
    </div>

    </body>
</html>
