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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            List<Feedback> list = (List<Feedback>) request.getAttribute("comment");
        %>
        <h1>${average}</h1>
        <% for (Feedback f : list) {%>
        <h1></h1>
         <img src="assets/img/<%= f.getMentee().getAvatar() %>" class="img-fluid" alt="" height="350 px" width="350 px" >
        <% } %>
    </body>
</html>
