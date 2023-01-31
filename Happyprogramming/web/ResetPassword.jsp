<%-- 
    Document   : ResetPassword
    Created on : Jan 29, 2023, 11:31:06 AM
    Author     : okanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <p><a href="HomePage.jsp" class="h3 mb-3 font-weight-normal">Home</a>
        <div id="logreg-forms">
            <form class="form-signin" action="forgotPassword" method="post">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Find Your Account</h1>
                <p>Please write your email you used to sign up</p>
                <input name="username"  type="text" id="inputEmail" class="form-control" placeholder="username" required="" autofocus="">
                <input name="email"  type="text" id="inputEmail" class="form-control" placeholder="Email" required="" autofocus="">
                </br>
                <p>You are Mentor or Mentee?</p>
                <input type="radio" name="roles" value="Mentee" />Mentee
                <input type="radio" name="roles" value="Mentor" />Mentor
                <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Find</button>
            </form>
        </div>
    </body>
</html>
