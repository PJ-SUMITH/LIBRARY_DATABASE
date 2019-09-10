<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from book");
out.println("id \t\t title \t\t name \t\t year");
while(rs.next())
{
	    int id=rs.getInt("book_id");
	    String title=rs.getString("title");
	    String name=rs.getString("publisher_name");
		int year=rs.getInt("pub_year");
		%>
		</br>
		<%
		out.println(id+"  "+title+"  "+name+"  "+year);
}
%>


<h3> VALUES DISPLAYED SUCCESSFULLY</h3>

</body>
</html>