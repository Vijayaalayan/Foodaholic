<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

    <%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View</title>
</head>

<body>

<%

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodaholic","root","toor");

PreparedStatement ps=con.prepareStatement("select image from foodie where name='nathan'");

ResultSet rs=ps.executeQuery();

if(rs.next()){

    //System.out.println("Image:"+rs.getBlob(1));

    //out.println("<img src=\""+rs.getString("image")+"\">");
    out.print("<img src=\""+rs.getBlob(1)+"/"+rs.getString("image")+"\">");


}

out.print("Hello");

%>

</body>

</html>
