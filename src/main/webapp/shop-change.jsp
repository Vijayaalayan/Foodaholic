<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 30-01-2021
  Time: 09:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String id = (String)session.getAttribute("email");
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "foodaholic";
    String userid = "root";
    String password = "toor";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<%
    try{
        connection = DriverManager.getConnection(connectionUrl+database, userid, password);
        statement=connection.createStatement();
        String sql ="select * from shopkeeper where email='"+id+"'";
        System.out.println(sql);
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
            String filename = resultSet.getString("file");
%>
<!DOCTYPE html>
<html lang="en"><!-- Basic -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title><%=resultSet.getString("shopName") %></title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="shop_css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="shop_css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="shop_css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="shop_css/custom.css">

    <script src="https://kit.fontawesome.com/c8c9105197.js" crossorigin="anonymous"></script>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<!-- Start header -->
<header class="top-navbar">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="shop-change.jsp">
                <img src="<%=filename%>" width="50" height="50">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbars-rs-food">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="shop-details.jsp">Home</a></li>
                    <%--                    <li class="nav-item"><a class="nav-link" href="menu.html">Menu</a></li>--%>
                    <li class="nav-item active"><a class="nav-link" href="shop-change.jsp">Profile</a></li>
                    <%--                    <li class="nav-item dropdown">--%>
                    <%--                        <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Pages</a>--%>
                    <%--                        <div class="dropdown-menu" aria-labelledby="dropdown-a">--%>
                    <%--                            <a class="dropdown-item" href="reservation.html">Reservation</a>--%>
                    <%--                            <a class="dropdown-item" href="stuff.html">Stuff</a>--%>
                    <%--                            <a class="dropdown-item" href="gallery.html">Gallery</a>--%>
                    <%--                        </div>--%>
                    <%--                    </li>--%>
                    <%--                    <li class="nav-item dropdown">--%>
                    <%--                        <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Blog</a>--%>
                    <%--                        <div class="dropdown-menu" aria-labelledby="dropdown-a">--%>
                    <%--                            <a class="dropdown-item" href="blog.html">blog</a>--%>
                    <%--                            <a class="dropdown-item" href="blog-details.html">blog Single</a>--%>
                    <%--                        </div>--%>
                    <%--                    </li>--%>
                    <%--                    <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>--%>
                </ul>
            </div>
        </div>
    </nav>
</header>
<!-- End header -->

<!-- Start All Pages -->
<%--<div class="all-page-title page-breadcrumb">--%>
<%--    <div class="container text-center">--%>
<%--        <div class="row">--%>
<%--            <div class="col-lg-12">--%>
<%--                <h1>Contact</h1>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- End All Pages -->

<!-- Start Contact -->
<%--<div class="map-full"></div>--%>
<br><br><br>
<div class="contact-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title text-center">
                    <h2>Update Profile</h2>
<%--                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting</p>--%>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <form method="POST" action="UpdateSProfile.jsp" id="contactForm">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="bmd-label-floating">Shop Name</label>
                                <input type="text" class="form-control" id="name" name="shopName" value="<%=resultSet.getString("shopName") %>" required data-error="Please enter your name">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="bmd-label-floating">Email</label>
                                <input type="text" value="<%=resultSet.getString("email") %>" id="email" class="form-control" name="email" required data-error="Please enter your email">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="bmd-label-floating">Place</label>
                                <input type="text" value="<%=resultSet.getString("place") %>" id="place" class="form-control" name="place" required data-error="Please enter your email">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="bmd-label-floating">Place</label>
                                <textarea class="form-control" id="message" name="about"  rows="4" data-error="Write your message" required> <%=resultSet.getString("about") %></textarea>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="submit-button text-center">
                                <button class="btn btn-common" id="submit" type="submit" name="submit">UPDATE</button>
                                <div id="msgSubmit" class="h3 text-center hidden"></div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- End Contact -->

<!-- Start Contact info -->
<div class="contact-imfo-box">
    <div class="container">
        <div class="row">
            <div class="col-md-4 arrow-right">
                <i class="fa fa-volume-control-phone"></i>
                <div class="overflow-hidden">
                    <h4>Phone</h4>
                    <p class="lead">
                        <%=resultSet.getString("number") %>
                    </p>
                </div>
            </div>
            <div class="col-md-4 arrow-right">
                <i class="fa fa-envelope"></i>
                <div class="overflow-hidden">
                    <h4>Email</h4>
                    <p class="lead">
                        <%=resultSet.getString("email") %>
                    </p>
                </div>
            </div>
            <div class="col-md-4">
                <i class="fa fa-map-marker"></i>
                <div class="overflow-hidden">
                    <h4>Location</h4>
                    <p class="lead">
                        <%=resultSet.getString("latlon") %>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Contact info -->

<a href="#" id="back-to-top" title="Back to top" style="display: none;"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></a>

<!-- ALL JS FILES -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- ALL PLUGINS -->

<script src="sjs/jquery.superslides.min.js"></script>
<script src="sjs/images-loded.min.js"></script>
<script src="sjs/isotope.min.js"></script>
<script src="sjs/baguetteBox.min.js"></script>
<script src="sjs/jquery.mapify.js"></script>
<script src="sjs/form-validator.min.js"></script>
<script src="sjs/contact-form-script.js"></script>
<script src="sjs/custom.js"></script>
<script>
    $('.map-full').mapify({
        points: [
            {
                lat: 40.7143528,
                lng: -74.0059731,
                marker: true,
                title: 'Marker title',
                infoWindow: 'Live Dinner Restaurant'
            }
        ]
    });
</script>
<%
        }
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
