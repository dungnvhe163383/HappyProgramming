<%-- 
    Document   : HomePage
    Created on : Jan 28, 2023, 5:25:10 PM
    Author     : okanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>HomePage</title>

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
        <link href="assets/css/RateStar.css" rel="stylesheet">
    </head>
    <body>          
        <!-- ======= Header ======= -->
        <jsp:include page="header.jsp"></jsp:include>

            <!-- ======= Hero Section ======= -->
            <section id="hero" class="d-flex justify-cntent-center align-items-center">
                <div id="heroCarousel" class="container carousel carousel-fade" data-bs-ride="carousel" data-bs-interval="5000">

                    <!-- Slide 1 -->
                    <div class="carousel-item active">
                        <div class="carousel-container">
                            <h2 class="animate__animated animate__fadeInDown">Welcome to <span>CODELEARN</span></h2>
                            <p class="animate__animated animate__fadeInUp">You can bring your programming questions to our advisors for answers. Together, progress in programming and become excellent programmers in the future. Nice to meet you.</p>
                        </div>
                    </div>

                    <!-- Slide 2 -->
                    <div class="carousel-item">
                        <div class="carousel-container">
                            <h2 class="animate__animated animate__fadeInDown">CODEING TOGETHER</h2>
                            <p class="animate__animated animate__fadeInUp"><img src="assets/img/code.jpg" class="img-fluid" width="350px" height="350px"></p>
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
                <c:forEach items="${Top3}" var="t">
                    <div class="row" data-aos="fade-up">
                        <div class="col-md-5">
                            <img src="assets/img/${t.avatar}" class="img-fluid" alt="" height="350 px" width="350 px" >
                        </div>
                        <div class="col-md-7 pt-4">
                            <h3><strong>${t.firstname} ${t.lastname}</strong></h3>
                            <h4>Average Rate: ${t.averageRate}</h4>
                            <fieldset class="rate">
                                <input type="radio" id="rating10" name="rating-${t.lastname}" value="5"  disabled="true" checked="true"  /><label for="rating10" title="5 stars"></label>
                                <input type="radio" id="rating9" name="rating-${t.lastname}" value="4.5"  disabled="true"   /><label class="half" for="rating9" title="4.5 stars"></label>
                                <input type="radio" id="rating8" name="rating-${t.lastname}" value="4"  disabled="true"  /><label for="rating8" title="4 stars"></label>
                                <input type="radio" id="rating7" name="rating-${t.lastname}" value="3.5" disabled="true"   /><label class="half" for="rating7" title="3.5 stars"></label>
                                <input type="radio" id="rating6" name="rating-${t.lastname}" value="3" disabled="true"   /><label for="rating6" title="3 stars"></label>
                                <input type="radio" id="rating5" name="rating-${t.lastname}" value="2.5" disabled="true"   /><label class="half" for="rating5" title="2.5 stars"></label>
                                <input type="radio" id="rating4" name="rating-${t.lastname}" value="2" disabled="true"   /><label for="rating4" title="2 stars"></label>
                                <input type="radio" id="rating3" name="rating-${t.lastname}" value="1.5" disabled="true"   /><label class="half" for="rating3" title="1.5 stars"></label>
                                <input type="radio" id="rating2" name="rating-${t.lastname}" value="1" disabled="true"   /><label for="rating2" title="1 star"></label>
                                <input type="radio" id="rating1" name="rating-${t.lastname}" value="0.5" disabled="true"   /><label class="half" for="rating1" title="0.5 star"></label>
                                <input type="radio" id="rating0" name="rating-${t.lastname}" value="0" disabled="true"   /><label for="rating0" title="No star"></label>
                            </fieldset>
                            <h4>Introduce: ${t.introduce}</h4>
                            
                        </div>
                    </div>
                </c:forEach>
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
<!--        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
         $(document).ready(function () {
            var rating = 3;
            $('.star-rating input[value="' + rating + '"]').prop('checked', true).trigger('change');
            });
        </script>-->
    </body>
</html>
