<%-- 
    Document   : header
    Created on : Jan 30, 2023, 2:23:49 PM
    Author     : manuh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,700,700i&display=swap" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <header id="header" class="fixed-top d-flex align-items-center ">
            <div class="container d-flex justify-content-between align-items-center">
                <div class="logo">
                    <h1 class="text-light"><a href="HomePage.jsp"><span>CODELEARN</span></a></h1>
                </div>
                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a class="" href="HomePage.jsp">Home</a></li>
                        <li><a href="ViewAllMentor">Mentor</a></li>
                        <c:if test="${sessionScope.account.roleId== 1}">
                        <li><a href="CreateRequest">New Request</a></li>
                        </c:if>
                        <c:if test="${sessionScope.account.roleId== 3}">
                        <li><a href="ShowAllRequestByAdmin">Show All Request</a></li>
                        </c:if>
                        <c:if test="${sessionScope.account == null}">
                        <li><a href="SignIn.jsp">Sign In</a></li>
                        </c:if>
                        <c:if test="${sessionScope.account == null}">
                        <li><a href="SignUp">Sign Up</a></li>
                        </c:if>
                          <c:if test="${sessionScope.account.roleId == 1}">
                         <li><a href="ViewHireInvitation?id=${sessionScope.account.id}">Hire Invitations</a></li>
                        </c:if>
                          <c:if test="${sessionScope.account.roleId == 2}">
                         <li><a href="HireInvitationByMentor?id=${sessionScope.account.id}">Hire Invitations</a></li>
                        </c:if>
                         <c:if test="${sessionScope.account.roleId == 3}">
                         <li><a href="ViewAllUser">Users</a></li>
                        </c:if>
                        <c:if test="${sessionScope.account != null}">
                        <li class="dropdown"><a href="#"><span>Setting</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <c:if test="${sessionScope.account.roleId == 1}">
                                    <li><a href="viewMenteeProfile?menteeID=${sessionScope.account.id}">Profile</a></li>
                                </c:if>
                                <c:if test="${sessionScope.account.roleId == 1}">
                                    <li><a href="viewRequestByMentee?menteeid=${sessionScope.account.id}">My Request</a></li>
                                </c:if>
                                <c:if test="${sessionScope.account.roleId == 1 || sessionScope.account.roleId == 2}">
                                    <li><a href="RequestHistory?id=${sessionScope.account.id}">Request History</a></li>
                                </c:if>
                                <c:if test="${sessionScope.account != null}">
                                    <li><a href="ChangePassword.jsp">Change Password</a></li>
                                </c:if>
                                <c:if test="${sessionScope.account != null}">
                                    <li><a href="signOut">Sign Out</a></li>
                                </c:if> 
                            </ul>
                        </li>
                        </c:if>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav>
            </div>
        </header><!-- End Header -->
    </body>
</html>
