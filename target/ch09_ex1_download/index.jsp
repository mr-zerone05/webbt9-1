<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Download Application</title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
    <h1>Download Application</h1>

    <c:if test="${not empty cookie.firstName.value}">
        <h2>Welcome back, <c:out value="${cookie.firstName.value}" />!</h2>
    </c:if>

    <p><a href="register.jsp">Register</a></p>
    <p><a href="view_cookies.jsp">View Cookies</a></p>
</body>
</html>

