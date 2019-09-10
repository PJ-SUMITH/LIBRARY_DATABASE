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
String name = request.getParameter("name");
String address = request.getParameter("address");
String phone = request.getParameter("phone");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
PreparedStatement ps=con.prepareStatement("insert into publisher values(?,?,?)");
ps.setString(1,name);
ps.setString(2,address);
ps.setString(3,phone);
int flag=ps.executeUpdate();
%>

<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="pub_insert.html" > Insert Again </a></p>
<p> <input type="button" onclick="window.location.href ='index.html';" value="Home"/></p>
<% } else {%>
<h3> VALUES COULDNT BE INSERTED SUCCESSFULLY</h3>
<p> <a href="index.html" >MAIN INSERT MENU</a></p>

 <%} %>
<center>
<h3>
NAME : <%= name %> <br>
Address : <%= address %> <br>
Phone : <%= phone %> <br>


</h3>
</center>


</body>
</html>