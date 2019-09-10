<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
int book_id = Integer.parseInt(request.getParameter("bid"));
int branch_id = Integer.parseInt(request.getParameter("id"));
int card = Integer.parseInt(request.getParameter("card"));
String d1 =request.getParameter("date");
String d2 =request.getParameter("due");

SimpleDateFormat d= new SimpleDateFormat("yyyy-mm-dd");
Date date=d.parse(request.getParameter("date"));
Date due=d.parse(request.getParameter("due"));
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
PreparedStatement ps=con.prepareStatement("insert into book_lending values(?,?,?,?,?)");
ps.setInt(1,book_id);
ps.setInt(2,branch_id);
ps.setInt(3,card);
ps.setDate(4,date);
ps.setDate(5,due);

int flag=ps.executeUpdate();
%>

<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="book_lending-insert.html" > Insert Again </a></p>
<p> <input type="button" onclick="window.location.href ='index.html';" value="Home"/></p>
<% } else {%>
<h3> VALUES COULDNT BE INSERTED SUCCESSFULLY</h3>
<p> <a href="index.html" >MAIN INSERT MENU</a></p>

 <%}} catch(Exception e)
	 {%>
      out.println("ex"+e);
	 <%}%>
<center>
<h3>
Book_ID : <%= book_id %> <br>
Branch_ID : <%= branch_id %> <br>
Card_No: <%= card %> <br>
Date_out: <%= date %> <br>
Due_Date: <%= due %> <br>

</h3>
</center>


</body>
</html>