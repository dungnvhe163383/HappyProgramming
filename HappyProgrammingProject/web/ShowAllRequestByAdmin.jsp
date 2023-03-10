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

        <c:if test="${sessionScope.account.roleId != 3}">
            <jsp:include page="NotFound.jsp"></jsp:include>
        </c:if>
        <c:if test="${sessionScope.account.roleId == 3}">
            <jsp:include page="header.jsp"></jsp:include>

                <section class="vh-100 mt-5 py-5 px-5">
                    <div class="container-fluid h-custom">
                        <div class="row d-flex align-items-center h-100">
                        <c:choose>
                            <c:when test="${RequestList == null}">
                                <h5 class="text text-center">No Record of Request Founded !
                                </c:when>
                                <c:otherwise>
                                    <div class="col-md-4 col-lg-4 col-xl-4 offset-xl-1">
                                        <h2 class="text-start text-primary fw-bold">Request List</h2>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4 offset-xl-1">
                                        <form class="d-flex my-1 mx-lg-1" action="RequestSearchByAdmin" method="get">                       
                                            <input value="" class="form-control me-2" name="key" type="search" placeholder="Search Request ..." aria-label="Search">
                                            <button onclick="this.form.submit()" class="btn btn-outline-primary" type="submit">Search</button>
                                        </form>
                                    </div>
                                    <table class="table table-striped mt-4">
                                        <thead>
                                            <tr class="text-bg-info">
                                                <th scope="col">Request ID</th>
                                                <th scope="col">Title</th>
                                                <th scope="col">Content</th>
                                                <th scope="col">Deadline</th>
                                                <th scope="col">MenteeID</th>
                                                <th scope="col">MentorID</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${RequestList}" var="r">
                                                <tr>
                                                    <th scope="row">${r.id}</th>
                                                    <th scope="row">${r.title}</th>
                                                    <th scope="row">${r.content}</th>
                                                    <th scope="row">${r.deadline}</th>
                                                    <th scope="row">
                                                        <a href="viewMenteeProfile?menteeID=${r.menteeID}">${r.menteeID}</a>
                                                    </th>
                                                    <th scope="row">
                                                        <a href="MentorDetailControll?mentorid=${r.mentorID}">${r.mentorID}</a>
                                                    </th>
                                                    <th scope="row">${r.requestStatus}</th>
                                                    <th scope="row"></th>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:otherwise>
                            </c:choose>
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
