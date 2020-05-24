<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <title>Main Page</title>
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: dodgerblue">
        <div>
            <h1>My first CRUD Application</h1>
        </div>
    </nav>
</header>

<br>

<h2>
    <p>
        <security:authorize access="isAuthenticated()">
            Hello! It's main page, <security:authentication property="principal.username"/>
        </security:authorize>
        <security:authorize access="!isAuthenticated()">
            Hello! It's main page. You are not logged in!
        </security:authorize>
    </p>
</h2>

<br>

<br>
<a href="<c:url value="/logout"/>">
    <button type="button" class="btn btn-primary">LogOut</button>
</a>
</body>
</html>
