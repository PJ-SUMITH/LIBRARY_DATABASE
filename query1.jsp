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
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select b.book_id,b.title,b.publisher_name,a.publisher_name,c.no_of_copies,c.branch_id from book b, book_authors a,book_copies c where b.book_id=a.book_id and b.book_id=c.book_id");%>
				<h3> BOOK ID	-TITLE	-PUBL NAME	-NO OF COPIES	-AUTHOR NAME	-BRANCH ID</h3>
				
				<% while(rs.next())
				{
						String book_Id=rs.getString("book_id");
						String Title=rs.getString("title");
						String Publisher_Name=rs.getString("publisher_name");
						int copies=rs.getInt("no_of_copies");
						String author_name=rs.getString("publisher_name");
						String branch_id=rs.getString("branch_id");
						out.println("<br/>");%>
						<p><h3><%=book_Id %>&nbsp&nbsp&nbsp<%=Title %>&nbsp&nbsp&nbsp<%= Publisher_Name %>&nbsp&nbsp&nbsp&nbsp<%=copies %>&nbsp&nbsp&nbsp&nbsp<%=author_name%>&nbsp&nbsp&nbsp&nbsp <%= branch_id %></h3> </p>
						
						
						
				<% }%>
				<p> <input type="Button" value="Back"onclick="history.back()"/></p>
				<p> <input type="button" onclick="window.location.href ='index.html';" value="Home"/></p>
			<% }
			catch(Exception e)
			{
				System.out.println("e="+e);
			}
		
%>
</body>
</html>