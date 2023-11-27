package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;

@WebServlet(name = "accountServlet", value = "/account")
public class AccountServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the user is authenticated
        if (isAuthenticated(request)) {
            // User is authenticated, proceed to display the account page
            request.getRequestDispatcher("WEB-INF/jsp/account.jsp").forward(request, response);
        } else {
            // User is not authenticated, redirect to the login page
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the user is authenticated
        if (isAuthenticated(request)) {
            // Retrieve the authenticated user from the session
            User authenticatedUser = (User) request.getSession().getAttribute("authenticatedUser");

            // Retrieve new email and password from the request
            String newEmail = request.getParameter("newEmail");
            String newPassword = request.getParameter("newPassword");

            // Update the user's information
            authenticatedUser.setEmail(newEmail);
            authenticatedUser.setPassword(newPassword);

            // Redirect to the account page with a success message
            response.sendRedirect(request.getContextPath() + "/account?success=true");
        } else {
            // User is not authenticated, redirect to the login page
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    private boolean isAuthenticated(HttpServletRequest request) {
        // Check if the user is stored in the session
        return request.getSession().getAttribute("authenticatedUser") != null;
    }
}
