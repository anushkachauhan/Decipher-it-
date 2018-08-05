<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Congratulations</title>
      <style>
body
{
background-image:url("done.jpg");
background-size:cover;
background-repeat:no-repeat;
}
h1
{
font-size:100px;
font-weight:bolder;
margin-top:200px;
color:white;
text-align:center;
font-style:italic;
}
a input[type="button"]
{
width:80px;
height:40px;
color:white;
font-style:italic;
border-radius:5px;
background-color:green;
margin-top:400px;
margin-left:700px;
}
</style>
</head>
<body>
<%

int score=0;
ResultSet rs1=null;
ResultSet r=null;

String answer=request.getParameter("answer");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/fish", "root", "");
	Statement st=conn.createStatement();
	String sql3="SELECT on2 FROM score WHERE team='"+session.getAttribute("team")+"'";
	 r=st.executeQuery(sql3);
while(r.next())
{	if(r.getString("on2").equalsIgnoreCase("n"))
	{
Statement stmt=conn.createStatement();
	String sql="SELECT ans2 FROM level WHERE uid='1'";
	ResultSet rs=stmt.executeQuery(sql);
	Statement stmt1=conn.createStatement();
	while(rs.next())
	{
	if(answer.equals(rs.getString("ans2")))
	{
		out.print("<h1>Cogratulations <br> move to next hurdle</h1>");
		String sql2="SELECT score FROM score WHERE team='"+session.getAttribute("team")+"'";
		 rs1=stmt.executeQuery(sql2);
		 	
		while(rs1.next())
		{
			out.print(rs1.getInt("score"));
			score=rs1.getInt("score")+100;
			out.print(score);

			
			String sql1 = "update score set score='"+score+"',on2='y' where team='"+session.getAttribute("team")+"'";
			stmt1.executeUpdate(sql1);
   		}
  
	}else
	{
		String redirectURL = "http://localhost:8081/innerve/level2.jsp#openModal3";
		response.sendRedirect(redirectURL); 
		String sql1 = "update score set score='"+rs1.getInt("score")+"' where team='"+session.getAttribute("team")+"'";
		stmt1.executeUpdate(sql1);
	}
	}
	}else
	{
		
		String redirectURL = "http://localhost:8081/innerve/hurdle.html";
		response.sendRedirect(redirectURL);
	}
	}
	

		
}catch(Exception e){
	e.printStackTrace();	

}
%>
<a href="hurdle.html">
<input type="button" value="BACK">
</a>
</body>
</html>