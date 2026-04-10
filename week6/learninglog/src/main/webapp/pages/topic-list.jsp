<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Topic List | LearningLog</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
</head>
<body>
<main class="page-shell">
    <header class="topbar">
        <div class="brand">
            <div class="brand-mark">LL</div>
            <div>
                <p class="eyebrow">Topics</p>
                <h2>All learning topics</h2>
            </div>
        </div>
        <nav class="nav-links">
            <a class="nav-link" href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/topic">Add topic</a>
            <a class="nav-link active" href="${pageContext.request.contextPath}/topic?page=list">Topic list</a>
        </nav>
    </header>

    <section class="table-shell">
        <div class="table-header">
            <div>
                <span class="eyebrow-pill">Structured overview</span>
                <h2 class="table-title" style="margin-top: 14px;">Review every topic in one neat table.</h2>
                <p class="lead" style="margin-top: 10px;">The full list uses the same spacing, colors, and interaction style as the rest of the app.</p>
            </div>
            <div class="table-tools">
                <span class="badge">${empty topics ? 0 : topics.size()} topics</span>
                <a class="button" href="${pageContext.request.contextPath}/topic">Add new topic</a>
            </div>
        </div>

        <c:if test="${not empty error}">
            <div style="padding: 20px 28px 0;">
                <div class="alert">${error}</div>
            </div>
        </c:if>

        <c:choose>
            <c:when test="${not empty topics}">
                <table>
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Topic</th>
                        <th>User</th>
                        <th>Created</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${topics}">
                        <tr>
                            <td>${obj.getId()}</td>
                            <td>${obj.getName()}</td>
                            <td>#${obj.getUserId()}</td>
                            <td>${obj.getCreatedAt()}</td>
                            <td class="actions-row">
                                <a class="button-ghost" href="${pageContext.request.contextPath}/topic?page=edit&id=${t.getId()}">Edit</a>
                                <a class="button-danger" href="${pageContext.request.contextPath}/topic?page=delete&id=${t.getId()}">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div style="padding: 28px;">
                    <div class="empty-state">
                        No topics found yet. Start by adding your first topic to build your learning log.
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </section>
</main>
</body>
</html>
