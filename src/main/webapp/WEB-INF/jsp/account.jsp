<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Page</title>
</head>
<body>

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

</body>
</html>
