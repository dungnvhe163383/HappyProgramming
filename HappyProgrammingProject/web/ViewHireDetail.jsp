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
        <title>Hire Detail</title>
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
        <jsp:include page="header.jsp"></jsp:include>
            <section class="vh-100 mt-5 py-5 px-5">
                <div class="container-fluid h-custom">
                    <div class="row d-flex align-items-center h-100">
                        <div class="col-md-4 col-lg-4 col-xl-4 offset-xl-1">
                            <h2 class="text-start text-primary fw-bold">Hire Detail</h2>
                        </div>
                        <table class="table table-striped mt-4">
                            <thead>
                                <tr class="text-bg-info">
                                    <th scope="col">Hire ID</th>
                                    <th scope="col">Content</th>
                                    <th scope="col">Mentor</th>
                                    <th scope="col">Cost hire</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                <th scope="row">${hire.hireID}</th>
                                <th scope="row">${hire.content}</th>
                                <th scope="row">
                                    <c:forEach items="${mentor}" var="m">
                                         ${m.firstname} ${m.lastname}<br>
                                    </c:forEach>
                                </th>
                                <th scope="row">
                                    <c:forEach items="${mentor}" var="m">
                                         ${m.costHire}<br>
                                    </c:forEach>
                                </th>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
          
        </section>
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
