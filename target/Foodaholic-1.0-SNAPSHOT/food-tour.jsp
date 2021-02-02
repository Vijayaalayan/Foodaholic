<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 01-02-2021
  Time: 02:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String id = (String)session.getAttribute("email");
    String city = request.getParameter("place");
    System.out.println(id);
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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
          content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 4 admin, bootstrap 4, css3 dashboard, bootstrap 4 dashboard, Ample lite admin bootstrap 4 dashboard, frontend, responsive bootstrap 4 admin template, Ample admin lite dashboard bootstrap 4 dashboard template">
    <meta name="description" content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    <title>Ample Admin Lite Template by WrapPixel</title>
    <!-- Font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Potta+One&display=swap" rel="stylesheet">

    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="plugins/images/favicon.png">
    <!-- Custom CSS -->
    <link href="plugins/bower_components/chartist/dist/chartist.min.css" rel="stylesheet">
    <link rel="stylesheet" href="plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.css">
    <!-- Custom CSS -->
    <link href="css/style.min.css" rel="stylesheet">
</head>

<body>
<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader">
    <div class="lds-ripple">
        <div class="lds-pos"></div>
        <div class="lds-pos"></div>
    </div>
</div>
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full" data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <!-- ============================================================== -->
    <!-- Topbar header - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <header class="topbar" data-navbarbg="skin5">
        <nav class="navbar top-navbar navbar-expand-md navbar-dark">
            <div class="navbar-header" data-logobg="skin6">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <a class="navbar-brand" href="dashboard.jsp">
                    <!-- Logo icon -->
                    <b class="logo-icon">
                        <!-- Dark Logo icon -->
                        <img src="images/foodaholic-icon.jpeg" alt="homepage"  style="height:80px; width:230px;"/>
                    </b>
                    <!--End Logo icon -->
                    <!-- Logo text -->
<%--                    <span class="logo-text">--%>
<%--              <!-- dark Logo text -->--%>
<%--              <img src="plugins/images/logo-text.png" alt="homepage" />--%>
<%--            </span>--%>
                </a>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- toggle and nav items -->
                <!-- ============================================================== -->
                <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
            </div>
            <!-- ============================================================== -->
            <!-- End Logo -->
            <!-- ============================================================== -->
            <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                <ul class="navbar-nav d-none d-md-block d-lg-none">
                    <li class="nav-item">
                        <a class="nav-toggler nav-link waves-effect waves-light text-white" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                    </li>
                </ul>
                <!-- ============================================================== -->
                <!-- Right side toggle and nav items -->
                <!-- ============================================================== -->
                <ul class="navbar-nav ml-auto d-flex align-items-center">

                    <!-- ============================================================== -->
                    <!-- Search -->
                    <!-- ============================================================== -->
