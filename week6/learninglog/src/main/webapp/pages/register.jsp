<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | LearningLog</title>
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
                <span class="eyebrow-pill">Create your account</span>
                <h2 style="margin-top: 14px;">Start your clean learning workspace.</h2>
                <p class="lead" style="margin-top: 12px;">Set up your profile and begin organizing study topics in one consistent dashboard.</p>
            </div>

            <% if (!errorMsg.isEmpty()) { %>
                <div class="alert"><%= errorMsg %></div>
            <% } %>

            <form class="form-grid" action="${pageContext.request.contextPath}/register" method="post">
                <div class="field">
                    <label for="name">Full name</label>
                    <input id="name" type="text" name="name" placeholder="Enter your full name" required>
                </div>

                <div class="field">
                    <label for="email">Email</label>
                    <input id="email" type="email" name="email" placeholder="Enter your email" required>
                </div>

                <div class="field">
                    <label for="password">Password</label>
                    <input id="password" type="password" name="password" placeholder="Create a password" required>
                </div>

                <div class="actions-row">
                    <button class="button" type="submit">Register</button>
                    <a class="button-ghost" href="${pageContext.request.contextPath}/login">Already have an account</a>
                </div>
            </form>
        </div>
    </section>
</main>
</body>
</html>
