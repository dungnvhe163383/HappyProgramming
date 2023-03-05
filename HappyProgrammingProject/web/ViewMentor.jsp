<%-- 
    Document   : ViewMentor
    Created on : Jan 30, 2023, 8:58:56 AM
    Author     : okanh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View mentor</title>
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
        <!-- ======= Header ======= -->
        <jsp:include page="header.jsp"></jsp:include>
            <main id="main">

                <!-- ======= Our Portfolio Section ======= -->
                <section class="breadcrumbs">
                    <div class="container">

                        <div class="d-flex justify-content-between align-items-center">
                            <h2>MENTORS</h2>
                        </div>

                    </div>
                </section><!-- End Our Portfolio Section -->

                <!-- ======= Portfolio Section ======= -->
                <div class="container">
                    <div class="row portfolio-container" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500">
                    <c:forEach items="${listMentor}" var="o">
                        <section class="team" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500">
                            <div class="container">

                                <div class="row">

                                    <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                                        <div class="member">
                                            <div class="member-img">
                                                <img src="assets/img/mentor/${o.avatar}" class="img-fluid" alt="">
                                                <div class="social">
                                                    <a href=""><i class="bi bi-twitter"></i></a>
                                                    <a href=""><i class="bi bi-facebook"></i></a>
                                                    <a href=""><i class="bi bi-instagram"></i></a>
                                                    <a href=""><i class="bi bi-linkedin"></i></a>
                                                </div>
                                            </div>
                                            <div class="member-info">
                                                <h4>${o.firstname} ${o.lastname}</h4>
                                                <span>Chief Executive Officer</span>
                                                <p>${o.introduce}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </c:forEach>
                </div>
            </div>   
        </main>
        <jsp:include page="Footer.jsp"></jsp:include>
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
