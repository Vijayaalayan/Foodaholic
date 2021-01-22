<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int j=5;
String name=request.getParameter("name");
String email=request.getParameter("email");
String number=request.getParameter("number");
String place=request.getParameter("place");
String password=request.getParameter("password");
String guide=request.getParameter("guide");
String image=request.getParameter("image");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodaholic", "root", "toor");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into foodie(id,name,email,number,place,password,guide,image)values('7','"+name+"','"+email+"','"+number+"','"+place+"','"+password+"','"+guide+"','"+image+"')");
out.println("Thank you for register ! Please <a href='index.html'>Login</a> to continue.");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>