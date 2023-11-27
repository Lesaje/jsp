<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #333;
        }

        p {
            margin: 10px 0;
            color: #555;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div style="max-width: 600px; margin: 0 auto; padding: 20px; background-color: #fff; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">

    <h2>Account Information</h2>

    <%
        User loggedInUser = (User) request.getSession().getAttribute("authenticatedUser");

        // Check if the user is authenticated
        if (loggedInUser != null) {
    %>
    <p>Username: <%= loggedInUser.getUsername() %></p>
    <p>Email: <%= loggedInUser.getEmail() %></p>

    <!-- Add a form for changing email and password -->
    <form action="account" method="post">
        <label for="newEmail">New Email:</label>
        <input type="email" id="newEmail" name="newEmail" required><br>

        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required><br>

        <input type="submit" value="Update Information">
    </form>
    <%
        } else {
            // User is not authenticated, redirect to the login page
            response.sendRedirect(request.getContextPath() + "/login");
        }
    %>

</div>

</body>
</html>
