<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <title>Add User Page</title>
</head>

<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: dodgerblue">
        <div>
            <h1>My first CRUD Application</h1>
            <h2><a href="/admin">
                <button type="button" class="btn btn-secondary">User's list</button>
            </a></h2>
        </div>
    </nav>
</header>

<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <c:if test="${user != null}">
            <form action="/admin/update" method="post">
                </c:if>
                <c:if test="${user == null}">
                <form action="/admin/create" method="post" ModelAttribute="user">
                    </c:if>

                    <caption>
                        <h2>
                            <c:if test="${user != null}">
                                Edit User
                            </c:if>
                            <c:if test="${user == null}">
                                Add New User
                            </c:if>
                        </h2>
                    </caption>

                    <c:if test="${user != null}">
                        <input type="hidden" name="id" value="<c:out value='${user.id}' />"/>
                    </c:if>

                    <fieldset class="form-group">
                        <label>User Name</label> <input type="text"
                                                        value="<c:out value='${user.name}' />"
                                                        class="form-control"
                                                        name="name" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>User Age</label> <input type="number"
                                                       value="<c:out value='${user.age}' />"
                                                       class="form-control"
                                                       name="age" required="required">
                    </fieldset>


                    <fieldset class="form-group">
                        <label>User Email</label> <input type="email"
                                                         value="<c:out value='${user.email}' />"
                                                         class="form-control"
                                                         name="email">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>User Location</label> <input type="text"
                                                            value="<c:out value='${user.location}' />"
                                                            class="form-control"
                                                            name="location">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Password</label> <input type="text"
                                                       value="<c:out value='${user.password}' />"
                                                       class="form-control"
                                                       name="password">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Role</label>

                        <td>
                            <input type="radio" name="role" value="user"/> user
                            <input type="radio" name="role" value="admin"/> admin
                        </td>
                    </fieldset>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
        </div>
    </div>
</div>
</body>
</html>