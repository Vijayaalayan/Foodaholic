<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String email=request.getParameter("email");
session.putValue("email",email);
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/foodaholic","root","toor");
Statement st= con.createStatement();
String s = "select * from shopKeeper where email='"+email+"' and password='"+password+"'";
System.out.println(s);
ResultSet rs=st.executeQuery(s);
try{
rs.next();
{
session.setAttribute("email", email);
String redirectURL = "shop-profile.jsp";
response.sendRedirect(redirectURL);
}
else{
out.println("Invalid password or username.");
}
}
catch (Exception e) {
e.printStackTrace();
}
%>