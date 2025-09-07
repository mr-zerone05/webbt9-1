<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Thank You</title>
    <link rel="stylesheet" href="css/thank.css">
</head>
<body>
    <h2>Thanks for registering!</h2>
    <p>Hello, <c:out value="${cookie.firstName.value}" /> <c:out value="${cookie.lastName.value}" />.</p>
    <p>Your info has been saved in cookies.</p>
    <p><a href="index.jsp">Return to home</a></p>
</body>
</html>

