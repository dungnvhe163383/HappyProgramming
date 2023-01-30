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
        <header id="header" class="fixed-top d-flex align-items-center ">
            <div class="container d-flex justify-content-between align-items-center">

                <div class="logo">
                    <h1 class="text-light"><a href="HomePage.jsp"><span>CODELEARN</span></a></h1>
                    <!-- Uncomment below if you prefer to use an image logo -->
                    <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
                </div>

                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a class="" href="HomePage.jsp">Home</a></li>
                        <li><a href="ViewMentor.jsp">Mentor</a></li>
                        <li><a href="SignIn.jsp">Sign In</a></li>
                        <li><a href="SignUp.jsp">Sign Up</a></li>
                        <!--          <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
                                    <ul>
                                      <li><a href="#">Drop Down 1</a></li>
                                      <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                                        <ul>
                                          <li><a href="#">Deep Drop Down 1</a></li>
                                          <li><a href="#">Deep Drop Down 2</a></li>
                                          <li><a href="#">Deep Drop Down 3</a></li>
                                          <li><a href="#">Deep Drop Down 4</a></li>
                                          <li><a href="#">Deep Drop Down 5</a></li>
                                        </ul>
                                      </li>
                                      <li><a href="#">Drop Down 2</a></li>
                                      <li><a href="#">Drop Down 3</a></li>
                                      <li><a href="#">Drop Down 4</a></li>
                                    </ul>
                                  </li>-->
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->

            </div>
        </header><!-- End Header -->
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
                        <div class="col-lg-4 col-md-6 portfolio-wrap filter-app">
                            <div class="portfolio-item">
                                <img src="${o.avatar}" class="img-fluid" alt="">
                                <div class="portfolio-info">
                                    <h3>${o.fullname}</h3>
                                    <div>
                                        <a href="assets/img/portfolio/portfolio-1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
                                        <a href="MentorDetail.html" title="Portfolio Details"><i class="bx bx-link"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>   
        </main>
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
