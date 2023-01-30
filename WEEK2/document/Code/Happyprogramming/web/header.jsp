<%-- 
    Document   : header
    Created on : Jan 30, 2023, 2:23:49 PM
    Author     : manuh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header id="header" class="fixed-top d-flex align-items-center ">
            <div class="container d-flex justify-content-between align-items-center">

                <div class="logo">
                    <h1 class="text-light"><a href="HomePage.jsp"><span>CODELEARN</span></a></h1>
                    <!-- Uncomment below if you prefer to use an image logo -->
                    <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
                </div>

                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a class="" href="HomePage.jsp">Home</a></li>
                        <li><a href="ViewMentor.jsp">Mentor</a></li>
                        <c:if test="${sessionScope.account == null}">
                            <li><a href="SignIn.jsp">Sign In</a></li>
                        </c:if>
                        <c:if test="${sessionScope.account == null}">
                            <li><a href="SignUp.jsp">Sign Up</a></li>
                        </c:if>
                        <c:if test="${sessionScope.account != null}">
                            <li><a href="signOut">Sign Out</a></li>
                        </c:if>
                        <!--          <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
                                    <ul>
                                      <li><a href="#">Drop Down 1</a></li>
                                      <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                                        <ul>
                                          <li><a href="#">Deep Drop Down 1</a></li>
                                          <li><a href="#">Deep Drop Down 2</a></li>
                                          <li><a href="#">Deep Drop Down 3</a></li>
                                          <li><a href="#">Deep Drop Down 4</a></li>
                                          <li><a href="#">Deep Drop Down 5</a></li>
                                        </ul>
                                      </li>
                                      <li><a href="#">Drop Down 2</a></li>
                                      <li><a href="#">Drop Down 3</a></li>
                                      <li><a href="#">Drop Down 4</a></li>
                                    </ul>
                                  </li>-->
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->

            </div>
        </header><!-- End Header -->
    </body>
</html>
