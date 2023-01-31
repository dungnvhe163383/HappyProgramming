<%-- 
    Document   : test
    Created on : Jan 30, 2023, 10:23:27 AM
    Author     : okanh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>avatar</th>
                    <th>avatar</th>                    
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listMentor}" var="o">
                    <tr>
                        <td>${o.fullname}</td>	
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
