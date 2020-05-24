<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <title>Admin Page</title>
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
            <h2><a href="/admin">
                <button type="button" class="btn btn-secondary">User's list</button>
            </a></h2>
        </div>
    </nav>
</header>

<div class="row">

    <div class="container">
        <h1 class="text-center">User's list</h1>
        <hr>
        <div class="container text-left">
            <a href="/admin/create" class="btn btn-primary">Add New User</a>
        </div>
        <br>

        <table class="table table-bordered">
            <thead>
            <tr class="active">
                <th>ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Email</th>
                <th>Location</th>
                <th>Password</th>
                <th>Role</th>
                <th>Options</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="user" items="${listUser}">


                <!-- construct an "update" link with customer id -->
                <c:url var="updateLink" value="/admin/update">
                    <c:param name="id" value="${user.id}"/>
                </c:url>

                <!-- construct an "delete" link with customer id -->
                <c:url var="deleteLink" value="/admin/delete">
                    <c:param name="id" value="${user.id}"/>
                </c:url>

                <tr>
                    <td><c:out value="${user.id}"/></td>
                    <td><c:out value="${user.name}"/></td>
                    <td><c:out value="${user.age}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.location}"/></td>
                    <td><c:out value="${user.password}"/></td>
                    <td>
                        <c:forEach items="${user.roles}" var="item">
                            ${item.roleName}<br>
                        </c:forEach>
                    </td>

                    <td>
                        <a href="${updateLink}">
                            <button type="button" class="btn btn-primary">Edit</button>
                        </a>
                        <a href="${deleteLink}">
                            <button type="button" class="btn btn-primary">Delete</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>

        <a href="/user">
            <button type="button" class="btn btn-primary">User Page</button>
        </a>

        <a href="/logout">
            <button type="button" class="btn btn-primary">LogOut</button>
        </a>
    </div>

</div>
</body>
</html>