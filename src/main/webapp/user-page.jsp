<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <title>User Page</title>
</head>

<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: dodgerblue">
        <div>
            <h1>My first CRUD Application</h1>
            <p>
            <h2>
                <security:authorize access="isAuthenticated()">
                    User name - <security:authentication property="principal.username"/>
                </security:authorize>
            </h2>
            </p>
        </div>
    </nav>
</header>

<br>

<p>
<h2><security:authorize access="isAuthenticated()">
    Hello, <security:authentication property="principal.username"/>, it's My first CRUD Application
</security:authorize>
</h2>
</p>

<br>

<a href="/admin">
    <button type="button" class="btn btn-primary">Admin Page</button>
</a>

<a href="/">
    <button type="button" class="btn btn-primary">Main Page</button>
</a>

<a href="/logout">
    <button type="button" class="btn btn-primary">LogOut</button>
</a>

</body>
</html>