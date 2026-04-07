package com.learninglog.learninglogproject.topic.controller;

import com.learninglog.learninglogproject.topic.model.User;
import com.learninglog.learninglogproject.topic.model.dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("pages/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            UserDao dao = new UserDao();
            User UserObj = dao.LoginUser(email, password);
            if (UserObj == null) {
                req.setAttribute("errors", "Invalid username or password");
                req.getRequestDispatcher("pages/login.jsp").forward(req, resp);
            }
            else{
                HttpSession session = req.getSession();
                session.setAttribute("user", UserObj);
                resp.sendRedirect("dashboard");

            }
        } catch (Exception e) {
            req.setAttribute("errors", "Unable to login");
            req.getRequestDispatcher("pages/login.jsp").forward(req, resp);
        }
    }
}
