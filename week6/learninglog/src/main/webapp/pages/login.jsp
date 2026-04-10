<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | LearningLog</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
</head>
<body>
<%
    String errorMsg = (String) request.getAttribute("error");
    if (errorMsg == null) {
        errorMsg = "";
    }
%>
<main class="form-shell">
    <section class="panel auth-card">
        <div class="stack">
            <div>
                <span class="eyebrow-pill">Welcome back</span>
                <h2 style="margin-top: 14px;">Sign in to your learning space.</h2>
                <p class="lead" style="margin-top: 12px;">Access your dashboard, review your topics, and continue your progress.</p>
            </div>

            <% if (!errorMsg.isEmpty()) { %>
                <div class="alert"><%= errorMsg %></div>
            <% } %>

            <form class="form-grid" action="${pageContext.request.contextPath}/login" method="post">
                <div class="field">
                    <label for="email">Email</label>
                    <input id="email" type="email" name="email" placeholder="Enter your email" required>
                </div>

                <div class="field">
                    <label for="password">Password</label>
                    <input id="password" type="password" name="password" placeholder="Enter your password" required>
                </div>

                <div class="actions-row">
                    <button class="button" type="submit">Login</button>
                    <a class="button-ghost" href="${pageContext.request.contextPath}/register">Create an account</a>
                </div>
            </form>
        </div>
    </section>
</main>
</body>
</html>
