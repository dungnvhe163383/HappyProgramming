<%-- 
    Document   : ViewRateAndComment
    Created on : Mar 7, 2023, 10:59:15 PM
    Author     : okanh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "DAO.*" %>
<%@page import = "DTO.*" %>
<%@page import = "java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>About - Moderna Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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

  <!-- =======================================================
  * Template Name: Moderna - v4.11.0
  * Template URL: https://bootstrapmade.com/free-bootstrap-template-corporate-moderna/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
<% 
            List<Feedback> list = (List<Feedback>) request.getAttribute("comment");
            double average=(double) request.getAttribute("average");
        %>
  <!-- ======= Header ======= -->
  <jsp:include page="header.jsp"></jsp:include>

  <main id="main">

    <!-- ======= About Us Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Feedback</h2>
        </div>

      </div>
    </section><!-- End About Us Section -->

    <!-- ======= About Section ======= -->
    <section class="about" data-aos="fade-up">
      <div class="container">

        <div class="row">
          <div class="col-lg-6">
            <img src="assets/img/mentor/${mentor.avatar}" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0">
              <h3>${mentor.firstname} ${mentor.lastname}</h3>
            <p class="fst-italic">
                ${mentor.introduce}
            </p>
            <p>Profession:</p>
            <ul>
                <c:forEach items="${profession}" var="p">
                    <li><i class="bi bi-check2-circle">${p.profession}: ${p.professionIntroduce} </i></li>
                </c:forEach>
              
            </ul>
            <p>
              This is my skill and rating with som comment about me
            </p>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->
    <!-- ======= Our Skills Section ======= -->
    <section class="skills" data-aos="fade-up">
      <div class="container">

        <div class="section-title">
          <h2>My Skills</h2>
          <p>Skills make us develop ourself</p>
        </div>

        <div class="skills-content">
          <c:forEach items="${skill}" var="s">             
                  <div class="progress">
            <div class="progress-bar bg-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
              <span class="skill">${s.name} <i class="val">100%</i></span>
            </div>
            </div>
          </c:forEach>

        </div>

      </div>
    </section><!-- End Our Skills Section -->

    <section class="skills" data-aos="fade-up">
      <div class="container">

        <div class="section-title">
          <h2>Rate</h2>
           <p>Average Rate: <%= average %></p>   
             <% for(int i=1;i<=average;i++) { %>
            <span content="\2B50">&#11088;</span>
             <% } %>
        </div>

      </div>
    </section><!-- End Our Skills Section -->
    <!-- ======= Tetstimonials Section ======= -->
    <section class="testimonials" data-aos="fade-up">
      <div class="container">

        <div class="section-title">
          <h2>Comment</h2>
        </div>
        
        <div class="testimonials-carousel swiper">
          <div class="swiper-wrapper">
            <% for (Feedback f : list) {%>
            <div class="testimonial-item swiper-slide">
              <img src="assets/img/<%= f.getMentee().getAvatar() %>" class="testimonial-img" alt="">
              <h3><%= f.getMentee().getFirstName() %> <%= f.getMentee().getLastName() %></h3>
              <h4>Favorite mentee</h4>
              <p>
                <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              <h3><%= f.getCommentDetail() %></h3>
                <i class="bx bxs-quote-alt-right quote-icon-right"></i>
              </p>
            </div>
            <% } %>
          
          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section><!-- End Ttstimonials Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
    <jsp:include page="Footer.jsp"></jsp:include>


  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
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

