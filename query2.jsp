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
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select card_no from book_lending where date_out between '2011-01-17' and '2021-04-17' group by card_no having count(*)>1");%>
				<h3> CARD NUMBER </h3>
				
				<% while(rs.next())
				{
						String cno=rs.getString("card_no");
						out.println("<br/>");%>
						<h2><%=cno %>&nbsp&nbsp&nbsp </h2>
						
				<% }
			}
			catch(Exception e)
			{
				System.out.println("e="+e);
			}
		
%><p> <input type="Button" value="Back"onclick="history.back()"/></p>
<p> <input type="button" onclick="window.location.href ='index.html';" value="Home"/></p>
</body>
</html>