<%--
  Created by IntelliJ IDEA.
  User: karki
  Date: 4/3/2026
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.learninglog.learninglogproject.topic.model.User" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String errorMsg = (String) request.getAttribute("errors");
    if(errorMsg==null){
        errorMsg="";
    }
    User userObj= (User) session.getAttribute("user");
    int userId = 0;
    if(userObj != null){
        userId=userObj.getId();
    }
%>
<p style="color: red"><%= errorMsg %></p>
<form method="post" action="topic">
    <label>Action</label>: <input type="text" value="add" name="action"><br>
    <label>User Id</label>: <input type="text" value="<%=userId%>" name="user-id" disabled><br>
    <label>Topic Name</label>: <input type="text" value="" name="topic-name"><br>
    <button>Add Topic</button>
</form>

</body>
</html>
