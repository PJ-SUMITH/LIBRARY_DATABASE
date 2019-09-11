<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    
<!DOCTYPE html>
<html>
<head>
<link href="query.css" rel="stylesheet" id="style">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int book_id = Integer.parseInt(request.getParameter("id"));
String name = request.getParameter("name");
String address = request.getParameter("address");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
PreparedStatement ps=con.prepareStatement("insert into library_branch values(?,?,?)");
ps.setInt(1,book_id);
ps.setString(2,name);
ps.setString(3,address);

int flag=ps.executeUpdate();
%>

<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="library_branch_insert.html" > Insert Again </a></p>
<p> <input type="button" onclick="window.location.href ='index.html';" value="Home"/></p>
<% } else {%>
<h3> VALUES COULDNT BE INSERTED SUCCESSFULLY</h3>
<p> <a href="index.html" >MAIN INSERT MENU</a></p>
 <%} %>
<center>
<h3>
Branch_ID : <%= book_id %> <br>
Branch_Name : <%= name %> <br>
Address : <%= address %> <br>

</h3>
</center>


</body>
</html>