<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctors</title>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/doctor.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/popup.css">

    <!-- FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800&display=swap"
          rel="stylesheet">

    <!-- ICONS -->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>

<!-- SIDEBAR-->
<div class="sidebar">
    <div class="logo-content">
        <div class="logo">
            <i class='bx bxs-capsule'></i>
            <div class="logo-name">Capsule Clinic</div>
        </div>
        <i class='bx bx-menu' id="btn"></i>
    </div>
    <ul class="nav-list">
        <li>
            <a href="#">
                <i class='bx bx-user'></i>
                <span class="links-name">Doctors</span>
            </a>
            <span class="tooltip">Doctors</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-group'></i>
                <span class="links-name">Patients</span>
            </a>
            <span class="tooltip">Patients</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-book-heart'></i>
                <span class="links-name">Visits</span>
            </a>
            <span class="tooltip">Visits</span>
        </li>
    </ul>
    <div class="profile-content">
        <div class="profile">
            <div class="profile-details">
                <img src="../portrait-white-man-isolated_53876-40306.webp">
                <div class="name-job">
                    <div class="name">Steve Hostil</div>
                    <div class="job">Administrator</div>
                </div>
                <i class='bx bx-log-out' id="log-out"></i>
            </div>
        </div>
    </div>
</div>
<!-- END OF SIDEBAR-->

<!-- MAIN CONTENT -->
<div class="main-content">
    <div class="header">Doctors</div>
    <div class="search-block">
        <div class="search">
            <div class="search-title">
                <p>Search</p>
            </div>
            <div class="search-form">
                <input type="text">
                <button class="button"><i class='bx bx-search'></i></button>
            </div>
        </div>
        <div class="add-new">
            <button class="button" id="add-button" onclick="showPopup()">Add new</button>
        </div>
    </div>
    <div class="sort">Sort by</div>
    <div class="table">
        <table>
            <thead>
            <tr>
                <th>Id</th>
                <th>First name</th>
                <th>Last name</th>
                <th>Specialization</th>
                <th>Phone number</th>
                <th>Email</th>
                <th>edit</th>
                <th>delete</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>John</td>
                <td>Monter</td>
                <td>LORE</td>
                <td>380952224411</td>
                <td>john@gmail.com</td>
                <td>
                    <button class="table-button">Edit</button>
                </td>
                <td>
                    <button class="table-button del">Delete</button>
                </td>
            </tr>
            <c:forEach var="doctor" items="${doctorsList}">
                <tr>
                    <td><c:out value="${doctor.id}"/></td>
                    <td><c:out value="${doctor.firstName}"/></td>
                    <td><c:out value="${doctor.lastName}"/></td>
                    <td><c:out value="${doctor.specialization}"/></td>
                    <td><c:out value="${doctor.phoneNumber}"/></td>
                    <td><c:out value="${doctor.email}"/></td>
                    <td>
                        <form action="?act=edit" method="get">
                            <input type="submit" value="Edit" class="table-button" onclick="showPopup()">
                        </form>
                    </td>
                    <td>
                        <button class="table-button del">Delete</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<!-- END OF MAIN CONTENT -->

<!-- POPUP -->
<div class="popup-outer">
    <div class="popup-box">
        <i class="bx bx-x close-button" onclick="closePopup();"></i>
        <div class="popup-content">
            <div class="popup-title">
                Add new doctor
            </div>
            <form action="?act=insert" method="post">
                <div class="popup-form">
                    <div class="input-block">
                        <label>First name</label>
                        <input type="text" name="firstName" class="form-input"
                               value="<c:out value='${doctor.firstName}' />" required>
                    </div>
                    <div class="input-block">
                        <label>Last name</label>
                        <input type="text" name="lastName" class="form-input"
                               value="<c:out value='${doctor.lastName}' />" required>
                    </div>
                    <div class="input-block">
                        <label>Specialization</label>
                        <select name="specialization" required>
                            <option value="<c:out value='${doctor.specialization}'/>" hidden></option>
                            <option>LORE</option>
                            <option>DENTIST</option>
                            <option>OPHTHALMOLOGIST</option>
                            <option>SURGEON</option>
                        </select>
                    </div>
                    <div class="input-block">
                        <label>Phone number</label>
                        <input type="text" name="phoneNumber" class="form-input"
                               value="<c:out value='${doctor.phoneNumber}' />" required>
                    </div>
                    <div class="input-block">
                        <label>Email</label>
                        <input type="text" name="email" class="form-input"
                               value="<c:out value='${doctor.email}' />" required>
                    </div>
                </div>
                <div class="submit-button">
                    <input type="submit" value="Submit" onsubmit="closePopup()">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- END OF POPUP -->

<!-- JAVASCRIPT -->
<script src="../js/sidebar.js"></script>
<script src="../js/popup.js"></script>

</body>
</html>
