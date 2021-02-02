<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/foodaholic";%>
<%!String user = "root";%>
<%!String psw = "toor";%>

<%
    String shopName = request.getParameter("shopName");
    String email=request.getParameter("email");
    String place=request.getParameter("place");
    String about=request.getParameter("about");

    if(shopName != null)
    {
        Connection con = null;
        PreparedStatement ps = null;
//        int personID = Integer.parseInt(id);
        try
        {
            Class.forName(driverName);
            con = DriverManager.getConnection(url,user,psw);
            String sql="Update shopkeeper set shopName=?,email=?,place=?,about=? where shopName='"+shopName+"'";
            System.out.println(sql);
            ps = con.prepareStatement(sql);
            ps.setString(1,shopName);
            ps.setString(2, email);
            ps.setString(3, place);
            ps.setString(4, about);

            int i = ps.executeUpdate();
            if(i > 0)
            {
                String redirectURL = "shop-change.jsp";
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
    }
%>