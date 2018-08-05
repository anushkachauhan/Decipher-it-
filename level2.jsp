<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE.html>
<html>
 <head>
 <title>Level 2</title>
  <script>
          <% int a=0;
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/fish", "root", "");
	 ResultSet rs=null;
  if(con!=null)
      System.out.println("Data is successfully retrieved!");
  else
      System.out.println("no connection");
  String sql="select time from  Timer where team='"+session.getAttribute("team")+"'";
  // PreparedStatement ps = con.prepareStatement(sql);
     //   ps.executeUpdate();
     Statement stmt = null;
         stmt=con.createStatement();  

         rs=stmt.executeQuery(sql); 
         // In this part u extract time from database
while(rs.next()) { 
    a=rs.getInt(1);
System.out.println(rs.getInt(1)); //+"  "+rs.getString(2)+"  "+rs.getString(3));  
}
//step5 close the connection object  
con.close();
       
}catch(Exception e1)
{
    out.println(e1);
}
%>


 // here ur using the time left in the database for the user
var distance1=<%=a%>;

//distance=distance;
// Update the count down every 1 second
var x = setInterval(function() {

    // Get todays date and time
   // var now = new Date().getTime();
    
    // Find the distance between now an the count down date
   /// var distance = countDownDate - now;
    
    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance1 / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance1 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance1 % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance1 % (1000 * 60)) / 1000);
    
    // Output the result in an element with id="demo"
    document.getElementById("demo").innerHTML =  minutes + "m " + seconds + "s ";
    distance1=distance1-1000;
    // If the count down is over, write some text 
    if (distance1 %60000 ===0) {
       var x1 = updateTime(function() {

           <% ResultSet rs=null;
           int a1=0;
try {
//	Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fish","root","");
  if(con!=null)
      System.out.println("Data is successfully updated!");
  else
      System.out.println("no connection");
   String sql1="select time from  Timer where team='"+session.getAttribute("team")+"'";
  // PreparedStatement ps = con.prepareStatement(sql);
     //   ps.executeUpdate();
     Statement stmt1 = null;
         stmt1=con.createStatement();  

         rs=stmt1.executeQuery(sql1); 
         
while(rs.next()) { 
    a1=rs.getInt(1);
    System.out.println(rs.getInt(1));
//System.out.println(rs.getInt(1)); //+"  "+rs.getString(2)+"  "+rs.getString(3));  
}


  String sql="Update Timer set time=? where team='"+session.getAttribute("team")+"'";  // Here u could set for which team time update krna hai like where teamname=...
  // here i have done subtraction not exact values. You guys would have exact values because of sessions
  // as i have not created sessions
  a1=a1-60000;
   PreparedStatement ps = con.prepareStatement(sql);
   ps.setInt(1, a1);
        ps.executeUpdate();
            

//step5 close the connection object  
con.close();
       
}catch(Exception e1)
{
    out.println(e1);
}
%>
    
    });   }
}, 1000);


</script>
 
	
 <style>
 body{
	     background-repeat:no-repeat;
		 background-image:url(level2.gif);
		 background-size:100% 100%;
		 
		}
 .modalDialog {
        position: fixed;
        font-family: Arial, Helvetica, sans-serif;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background: rgba(0,0,0,0.8);
        z-index: 99999;
        opacity:0;
        -webkit-transition: opacity 400ms ease-in;
        -moz-transition: opacity 400ms ease-in;
        transition: opacity 400ms ease-in;
        pointer-events: none;
    }

    .modalDialog:target {
        opacity:1;
        pointer-events: auto;
    }

    .modalDialog > div {
        width: 400px;
        position: relative;
        margin: 10% auto;
        padding: 5px 20px 13px 20px;
        border-radius: 10px;
        background: #fff;
        background: -moz-linear-gradient(#fff, #999);
        background: -webkit-linear-gradient(#fff, #999);
        background: -o-linear-gradient(#fff, #999);
    }

    .close {
        background: #606061;
        color: #FFFFFF;
        line-height: 25px;
        position: absolute;
        right: -12px;
        text-align: center;
        top: -10px;
        width: 24px;
        text-decoration: none;
        font-weight: bold;
        -webkit-border-radius: 12px;
        -moz-border-radius: 12px;
        border-radius: 12px;
        -moz-box-shadow: 1px 1px 3px #000;
        -webkit-box-shadow: 1px 1px 3px #000;
        box-shadow: 1px 1px 3px #000;
    }

    .close:hover { background: #00d9ff; }
	.button {
  padding: 15px 15px;
  font-size: 20px;
  text-align: center;
  cursor: pointer;
  margin : auto ;
  
  
  display : block ;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
	  
	#a1 {
	     margin-top:20px ;
         margin-left:50px;		 
		 height:25px ; 
		 width:50px; 
		 position:absolute;
		 text-align:center;
		 }
	#a2 {
	     margin-top:90px;
		 margin-left:50px;
		 
		 height:25px; 
		 width:150px;
		 position:absolute;
		 text-align:center;
		 }
	             
	#a3 {
	     margin-top:170px;
		 margin-left:50px;
		
		 height:25px; 
		 width:150px;
		 position:absolute;
		 text-align:center;
	     
	}
	#a4 {
	    margin-top:450px;
		margin-left:1100px;
		
		height:25px;
		width:150px;
		position:absolute;
		text-align:center;
	}
	#a5 {
	    margin-top:530px;
		margin-left:1100px;
		
		height:25px;
		width:150px;
		position:absolute;
		text-align:center;
	}
	.demo
	{
	color:white;
	margin-left:200px;
	}
	</style>
	 </head>
 <body>
  
  
<div id="a1" ><a href="#openModal1"><button class = "button" style="margin-top:50px">INSTRUCTION</button></a></div>

<div id="openModal1" class="modalDialog">
<div>
    <a href="#close" title="Close" class="close">X</a>
    <h2>INSTRUCTION</h2>
    <p>This is a sample modal box that can be created using the powers of CSS3.    </p>
    <p>You could do a lot of things here like have a pop-up ad that shows when your website loads, or create a login/register form for users.</p>
</div>
</div>
<div id="a2" ><a href="#openModal2"><button class = "button" style="margin-top:50px">QUESTION</button></a></div>

  <div id="openModal2" class="modalDialog">
<div>
    <a href="#close" title="Close" class="close">X</a>
    <h2>QUESTION</h2>
    <p><strong>Box 2</strong></p>
    <p>yadda yadda</p>
</div>
</div>

<div id="a3"><a href="#openModal3"><button class = "button" style="margin-top:50px">SUBMIT</button></a></div>
<div id="openModal3" class="modalDialog">
<div>
     <a href="#close" title="Close" class="close">X</a>
	 <h3>Enter your answer:</h3>
	 <br/>
	 <form method="post" action="score.jsp">
	 <input type="text" name="answer"><br/>
	 <input type="submit" value="submit" onclick="update()">
	 </form>
	 
</div>
</div>



<div id="a4"><a href="hurdle.html "><button class = "button" style="margin-top:50px">HOME</button></a></div>

<div id="a5"><a href="editor.jsp"><button class = "button" style="margin-top:50px">Open Editor</button></a></div>
	        <h1 id="demo" >Hello World!</h1>

</body>

</html>