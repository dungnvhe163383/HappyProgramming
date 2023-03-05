<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Edit Mentee Profile</title>

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
            <!-- ======= Hero Section ======= -->
                                    

            <section class="vh-100 mt-5">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-start align-items-center h-100">
                    <!-- Login part -->
                    <div class="col-md-6 col-lg-6 col-xl-4 offset-xl-1">
                        <h2 class="text-center text-primary fw-bold">Edit Profile</h2>
                        
                        <form class="" action="EditProfile" method="post">
                                
                            <!-- firstName -->
                            <div class="form-outline mb-4">
                                <label class="form-label">First Name</label>
                                <input name="firstName" type="text" class="form-control form-control-lg" value="${sessionScope.account.firstName}" />   
                            </div>
                            <!--lastName-->
                            <div class="form-outline mb-4">
                                <label class="form-label">Last Name</label>
                                <input name="lastName" type="text" class="form-control form-control-lg" value="${sessionScope.account.lastName}" />   
                            </div>
                            <!-- Email-->
                            <div class="form-outline mb-4">
                                <label class="form-label">Email</label>
                                <input name="email" type="text" class="form-control form-control-lg" value="${sessionScope.account.email}" />   
                            </div>
                            <!--address-->
                            <div class="form-outline mb-4">
                                <label class="form-label">Address</label>
                                <input name="address" type="text" class="form-control form-control-lg" value="${sessionScope.account.address}" />   
                            </div>
                            <!--Sex-->
                            <div class="form-outline mb-4">
                                <label class="form-label">Sex</label>
                                <input name="sex" type="text" class="form-control form-control-lg" value="${sessionScope.account.sex}" />   
                            </div>
                            <!--Avatar-->
                            <div class="form-outline mb-4">
                                <label class="form-label">Avatar</label>
                                <input name="avatar" type="text" class="form-control form-control-lg" value="${sessionScope.account.avatar}" />   
                            </div>
                            <div class="text-center text-lg-start mt-4 pt-2 mb-4">
                                <button type="submit" class="btn btn-outline-primary btn-lg"style="padding-left: 2.5rem; padding-right: 2.5rem;">
                                    Done
                                </button>
                            </div> 
                        </form>    
                            <p class="text-danger my-4 fw-bold">
                            ${doneMessage}
                        </p>
                        <p class="text-danger my-4 fw-bold">
                            ${errorMessage}
                        </p>
                    </div>
                </div>
            </div>           
        </section>



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