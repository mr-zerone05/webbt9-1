<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h1>Register</h1>
    <form action="register" method="post">
        <label for="firstName">First Name:</label>
        <input type="text" name="firstName" id="firstName"
               value="<c:out value='${param.firstName}' />" /><br/>

        <label for="lastName">Last Name:</label>
        <input type="text" name="lastName" id="lastName"
               value="<c:out value='${param.lastName}' />" /><br/>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email"
               value="<c:out value='${param.email}' />" /><br/>

        <input type="submit" value="Register"/>
    </form>
</body>
</html>

