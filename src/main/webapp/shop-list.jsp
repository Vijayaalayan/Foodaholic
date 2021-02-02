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
          <a class="navbar-brand" href="dashboard.html">
            <!-- Logo icon -->
            <b class="logo-icon">
              <!-- Dark Logo icon -->
              <img src="images/foodaholic-icon.jpeg" alt="homepage" style="height:80px; width:230px;"/>
            </b>
            <!--End Logo icon -->
            <!-- Logo text -->
<%--            <span class="logo-text">--%>
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

<%--            <li class=" in">--%>
<%--              <form role="search" class="app-search d-none d-md-block mr-3">--%>
<%--                <input type="text" placeholder="Search..." class="form-control mt-0">--%>
<%--                <a href="" class="active">--%>
<%--                  <i class="fa fa-search"></i>--%>
<%--                </a>--%>
<%--              </form>--%>
<%--            </li>--%>
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
                          String name = resultSet.getString("name");
              %>
              <li>
                  <a class="profile-pic" href="#">
                      <img src="<%=filename%>" alt="user-img" width="36"
                           class="img-circle"><span class="text-white font-medium">

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
            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="dashboard.jsp" aria-expanded="false"><i class="fas fa-clock fa-fw"
                                    aria-hidden="true"></i><span class="hide-menu">Dashboard</span></a></li>
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
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="profile.jsp" aria-expanded="false">
                                <i class="fa fa-user" aria-hidden="true"></i><span class="hide-menu">Profile</span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="basic-table.html" aria-expanded="false"><i class="fa fa-table"
                                    aria-hidden="true"></i><span class="hide-menu">Table</span></a></li>

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
        <h1 style="padding: 50px 50px;font-size:60px;font-family:'Potta One', cursive;"><strong>Food Stops</strong></h1>
      </center>
        <div class="form-group input-group"  style="margin-left: 1px; padding-left:1080px;">
            <div class="input-group-prepend">
                <span class="input-group-text"> </span>
            </div>
            <form action="" method="POST" id="myform">
                <select class="form-control" name="place"  id="yourid" onchange='submitForm();' style="
    border-right-width: 20px;">
                    <option selected=""> Select Place</option>
                    <option>Coimbatore</option>
                    <option>Tirupur</option>
                    <option>Karur</option>
                    <option>Erode</option>
                    <option>Tiruchengode</option>
                </select>
                <%--                    <input type="submit" value="Submit">--%>
            </form>
        </div>
        <div class="row" style="margin: 0 10px 0 10px;border-bottom;padding-bottom:135px;">
        
        <%
			try{
				connection = DriverManager.getConnection(connectionUrl+database, userid, password);
				statement=connection.createStatement();
				String sql ="select * from shopkeeper where place='"+city+"'";
				System.out.println(sql);
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){

		  %>
		  
	        <div class="pricing-column col-lg-4 col-md-6">
	          <div class="card">
	            <div class="card-header">
	            <form action="shop-detailed.jsp" method="post">
	              <h3 class="plan-title">
	                <center><strong><%=resultSet.getString("shopName") %></strong></center>
	              </h3>
	            </div>
	            <div class="card-body">
	              <h2 class="price-text"><%=resultSet.getString("email") %></h2>
	              <p></p>
	              
	              
	              <input class="btn btn-dark btn-lg btn-block" type="submit" name="number"value="<%=resultSet.getString("number") %>">
	              </form>
	            </div>
	          </div>
	        </div>
	        
		   <%
					}
					connection.close();
				} catch (Exception e) {
					e.printStackTrace();
					}
					%>
					</div>
					</form>
      



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
  <script type='text/javascript'>
      function submitForm(){
          // Call submit() method on <form id='myform'>

          document.getElementById('myform').submit();


          //document.getElementById("yourid").value=x;
          //document.getElementById("yourid").value = document.getElementById("yourid").value;
      }
  </script>
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
