<%-- 
    Document   : HomePage
    Created on : Jan 28, 2023, 5:25:10 PM
    Author     : okanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">


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

        <c:if test="${sessionScope.account == null}">
            <jsp:include page="NotFound.jsp"></jsp:include>
        </c:if>
        <c:if test="${sessionScope.account != null}">
            <jsp:include page="header.jsp"></jsp:include>
                <section class="breadcrumbs">
                    <div class="container">

                        <div class="d-flex justify-content-between align-items-center">
                            <h2>Profile</h2>
                        </div>

                    </div>
                </section><!-- End Our Portfolio Section -->

                <!-- ======= Hero Section ======= -->
                <section id="portfolio-details" class="portfolio-details">
                    <div class="container">
                        <div class="row gy-4">
                            <div class="col-lg-4 mx-4">
                            <c:if test="${sessionScope.account.acc.roleId == 1}">
                                <div>
                                    <a class="btn btn-outline-primary my-4" href="EditMenteeProfile.jsp">Edit Profile</a>
                                </div>
                            </c:if>
                                <div class="portfolio-info">
                                    <h3>${mentee.firstName} ${mentee.lastName}</h3>
                                <ul>
                                    <li><strong>Email</strong>: ${mentee.email}</li>
                                    <li><strong>Address</strong>: ${mentee.address}</li>
                                    <li><strong>Phone</strong>: ${mentee.phone}</li>
                                    <li><strong>Birthday</strong>: ${mentee.birthday}</li>
                                    <li><strong>Gender</strong>: ${mentee.sex}</li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-6 mx-5">
                            <div>
                                <h3 class="">Avatar</h3>
                            </div>
                            <div class="portfolio-details-slider swiper">
                                <img src="assets/img/${mentee.avatar}" alt=""/>
                            </div>
                        </div>
                    </div>
                </div>
            </section><!-- End Portfolio Details Section -->

            <jsp:include page="Footer.jsp"></jsp:include>
        </c:if>
        <!-- Vendor JS Files -->
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>
