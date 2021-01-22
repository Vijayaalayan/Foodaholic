<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
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
<html>
<body>

	<h1>Retrieve data from database in jsp</h1>
	<table border="1">
		<tr>
		<td>name</td>
		<td>mail</td>
		<td>image</td>
		<td>number</td>
		
		</tr>
		<%
		try{
			connection = DriverManager.getConnection(connectionUrl+database, userid, password);
			statement=connection.createStatement();
			String sql ="select * from foodie where name='nathan'";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
			<tr>
			<td><%=resultSet.getString("name") %></td>
			<td><%=resultSet.getString("email") %></td>
			
			<td><%=resultSet.getString("number") %></td>
			</tr>	
			<%
			System.out.println(resultSet.getString("name"));
			}
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</table>
	</body>
</html>