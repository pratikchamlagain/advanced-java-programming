<%@ page import="com.learninglog.learninglogproject.user.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | LearningLog</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
%>
<main class="page-shell">
    <header class="topbar">
        <div class="brand">
            <div class="brand-mark">LL</div>
            <div>
                <p class="eyebrow">Dashboard</p>
                <h2><%= user.getName() %>'s learning overview</h2>
            </div>
        </div>
        <nav class="nav-links">
            <a class="nav-link active" href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/topic">Add topic</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/topic?page=list">Topic list</a>
        </nav>
    </header>

    <section class="hero">
        <div class="hero-copy">
            <span class="eyebrow-pill">Personal workspace</span>
            <h2>Keep your study journey clear and consistent.</h2>
            <p class="lead">
                Manage your topics from one neat dashboard. Add new entries quickly, review your existing list,
                and keep your learning record organized.
            </p>
            <div class="hero-actions">
                <a class="button" href="${pageContext.request.contextPath}/topic">Add a new topic</a>
                <a class="button-secondary" href="${pageContext.request.contextPath}/topic?page=list">Browse topic list</a>
            </div>
        </div>

        <div class="hero-side">
            <div class="feature-card">
                <strong>Account name</strong>
                <p><%= user.getName() %></p>
            </div>
            <div class="feature-card">
                <strong>Email</strong>
                <p><%= user.getEmail() %></p>
            </div>
            <div class="feature-card">
                <strong>User ID</strong>
                <p>#<%= user.getId() %></p>
            </div>
        </div>
    </section>

    <section class="content-grid">
        <div class="panel panel-main">
            <h3>Quick actions</h3>
            <p class="lead" style="margin-top: 10px;">Use these shortcuts to keep your learning log up to date without extra clicks.</p>
            <div class="stats">
                <div class="stat-card">
                    <span class="stat-value">01</span>
                    <strong>Add topic</strong>
                    <p>Create a new learning topic and keep your list growing.</p>
                </div>
                <div class="stat-card">
                    <span class="stat-value">02</span>
                    <strong>Review list</strong>
                    <p>Check all topics in one table with edit and delete actions.</p>
                </div>
                <div class="stat-card">
                    <span class="stat-value">03</span>
                    <strong>Stay organized</strong>
                    <p>Keep a consistent, minimal interface across every page.</p>
                </div>
            </div>
        </div>

        <aside class="panel panel-side">
            <h3>Suggested flow</h3>
            <ul class="list" style="margin-top: 18px;">
                <li>Open the add topic page and create a new study item.</li>
                <li>Visit the topic list to review everything in one place.</li>
                <li>Return here anytime for clean navigation across the app.</li>
            </ul>
            <p class="footer-note">Your interface now uses a unified layout, spacing system, and visual style across the full app.</p>
        </aside>
    </section>
</main>
</body>
</html>
