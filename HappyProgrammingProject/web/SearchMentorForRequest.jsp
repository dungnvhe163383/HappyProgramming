<%-- 
    Document   : SearchMentorForRequest
    Created on : Feb 26, 2023, 9:26:41 PM
    Author     : ASUS
--%>

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
    </head>
    <body>
        <div class="col-md-4 col-lg-4 col-xl-4 offset-xl-1">
            <h2 class="text-start text-primary fw-bold">Mentors Found</h2>
        </div>
        <div class="col-md-6 col-lg-6 col-xl-4 offset-xl-1">
        </div>
        <table class="table table-striped mt-4">
            <thead>
                <tr class="text-bg-info">
                    <th scope="col">First name</th>
                    <th scope="col">Last name</th>
                    <th scope="col">Avatar</th>
                    <th scope="col">Introduce</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${listMentor}" var="r">
                <tr>
                    <th scope="row">${r.firstname}</th>
                    <th scope="row">${r.lastname}</th>
                    <th scope="row">${r.introduce}</th>
                    <th scope="row">${r.avatar}</th>
                    <th scope="row">${r.mentorStatus}</th>
                    <th scope="row"></th>
                </tr>
            </c:forEach>
        </tbody>
    </table>
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
