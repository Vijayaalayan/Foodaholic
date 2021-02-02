<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Image Show</title>
    </head>
    <body>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodaholic", "root", "toor");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM imagetest";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String firstname = rs.getString("fname");
                    String lastname = rs.getString("lname");
                    String filename = rs.getString("file");
                    String path = rs.getString("path");
        %>

        <table style="width:100%" border="2">
            <tr>
                <th>Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Image</th>
                <th>Path</th>
            </tr>
            <tr>
                <td><%=id%></td>
                <td><%=firstname%></td>
                <td><%=lastname%></td>
                <td><image src="<%=filename%>" width="150" height="200"/></td>
                <td><%=path%></td>
            </tr>
        </table>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
