<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Post" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #333;
        }

        div {
            background-color: #fff;
            margin-bottom: 20px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
            max-width: 600px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input, textarea {
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

        a {
            color: #333;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
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
