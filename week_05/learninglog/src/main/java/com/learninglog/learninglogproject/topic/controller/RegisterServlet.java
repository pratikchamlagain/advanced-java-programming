package com.learninglog.learninglogproject.topic.controller;

import com.learninglog.learninglogproject.topic.model.User;
import com.learninglog.learninglogproject.topic.model.dao.UserDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;


import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("pages/register.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (name.isEmpty() || email.isEmpty() || password.isEmpty()) {
            req.setAttribute("error", "Please fill all the fields");
            req.getRequestDispatcher("pages/register.jsp").forward(req, resp);
        }
        User userObj = new User();
        userObj.setName(name);
        userObj.setEmail(email);
//        userObj.setPassword(password);
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        userObj.setPassword(hashedPassword);
        UserDao dao = new UserDao();
        try {
            boolean result = dao.insertUser(userObj);
            if (result) {
                resp.sendRedirect("login");
            } else {
                req.setAttribute("error", "Unable to insert user");
                req.getRequestDispatcher("pages/register.jsp").forward(req, resp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
