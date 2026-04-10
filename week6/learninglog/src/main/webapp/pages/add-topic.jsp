<%@ page import="com.learninglog.learninglogproject.user.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Topic | LearningLog</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
</head>
<body>
<%
    String errorMsg = (String) request.getAttribute("error");
    if (errorMsg == null) {
        errorMsg = "";
    }
    User userObj = (User) session.getAttribute("user");
    int userId = 0;
    if (userObj != null) {
        userId = userObj.getId();
    }
%>
<main class="page-shell">
    <header class="topbar">
        <div class="brand">
            <div class="brand-mark">LL</div>
            <div>
                <p class="eyebrow">Topics</p>
                <h2>Add a new learning topic</h2>
            </div>
        </div>
        <nav class="nav-links">
            <a class="nav-link" href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            <a class="nav-link active" href="${pageContext.request.contextPath}/topic">Add topic</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/topic?page=list">Topic list</a>
        </nav>
    </header>

    <section class="content-grid">
        <div class="panel panel-main">
            <div class="stack">
                <div>
                    <span class="eyebrow-pill">New entry</span>
                    <h2 style="margin-top: 14px;">Create a focused topic in seconds.</h2>
                    <p class="lead" style="margin-top: 12px;">Add the next concept, subject, or lesson you want to track in your learning journey.</p>
                </div>

                <% if (!errorMsg.isEmpty()) { %>
                    <div class="alert"><%= errorMsg %></div>
                <% } %>

                <form class="form-grid" method="post" action="${pageContext.request.contextPath}/topic">
                    <input type="hidden" value="add" name="action">
                    <input type="hidden" value="<%= userId %>" name="user-id">

                    <div class="field">
                        <label for="topic-name">Topic name</label>
                        <input id="topic-name" type="text" name="topic-name" placeholder="Example: Java collections, JDBC basics, REST APIs" required>
                    </div>

                    <div class="actions-row">
                        <button class="button" type="submit">Add topic</button>
                        <a class="button-ghost" href="${pageContext.request.contextPath}/topic?page=list">View all topics</a>
                    </div>
                </form>
            </div>
        </div>

        <aside class="panel panel-side">
            <h3>Writing tips</h3>
            <ul class="list" style="margin-top: 18px;">
                <li>Keep names short and specific so the list stays readable.</li>
                <li>Use one topic per entry instead of grouping many concepts together.</li>
                <li>Review your topic list often to keep it organized and relevant.</li>
            </ul>
        </aside>
    </section>
</main>
</body>
</html>
