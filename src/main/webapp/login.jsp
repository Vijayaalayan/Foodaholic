<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String email=request.getParameter("email");
session.putValue("email",email);
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
System.out.println("1");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/foodaholic","root","toor");
Statement st= con.createStatement();
String s = "select * from foodie where email='"+email+"' and password='"+password+"'";
System.out.println(s);
ResultSet rs=st.executeQuery(s);
try{
rs.next();
if(rs.getString("password").equals(password)&&rs.getString("email").equals(email))
{
out.println("Welcome " +email);
session.setAttribute("email", email);
String redirectURL = "dashboard.jsp";
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