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
int book_id = Integer.parseInt(request.getParameter("book_id"));
String title = request.getParameter("title");
String name = request.getParameter("name");
int year = Integer.parseInt(request.getParameter("year"));

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
PreparedStatement ps=con.prepareStatement("insert into book values(?,?,?,?)");
ps.setInt(1,book_id);
ps.setString(2,title);
ps.setString(3,name);
ps.setInt(4,year);
int flag=ps.executeUpdate();
%>

<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="book_insert.html" > Insert Again </a></p>
<p> <input type="button" onclick="window.location.href ='index.html';" value="Home"/></p>
<% } else {%>
<h3> VALUES COULDNT BE INSERTED SUCCESSFULLY</h3>
<p> <a href="index.html" >MAIN INSERT MENU</a></p>

 <%} %>
<center>
<h3>
Book_ID :<%= book_id%> <br>
Title: <%= title %> <br>
Publisher_Name :  <%= name %> <br>
Publisher_Year : <%= year %> <br>

</h3>
</center>


</body>
</html>