package com.learninglog.learninglogproject.user.model;

import com.learninglog.learninglogproject.topic.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/topic")
public class TopicServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException{
        req.getRequestDispatcher("pages/add-topic.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        User userObj = (User) req.getSession().getAttribute("user");
        String topicName = req.getParameter("topic-name");

        if (userObj == null) {
            req.setAttribute("errors", "Please login first");
            req.getRequestDispatcher("pages/login.jsp").forward(req, resp);
            return;
        }

        if (topicName == null || topicName.trim().isEmpty()) {
            req.setAttribute("errors", "Topic name is required");
            req.getRequestDispatcher("pages/add-topic.jsp").forward(req, resp);
            return;
        }

        Topic topic = new Topic();
        topic.setName(topicName.trim());
        topic.setUserId(userObj.getId());
        topic.setCreatedAt(new Timestamp(System.currentTimeMillis()));

        req.setAttribute("topic", topic);
        resp.sendRedirect("dashboard");
    }
}
