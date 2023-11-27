<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Post" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
</head>
<body>

<h1>Main Page</h1>

<%
    List<Post> posts = (List<Post>) request.getAttribute("posts");

    if (posts == null || posts.isEmpty()) {
%>
<p>No posts available.</p>
<%
} else {
    for (Post post : posts) {
%>
<div>
    <h2><%= post.getTitle() %></h2>
    <p><%= post.getContent() %></p>
    <p>Author: <%= post.getAuthor() %></p>
</div>
<%
        }
    }
%>

<!-- Add a form for creating new posts -->
<form action="/main/main" method="post">
    <label for="title">Title:</label>
    <input type="text" id="title" name="title" required><br>

    <label for="content">Content:</label>
    <textarea id="content" name="content" required></textarea><br>

    <input type="submit" value="Create Post">
</form>

<!-- Add a link to the account page -->
<a href="/main/account">Account</a>

</body>
</html>
