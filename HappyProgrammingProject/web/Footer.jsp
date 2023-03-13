<%-- 
    Document   : Footer
    Created on : Feb 8, 2023, 10:10:38 AM
    Author     : okanh
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
        <!-- ======= Footer ======= -->
        <footer id="footer" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500">
        </div>
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 footer-links">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><i class="bx bx-chevron-right"></i> <a href="HomePage.jsp">Home</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="ViewAllMentor">Mentor</a></li>
                            <c:if test="${sessionScope.account == null}">
                                <li><i class="bx bx-chevron-right"></i> <a href="SignIn.jsp">Sign In</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="SignUp">Sign Up</a></li>
                            </c:if>
                        </ul>
                    </div>
                    <div class="col-lg-4 col-md-6 footer-contact">
                        <h4>Contact Us</h4>
                        <p>
                            <strong>Address: </strong>Thach Hoa, Thach That,Ha Noi,<br>Viet Nam <br>
                            <strong>Phone:</strong> 0367897478<br>
                            <strong>Email:</strong> HappyProgramming@gmail.com<br>
                        </p>
                    </div>
                    <div class="col-lg-4 col-md-6 footer-info">
                        <h3>About Happy Programming</h3>
                        <p>This project is aimed at developing an online Happy Programming system which mainly to allow
                            mentors, mentees and other actorsto connect online and support mentee to learn programming.</p>
                        <div class="social-links mt-3">
                            <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                            <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                            <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                            <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="copyright">
                &copy; Copyright <strong><span>Team 3</span></strong>. All Rights Reserved
            </div>
        </div>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    </footer><!-- End Footer -->
</body>
</html>
