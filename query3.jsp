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
    int v= Integer.parseInt(request.getParameter("id"));
    Connection con=null;
    PreparedStatement pst = null;
    try{
    	Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
		pst = con.prepareStatement("DELETE FROM `book` WHERE book_id= ?");
        pst.setInt(1,v);
        int i=pst.executeUpdate();
        if(i>0)
        {%>
        <h2> Deleted Sucessfully </h2>
        <%}
        else{
        %>
        <h2>Could not Deleted Sucessfully </h2>
        <%}
      }catch(Exception e){
      %>
       
    <%}
%>
<p> <input type="Button" value="Back"onclick="history.back()"/></p>
<p> <input type="button" onclick="window.location.href ='index.html';" value="Home"/></p>
</body>
</html>