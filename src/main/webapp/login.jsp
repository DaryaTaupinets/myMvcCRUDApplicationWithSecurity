<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <title>Login Form</title>
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

<div>
    <h2>
        <c:if test="${not empty sessionScope.msg}">
            <span style="color: red"><c:out value="${sessionScope.msg}"/></span>
            <c:remove var="msg" scope="session"/>
        </c:if>
    </h2>
</div>

<br>
<h2>Hello! Please, enter your login and password</h2>


<form class="auth-form" method="POST">

    <div class="d-inline-flex p-2 bd-highlight">
        <div class="container-fluid mt3">

            <fieldset>
                <div class="form-group">
                    <input type="text" name="username" id="username" class="form-control input-lg"
                           placeholder="Login">
                </div>
                <div class="form-group">
                    <input type="password" name="password" id="password" class="form-control input-lg"
                           placeholder="Password">
                </div>
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <input type="submit" class="btn btn-lg btn-primary btn-block" value="Login">
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</form>
</body>
</html>
