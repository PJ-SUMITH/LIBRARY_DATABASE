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
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
			%>
				<h3> BOOK DELETED SUCCESFULLY </h3>
				
			<%}
			catch(Exception e)
			{
				System.out.println("e="+e);
			}
		
%>
<p> <input type="Button" value="Back"onclick="history.back()"/></p>
<p> <input type="button" onclick="window.location.href ='index.html';" value="Home"/></p>
</body>
</html>