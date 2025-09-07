<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>View Cookies</title>
    <link rel="stylesheet" href="css/cookie.css">
</head>
<body>
    <h1>Cookies</h1>
    <p>First Name: <c:out value="${cookie.firstName.value}" /></p>
    <p>Last Name: <c:out value="${cookie.lastName.value}" /></p>
    <p>Email: <c:out value="${cookie.email.value}" /></p>

    <p><a href="index.jsp">Back to Home</a></p>
</body>
</html>
