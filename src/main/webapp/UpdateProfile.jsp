<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/foodaholic";%>
<%!String user = "root";%>
<%!String psw = "toor";%>

<%
//String id = request.getParameter("id");
String name=request.getParameter("name");
String email=request.getParameter("email");
String place=request.getParameter("place");

//if(id != null)
//{
	Connection con = null;
	PreparedStatement ps = null;
	//int personID = Integer.parseInt(id);
	try
	{
		Class.forName(driverName);
		con = DriverManager.getConnection(url,user,psw);
		String sql="Update foodie set name=?,email=?,place=? where email='"+email+"'";
		ps = con.prepareStatement(sql);
		//ps.setString(1,id);
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, place);

		int i = ps.executeUpdate();
		if(i > 0)
		{
			String redirectURL = "profile.jsp";
			response.sendRedirect(redirectURL);
		}
		else
		{
			out.print("There is a problem in updating Record.");
		}
	}
	catch(SQLException sql)
	{
		request.setAttribute("error", sql);
		out.println(sql);
	}
//}
%>