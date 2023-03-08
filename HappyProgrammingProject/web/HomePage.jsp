<%-- 
    Document   : HomePage
    Created on : Jan 28, 2023, 5:25:10 PM
    Author     : okanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "DAO.*" %>
<%@page import = "DTO.*" %>
<%@page import = "java.util.*" %>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>HomePage</title>

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,700,700i&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        <link href="assets/css/RateStar.css" rel="stylesheet">
    </head>
    <body>          
        
        <!-- ======= Header ======= -->
        <jsp:include page="header.jsp"></jsp:include>


            <!-- ======= Hero Section ======= -->
            <% DAO dao=new DAO();
                List<Mentor> x=  dao.getTop3Mentor(); 
            %>
            <section id="hero" class="d-flex justify-cntent-center align-items-center">
                <div id="heroCarousel" class="container carousel carousel-fade" data-bs-ride="carousel" data-bs-interval="5000">

                    <!-- Slide 1 -->
                    <div class="carousel-item active">
                        <div class="carousel-container">
                            <h2 class="animate__animated animate__fadeInDown">Welcome to <span>CODELEARN</span></h2>
                            <p class="animate__animated animate__fadeInUp">You can bring your programming questions to our advisors for answers. Together, progress in programming and become excellent programmers in the future. Nice to meet you.</p>
                            <a href="" class="btn-get-started animate__animated animate__fadeInUp">Read More</a>
                        </div>
                    </div>

                    <!-- Slide 2 -->
                    <div class="carousel-item">
                        <div class="carousel-container">
                            <h2 class="animate__animated animate__fadeInDown">CODEING TOGETHER</h2>
                            <p class="animate__animated animate__fadeInUp"><img src="assets/img/code.jpg" class="img-fluid" width="350px" height="350px"></p>  
                            <a href="" class="btn-get-started animate__animated animate__fadeInUp">Read More</a>
                        </div>
                    </div>


                    <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon bx bx-chevron-left" aria-hidden="true"></span>
                    </a>

                    <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
                        <span class="carousel-control-next-icon bx bx-chevron-right" aria-hidden="true"></span>
                    </a>

                </div>
            </section><!-- End Hero -->
            <section class="features">
                <div class="container">
                    <div class="section-title">
                        <h2>Outstanding Mentor</h2>
                    </div>
                <% for (Mentor m : x) { %>
                    <div class="row" data-aos="fade-up">
                        <div class="col-md-5">
                            <img src="assets/img/mentor/<%= m.getAvatar() %>" class="img-fluid" alt="" height="350 px" width="350 px" >
                        </div>
                       
                        <div class="col-md-7 pt-4">
                            <h3><strong><%= m.getFirstname() %> <%= m.getLastname() %></strong></h3>
                            <h4>Average Rate: <%= m.getAverageRate() %></h4>   
                             <% for(int i=1;i<=m.getAverageRate();i++) { %>
                             <span content="\2B50">&#11088;</span>
                             <% } %>
                            <h4>Introduce: <%= m.getIntroduce() %></h4>                            
                        </div>
                        
                    </div>
                <% } %>
            </div>
        </section><!-- End Features Section -->
        <!-- ======= Footer ======= -->

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
