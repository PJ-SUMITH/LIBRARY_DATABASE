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
int book_id = Integer.parseInt(request.getParameter("bid"));
int branch_id = Integer.parseInt(request.getParameter("id"));
int copies = Integer.parseInt(request.getParameter("no"));



Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
PreparedStatement ps=con.prepareStatement("insert into book_copies values(?,?,?)");
ps.setInt(1,book_id);
ps.setInt(2,branch_id);
ps.setInt(3,copies);

int flag=ps.executeUpdate();
%>

<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="book_copies_insert.html" > Insert Again </a></p>
<p> <input type="button" onclick="window.location.href ='index.html';" value="Home"/></p>
<% } else {%>
<h3> VALUES COULDNT BE INSERTED SUCCESSFULLY</h3>
<p> <a href="index.html" >MAIN INSERT MENU</a></p>

 <%} %>
<center>
<h3>
Book_ID : <%= book_id %> <br>
Branch_ID : <%= branch_id %> <br>
N0_0f_Copies : <%= copies %> <br>

</h3>
</center>


</body>
</html>