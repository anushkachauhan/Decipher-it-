<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registered</title>
<style>
body
{
background-image:url("welcome2.jpg");
background-size:1366px 768px;
background-repeat:no-repeat;
}
.final
{
text-align:center;
font-size:80px;
font-weight:bold;
font-style:italic;
margin-top:300px;
color:black;
}
a input[type="submit"]
{
background-color:sky blue;
height:50px;
width:150px;
border:solid;
border-radius:20px;

margin-left:530px;
}
</style>
</head>
<body>
<% 

String name1=request.getParameter("name1");
String name2=request.getParameter("name2");
String team=request.getParameter("team_name");
session.setAttribute("team",team);
String clg=request.getParameter("clg");
String cntct=request.getParameter("cntct");

String email=request.getParameter("email");


try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/fish", "root", "");
	Statement stmt=conn.createStatement();
	
		String sql = "insert into register(n1,n2,team,email,clg,cntct)values('"+name1+"','"+name2+"','"+team+"','"+email+"','"+clg+"','"+cntct+"')";
		stmt.executeUpdate(sql);	
		Statement stmt1=conn.createStatement();
		String sql1="insert into score(team) values ('"+team+"')";
		stmt1.executeUpdate(sql1);
	    	 System.out.println("SUCCESFULL");
}catch(Exception e){
	e.printStackTrace();	

}
%>
<div class="final"> REGISTRED<br> SUCCESSFULLY </div>
<a href="Cover12.html">
<input type="submit" value="let us start...">
</a>

</body>
</html>