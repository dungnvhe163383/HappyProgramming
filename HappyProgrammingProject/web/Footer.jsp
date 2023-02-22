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

            <div class="footer-newsletter">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <h4>Search Mentor</h4>
                            <p>Find your Mentor you want</p>
                        </div>
                        <div class="col-lg-6">
                            <ul>
                                <form action="Search mentor" method="post">
                                    <input type="text" name="username" value="${inputMentee}"><a href="Search.jsp">   Search</a></li>
                                </form>
                            </ul>    
                        </div>    
                    </div>
                </div>
            </div>
            <c:if test="${sessionScope.account.roleId == 1}">  
            <br class="breadcrumb">
            <div class="footer-newsletter">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3">
                            <h4>Search Request History</h4>
                            <h6>Input part of title in Request to Search</h6>
                        </div>
                        <div class="col-lg-3">
                            <form action="SearchRequestHistory" method="post">
                                <input type="text" name="keyword" value=""> <button type="submit" > Search</button>
                            </form>
                        </div>    
                    </div>
                </div>
            <br class="breadcrumb">
            </c:if>
            </div>
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 col-md-6 footer-links">
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
                        <%--<div class="form-outline mb-4">
                                                        <label class="form-label">Username</label>
                                                        <input name="username" type="text" class="form-control form-control-lg" value="${inputUsername}" />   
                                                    </div>--%>  

                        <div class="col-lg-3 col-md-6 footer-contact">
                            <h4>Contact Us</h4>
                            <p>
                                Thach Hoa, Thach That <br>
                                Ha Noi<br>
                                Viet Nam <br><br>
                                <strong>Phone:</strong> 0367897478<br>
                                <strong>Email:</strong> HappyProgramming@gmail.com<br>
                            </p>

                        </div>

                        <div class="col-lg-3 col-md-6 footer-info">
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

        </footer><!-- End Footer -->
    </body>
</html>
