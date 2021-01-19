<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <!-- <link rel="stylesheet" href="css/styles.css"> -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<title>Register</title>
</head>
<body>
	<br><br><br><br><br>
    <div class="container">
    





    <div class="card bg-light">
    <article class="card-body mx-auto" style="max-width: 400px;">
        <h4 class="card-title mt-3 text-center">Foodaholic</h4>
        <p class="text-center">Get started with your Foodaholic account</p>
        <p>
            <!-- <a href="" class="btn btn-block btn-twitter"> <i class="fab fa-twitter"></i>   Login via Twitter</a>
            <a href="" class="btn btn-block btn-facebook"> <i class="fab fa-facebook-f"></i>   Login via facebook</a> -->
        </p>
        <!-- <p class="divider-text">
            <span class="bg-light">OR</span>
        </p> -->
        <form action="<%= request.getContextPath() %>/register" method="post">
        <div class="form-group input-group">
            <div class="input-group-prepend">
                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
            </div>
            <input name="name" class="form-control" placeholder="Full name" type="text">
        </div> <!-- form-group// -->
        <div class="form-group input-group">
            <div class="input-group-prepend">
                <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
            </div>
            <input name="email" class="form-control" placeholder="Email address" type="email">
        </div> <!-- form-group// -->
        <div class="form-group input-group">
            <div class="input-group-prepend">
                <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
            </div>
            <!-- <select class="custom-select" style="max-width: 120px;">
                <option selected="">+971</option>
                <option value="1">+972</option>
                <option value="2">+198</option>
                <option value="3">+701</option>
            </select> -->
            <input name="number" class="form-control" placeholder="Phone number" type="text">
        </div> <!-- form-group// -->
        <div class="form-group input-group">
            <div class="input-group-prepend">
                <span class="input-group-text"> <i class="fa fa-building"></i> </span>
                <!--<input name="place" class="form-control" placeholder="Place" type="text">-->
            </div>
             <select name="place" class="form-control">
                <option selected=""> Select Place</option>
                <option>Coimbatore</option>
                <option>Tirupur</option>
                <option>Karur</option>
                <option>Erode</option>
                <option>Tiruchengode</option>
            </select>
        </div> <!-- form-group end.// -->
        <div class="form-group input-group">
            <div class="input-group-prepend">
                <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
            </div>
            <input name="password"class="form-control" placeholder="Create password" type="password">
        </div> <!-- form-group// -->
        <!--  <div class="form-group input-group">
            <div class="input-group-prepend">
                <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
            </div>
            <input name="password"class="form-control" placeholder="Repeat password" type="password">
        </div>-->
        <div class="form-group input-group">
            <div class="input-group-prepend">
                <span class="input-group-text"> <i class="fa fa-building"></i> </span>
                 <!--<input name="guide" class="form-control" placeholder="Guide" type="text">-->
            </div>
            <select name="guide"class="form-control">
                <option selected=""> Act as a Guide</option>
                <option>Yes</option>
                <option>No</option>
            </select>
        </div>  
        <!-- form-group// -->                                      
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block"> Create Account  </button>
        </div> <!-- form-group// -->      
        <p class="text-center">Have an account? <a href="foodielogin.jsp">Log In</a> </p>                                                                 
    </form>
    </article>
    </div> <!-- card.// -->

    </div> 
    <!--container end.//-->
    </article>
</body>
</html>