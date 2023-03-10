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
    </head>
    <body>

        <c:if test="${sessionScope.account.roleId != 1}">
            <jsp:include page="NotFound.jsp"></jsp:include>
        </c:if>
        <c:if test="${sessionScope.account.roleId == 1}">
            <jsp:include page="header.jsp"></jsp:include>
                <!-- ======= Hero Section ======= -->
            <section class="vh-100 mt-5">
                <div class="container-fluid h-custom">
                    <div class="row d-flex justify-content-start align-items-center h-100">
                        <!-- Login part -->
                        <div class="col-md-8 col-lg-8 col-xl-6 offset-xl-1">
                            <h2 class="text-center text-primary fw-bold">Edit Request</h2>
                            <form class="" action="UpdateRequest" method="post">
                                <div class="col-md-2 form-outline mb-4">
                                        <label class="form-label">Request ID</label>
                                        <input name="requestID" class="form-control" type="text" value="${requestID}" readonly>   
                                </div>
                                    <div class="col-md-5 form-outline mb-4">
                                        <label class="form-label">Request Title</label>
                                        <input name="requestTitle" type="text" class="form-control form-control-lg" value="${title}" />   
                                </div>
                                <div class="form-outline mb-3">
                                    <label class="form-label">Request Content</label>
                                    <input name="requestContent" type="text" class="form-control form-control-lg"  value="${content}" />
                                </div>
                                <div class="col-md-4 form-outline mb-3">
                                    <label class="form-label">Deadline</label>
                                    <input name="deadline" type="date" class="form-control form-control-lg"  value="${deadline}" />
                                </div>
                                <div class="text-center text-lg-start mt-4 pt-2 mb-4">
                                    <button type="submit" class="btn btn-outline-success btn-lg"style="padding-left: 2.5rem; padding-right: 2.5rem;">
                                        SAVE
                                    </button>
                                    The mentor support for this request will not change
                                </div>
                            </form>
                                <div class="text-center text-lg-start mt-4 pt-2 mb-4">
                                    <a href="#" class="btn btn-outline-primary btn-lg"style="padding-left: 2.5rem; padding-right: 2.5rem;">
                                        FIND MENTOR
                                    </a>
                                </div> 
                            <p class="text-danger my-4 fw-bold">
                                ${errorMessage}
                            </p>
                        </div>
                    </div>
                </div>           
            </section>
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
