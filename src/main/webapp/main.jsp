<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
</head>
<body>
<p>
    <security:authorize access="isAuthenticated()">
        Hello! It's main page, <security:authentication property="principal.username" />
    </security:authorize>
    <security:authorize access="!isAuthenticated()">
        Hello! It's main page. You are not logged in!
    </security:authorize>
</p>

br>

Click <a href="<c:url value="/login" /> ">login</a>
to authentication for necessary authorities.


<a href="<c:url value="/logout"/>">
    <button type="button" class="btn btn-primary">LogOut</button>
</a>
</body>
</html>
