<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LearningLog</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
</head>
<body>
<main class="page-shell">
    <header class="topbar">
        <div class="brand">
            <div class="brand-mark">LL</div>
            <div>
                <p class="eyebrow">LearningLog</p>
                <h1>Track what you learn, neatly.</h1>
            </div>
        </div>
        <nav class="nav-links">
            <a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a>
            <a class="nav-link active" href="${pageContext.request.contextPath}/register">Create account</a>
        </nav>
    </header>

    <section class="hero">
        <div class="hero-copy">
            <span class="eyebrow-pill">Focused learning journal</span>
            <h2>Turn daily learning into a clean personal system.</h2>
            <p class="lead">
                LearningLog gives your study routine a polished home. Capture topics, review progress,
                and keep everything organized in one calm, consistent workspace.
            </p>
            <div class="hero-actions">
                <a class="button" href="${pageContext.request.contextPath}/register">Start for free</a>
                <a class="button-secondary" href="${pageContext.request.contextPath}/login">I already have an account</a>
            </div>
        </div>

        <div class="hero-side">
            <div class="feature-card">
                <strong>Simple flow</strong>
                <p>Register, sign in, add learning topics, and keep a tidy overview without clutter.</p>
            </div>
            <div class="feature-card">
                <strong>Consistent design</strong>
                <p>Every screen shares the same visual language so the app feels cohesive and easy to use.</p>
            </div>
            <div class="feature-card">
                <strong>Built for clarity</strong>
                <p>Readable spacing, soft contrast, and clear actions keep the interface neat on desktop and mobile.</p>
            </div>
        </div>
    </section>
</main>
</body>
</html>
