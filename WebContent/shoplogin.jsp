<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<title>Login</title>
</head>
<body>
	<br><br><br><br><br>
    <div class="container">
    





    <div class="card bg-light">
    <article class="card-body mx-auto" style="max-width: 400px;">
        <h2 class="card-title mt-3 text-center">Foodaholic</h2>
        <center><p class="text-center"><h4>Vanakkam Annachi!</h4></p></center>
        <p>
            <!-- <a href="" class="btn btn-block btn-twitter"> <i class="fab fa-twitter"></i>   Login via Twitter</a>
            <a href="" class="btn btn-block btn-facebook"> <i class="fab fa-facebook-f"></i>   Login via facebook</a> -->
        </p>
        <!-- <p class="divider-text">
            <span class="bg-light">OR</span>
        </p> -->
        <form action="<%=request.getContextPath()%>/slogin" method="post">
            <br><br>
         <!-- form-group// -->
        <div class="form-group input-group">
            <div class="input-group-prepend">
                <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
            </div>
            <input name="email" class="form-control" placeholder="Email address" >
        </div> <!-- form-group// --> <!-- form-group// -->
       <!-- form-group end.// -->
       <br>
        <div class="form-group input-group">
            <div class="input-group-prepend">
                <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
            </div>
            <input name="password"class="form-control" placeholder="Password" type="password">
        </div> <!-- form-group// -->
         
        <!-- form-group// -->                                      
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block"> Login </button>
        </div> <!-- form-group// -->      
        <p class="text-center">New to foodaholic <a href="sregister">Register</a> </p>  
        <br><br><br>                                                               
    </form>
    </article>
    </div> <!-- card.// -->

    </div> 
    <!--container end.//-->
    </article>
</body>
</html>