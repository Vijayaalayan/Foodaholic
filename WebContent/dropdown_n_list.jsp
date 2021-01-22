<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String place = request.getParameter("place");
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
	
	<label for="">Choose a place:</label>
	
	
	<form action="" method="POST">
		<select name="place" >
  			<option value="karur">karur</option>
  			<option value="coimbatore">coimbatore</option>
  			<option value="tripur">tripur</option>
  			<option value="tirunchengode">tirunchengode</option>
		</select>
		<input type="submit" value="Submit">
	</form>
	
	
	<table border="1">
		<tr>
		<td>id</td>
		<td>name</td>
		<td>mail</td>
		<td>image</td>
		<td>number</td>
		
		</tr>
		<%
		try{
			connection = DriverManager.getConnection(connectionUrl+database, userid, password);
			statement=connection.createStatement();
			String sql ="select * from users where City='"+place+"'";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
			<tr>
			<td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("Name") %></td>
			<td><%=resultSet.getString("email") %></td>
			<td><%=resultSet.getString("City") %></td>
			
			<td><%=resultSet.getString("phonenumber") %></td>
			</tr>
			<%
			}
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</table>
	</body>
</html>