<%--                    <li class=" in">--%>
<%--                        <form role="search" class="app-search d-none d-md-block mr-3">--%>
<%--                            <input type="text" placeholder="Search..." class="form-control mt-0">--%>
<%--                            <a href="" class="active">--%>
<%--                                <i class="fa fa-search"></i>--%>
<%--                            </a>--%>
<%--                        </form>--%>
<%--                    </li>--%>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <%
                        try{
                            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                            statement=connection.createStatement();
                            String sql ="select * from foodie where email='"+id+"'";
                            System.out.println(sql);
                            resultSet = statement.executeQuery(sql);
                            while(resultSet.next()){
                                String filename = resultSet.getString("file");
                    %>
                    <li>
                        <a class="profile-pic" href="#">
                            <img src="<%=filename%>" alt="user-img" width="36" class="img-circle"><span class="text-white font-medium">
                                            <%=resultSet.getString("name") %>
											<%
                                                    }
                                                    connection.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                   </span></a>
                    </li>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                </ul>
            </div>
        </nav>
    </header>
    <!-- ============================================================== -->
    <!-- End Topbar header -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <aside class="left-sidebar" data-sidebarbg="skin6">
        <!-- Sidebar scroll-->
        <div class="scroll-sidebar">
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav">
                <ul id="sidebarnav">
                    <!-- User Profile-->
                    <li class="sidebar-item pt-2">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="dashboard.jsp"
                           aria-expanded="false">
                            <i class="far fa-clock" aria-hidden="true"></i>
                            <span class="hide-menu">Dashboard</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="food-tour.jsp"
                           aria-expanded="false">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <span class="hide-menu">Food Tour</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="shop-list.jsp"
                           aria-expanded="false">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <span class="hide-menu">Shops</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="profile.jsp"
                           aria-expanded="false">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <span class="hide-menu">Profile</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="faq.jsp"
                           aria-expanded="false">
                            <i class="fa fa-table" aria-hidden="true"></i>
                            <span class="hide-menu">FAQ</span>
                        </a>
                    </li>

                </ul>

            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <!-- ============================================================== -->
    <!-- End Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Page wrapper  -->
    <!-- ============================================================== -->
    <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->

        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <!-- ////Old Card -->
        <!-- <div class="card" style="width: 18rem;">
                  <img class="card-img-top" src="..." alt="Card image cap">
                  <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                  </div>
                </div> -->

        <center>
            <h1 style="padding: 50px 50px;font-size:60px;font-family:'Potta One', cursive;"><strong>Food Tour</strong></h1>
        </center>

        <div class="row" style="margin: 0 10px 0 10px;border-bottom;padding-bottom:135px;">
            <div class="pricing-column col-lg-4 col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="plan-title">
                            <center><strong>1 Day</strong></center>
                        </h3>
                    </div>
                    <div class="card-body">
                        <h2 class="price-text">Rs.1000</h2>
<%--                        <p>5 Matches Per Day</p>--%>
<%--                        <p>10 Messages Per Day</p>--%>
<%--                        <p>Unlimited App Usage</p>--%>
                        <button class="btn btn-dark btn-lg btn-block" type="button"><a href="https://rzp.io/l/HSUfGB0GfD" target="_blank">Book Now</a></button>
                    </div>
                </div>
            </div>

            <div class="pricing-column col-lg-4 col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="plan-title">
                            <center><strong>2 Days</strong></center>
                        </h3>
                    </div>
                    <div class="card-body">
                        <h2 class="price-text">Rs.2000</h2>
<%--                        <p>Unlimited Matches</p>--%>
<%--                        <p>Unlimited Messages</p>--%>
<%--                        <p>Unlimited App Usage</p>--%>
                        <button class="btn btn-dark btn-lg btn-block" type="button"> <a href="https://rzp.io/l/xHIxhcB2" target="_blank">Book Now</a></button>
                    </div>
                </div>
            </div>

            <div class="pricing-column col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h3 class="plan-title">
                            <center><strong>3 Days</strong></center>
                        </h3>
                    </div>
                    <div class="card-body">
                        <h2 class="price-text">Rs.3000</h2>
<%--                        <p>Pirority Listing</p>--%>
<%--                        <p>Unlimited Matches</p>--%>
<%--                        <p>Unlimited Messages</p>--%>
                        <button class="btn btn-dark btn-lg btn-block" type="button"><a href="https://rzp.io/l/z3DUp0W" target="_blank">Book Now</a></button>
                    </div>
                </div>
            </div>
        </div>



        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <footer class="footer text-center"> 2021 @ ZeroBuggers</footer>
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Page wrapper  -->
    <!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="plugins/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="plugins/bower_components/popper.js/dist/umd/popper.min.js"></script>
<script src="bootstrap/dist/js/bootstrap.min.js"></script>
<script src="js/app-style-switcher.js"></script>
<script src="plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
<!--Wave Effects -->
<script src="js/waves.js"></script>
<!--Menu sidebar -->
<script src="js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="js/custom.js"></script>
<!--This page JavaScript -->
<!--chartis chart-->
<script src="plugins/bower_components/chartist/dist/chartist.min.js"></script>
<script src="plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
<script src="js/pages/dashboards/dashboard1.js"></script>
</body>

</html>

