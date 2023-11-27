package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Post;
import model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "mainServlet", value = "/main")
public class MainServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAuthenticated(request)) {
            List<Post> posts = getPostsFromContext();
            request.setAttribute("posts", posts);
            request.getRequestDispatcher("WEB-INF/jsp/main.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAuthenticated(request)) {
            // Retrieve new post details from the form
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String author = ((User) request.getSession().getAttribute("authenticatedUser")).getUsername();

            // Create a new post
            Post newPost = new Post(getNextPostId(), title, content, author);

            // Retrieve the existing posts from the servlet context
            List<Post> posts = getPostsFromContext();

            // Add the new post to the list
            posts.add(newPost);

            // Store the updated list of posts back to the servlet context
            setPostsToContext(posts);

            // Update the request attribute with the new list of posts
            request.setAttribute("posts", posts);

            // Forward to the main page JSP
            request.getRequestDispatcher("WEB-INF/jsp/main.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    private boolean isAuthenticated(HttpServletRequest request) {
        return request.getSession().getAttribute("authenticatedUser") != null;
    }

    private List<Post> getPostsFromContext() {
        // Retrieve the list of posts from the servlet context
        ServletContext servletContext = getServletContext();
        List<Post> posts = (List<Post>) servletContext.getAttribute("posts");

        // If the list does not exist in the context, create a new one
        if (posts == null) {
            posts = new ArrayList<>();
            servletContext.setAttribute("posts", posts);
        }

        return posts;
    }

    private void setPostsToContext(List<Post> posts) {
        // Store the list of posts back to the servlet context
        ServletContext servletContext = getServletContext();
        servletContext.setAttribute("posts", posts);
    }

    private int getNextPostId() {
        // In a real application, you would retrieve the next available post ID from a database.
        // For simplicity, let's just use a counter for this example.
        int currentMaxId = getPostsFromContext().stream().mapToInt(Post::getPostId).max().orElse(0);
        return currentMaxId + 1;
    }
}



