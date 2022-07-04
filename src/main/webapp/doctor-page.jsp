<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: tomato">
        <div>
            <a href="https://www.javaguides.net" class="navbar-brand"> Hospital App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list"
                   class="nav-link">Doctors</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center">DOCTORS</h3>
        <hr>
        <div class="container text-left">
            <c:if test="${doctor != null}">
            <form action="update" method="post">
                </c:if>
                <c:if test="${doctor == null}">
                <form action="insert" method="post">
                    </c:if>
                    <caption>
                        <h2>
                            <c:if test="${doctor == null}">
                                Add New Doctor
                            </c:if>

                            <c:if test="${doctor != null}">
                                Edit Doctor
                            </c:if>
                        </h2>
                    </caption>
                    <c:if test="${doctor != null}">
                        <fieldset class="form-group" hidden>
                            <label>Id</label> <input type="text"
                                                     value="<c:out value='${doctor.id}' />" class="form-control"
                                                     name="id" required="required">
                        </fieldset>
                    </c:if>
                    <fieldset class="form-group">
                        <label>First Name </label> <input type="text"
                                                          value="<c:out value='${doctor.firstName}' />"
                                                          class="form-control"
                                                          name="firstName" required="required">
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Last Name</label> <input type="text"
                                                        value="<c:out value='${doctor.lastName}' />"
                                                        class="form-control"
                                                        name="lastName" required="required">
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Specialization</label>
                        <select class="form-control" name="specialization" required="required">
                            <c:if test="${doctor == null}">
                                <option hidden>Select specialization</option>
                            </c:if>
                            <c:if test="${doctor != null}">
                                <option value="<c:out value='${doctor.specialization}' />" hidden></option>
                            </c:if>
                            <option>LORE</option>
                            <option>DENTIST</option>
                            <option>OPHTHALMOLOGIST</option>
                            <option>SURGEON</option>
                        </select>
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Phone Number</label> <input type="text"
                                                           value="<c:out value='${doctor.phoneNumber}' />"
                                                           class="form-control"
                                                           name="phoneNumber" required="required">
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Email</label> <input type="text"
                                                    value="<c:out value='${doctor.email}' />" class="form-control"
                                                    name="email" required="required">
                    </fieldset>
                    <button type="submit" class="btn btn-success">Save</button>
                </form>
        </div>
        <br>

        <div style="width: 70%; background: deepskyblue" align="center">
            <h2>Filter</h2>
            <form action="filter" method="get">
                <label>Specialization</label>
                <select class="form-control" name="spec" required="required">
                    <c:if test="${spec == null}">
                        <option hidden>Select specialization</option>
                    </c:if>
                    <c:if test="${spec != null}">
                        <option value="<c:out value='${spec}' />" hidden></option>
                    </c:if>
                    <option>LORE</option>
                    <option>DENTIST</option>
                    <option>OPHTHALMOLOGIST</option>
                    <option>SURGEON</option>
                </select>
                <input type="submit">
            </form>
        </div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Specialization</th>
                <th>Phone Number</th>
                <th>Email</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="doctor" items="${doctorsList}">
                <tr>
                    <td><c:out value="${doctor.id}"/></td>
                    <td><c:out value="${doctor.firstName}"/></td>
                    <td><c:out value="${doctor.lastName}"/></td>
                    <td><c:out value="${doctor.specialization}"/></td>
                    <td><c:out value="${doctor.phoneNumber}"/></td>
                    <td><c:out value="${doctor.email}"/></td>
                    <td><a href="edit?id=<c:out value='${doctor.id}' />">Edit</a>
                        <br>
                        <a href="delete?id=<c:out value='${doctor.id}' />">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>
</div>
</body>
</html>
