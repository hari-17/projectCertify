<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://projectcertify1.cgbcsl010njm.ap-south-1.rds.amazonaws.com/";
String database = "projectCertify";
String userid = "admin";
String password = "12345678";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>



<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">    
        
	 <!--Cognito JavaScript-->
	<script src="js/amazon-cognito-identity.min.js"></script>  
	<script src="js/config.js"></script>
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
        
        
        
<style>
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,600,700&display=swap');

*{
  margin: 0;
  padding: 0;
  list-style: none;
  text-decoration: none;
  box-sizing: border-box;
  font-family: 'Montserrat', sans-serif;
}

body{
  background: #e1ecf2;
}

.wrapper{
  margin: 10px;
}

.wrapper .top_navbar{
  width: calc(100% - 20px);
  height: 60px;
  display: flex;
  position: fixed;
  top: 10px;
}

.wrapper .top_navbar .hamburger{
  width: 70px;
  height: 100%;
  background: #2e4ead;
  padding: 15px 17px;
  border-top-left-radius: 20px;
  
}

.wrapper .top_navbar .hamburger div{
  width: 35px;
  height: 4px;
  background: #92a6e2;
  margin: 5px 0;
  border-radius: 5px;
}

.wrapper .top_navbar .top_menu{
  width: calc(100% - 70px);
  height: 100%;
  background: #fff;
  border-top-right-radius: 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 20px;
  box-shadow: 0 1px 1px rgba(0,0,0,0.1);
}

.wrapper .top_navbar .top_menu .logo{
  color: #2e4ead;
  font-size: 20px;
  font-weight: 700;
  letter-spacing: 3px;
}

.wrapper .top_navbar .top_menu ul{
  display: flex;
}

.wrapper .top_navbar .top_menu ul li a{
  display: block;
  margin: 0 10px;
  width: 35px;
  height: 35px;
  line-height: 35px;
  text-align: center;
  border: 1px solid #2e4ead;
  border-radius: 50%;
  color: #2e4ead;
}

.wrapper .top_navbar .top_menu ul li a:hover{
  background: #4360b5;
  color: #fff;
}

.wrapper .top_navbar .top_menu ul li a:hover i{
  color: #fff;
}

.wrapper .sidebar{
  position: fixed;
  top: 70px;
  left: 10px;
  background: #2e4ead;
  width: 200px;
  height: calc(100% - 80px);
  border-bottom-left-radius: 20px;
  transition: all 0.3s ease;
}

.wrapper .sidebar ul li a{
    display: block;
    padding: 20px;
    color: #fff;
    position: relative;
    margin-bottom: 1px;
    color: #92a6e2;
    white-space: nowrap;
}

.wrapper .sidebar ul li a:before{
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 3px;
  height: 100%;
  background: #92a6e2;
  display: none;
}

.wrapper .sidebar ul li a span.icon{
  margin-right: 10px;
  display: inline-block;
}

.wrapper .sidebar ul li a span.title{
  display: inline-block;
}

.wrapper .sidebar ul li a:hover,
.wrapper .sidebar ul li a.active{
  background: #4360b5;
  color: #fff;
}

.wrapper .sidebar ul li a:hover:before,
.wrapper .sidebar ul li a.active:before{
  display: block;
}

.wrapper .main_container{
  width: calc(100% - 200px);
  margin-top: 70px;
  margin-left: 200px;
  padding: 15px;
  transition: all 0.3s ease;
}

.wrapper .main_container .item{
  background: #fff;
  margin-bottom: 10px;
  padding: 15px;
  font-size: 14px;
  line-height: 22px;
}

.wrapper.collapse .sidebar{
  width: 70px;
}

.wrapper.collapse .sidebar ul li a{
  text-align: center; 
}

.wrapper.collapse .sidebar ul li a span.icon{
  margin: 0;
}

.wrapper.collapse .sidebar ul li a span.title{
  display: none;
}

.wrapper.collapse .main_container{
  width: calc(100% - 70px);
  margin-left: 70px;
} 


 /* Modal Styles*/
 
 .cancelbtn {
  padding: 14px 20px;
   float: left;
  width: 50%;
 
}

.container {
  padding: 20px;
  width: 50%;
  height:40%;
}

.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 50px;
}

.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 40%; /* Could be more or less, depending on screen size */
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

.close {
  position: absolute;
  right: 27%;
  top: 70px;;
  font-size: 40px;
  font-weight: bold;
  color: #FFFFFF;
}

.close:hover,
.close:focus {
  color: #ff0000;
  cursor: pointer;
}

.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

.relodbtn{
     position: absolute;
right: 3%;
top: 16%;
    
}

.container{
    width:50%;
}

.height {
    height: 50px;
   
}

.search {
    position: relative;
    box-shadow: 0 0 40px rgba(51, 51, 51, .1)
}

.search input {
    height: 60px;
   
    text-indent: 25px;
    border: 2px solid #d6d4d4
}

.search input:focus {
    box-shadow: none;
    border: 2px solid blue
}

.search .fa-search {
    position: absolute;
    top: 20px;
    left: 16px
}

.search button {
    position: absolute;
    top: 5px;
    right: 5px;
    height: 50px;
    width: 110px;
    background: blue
}
    
    
</style>
  </head>
  <body>
         
      
      
<div class="wrapper">
  
  <div class="top_navbar">
    <div class="hamburger">
       <div class="one"></div>
       <div class="two"></div>
       <div class="three"></div>
    </div>
    <div class="top_menu">
      <div class="logo">
         PROJECT CERTIFY
      </div>
      <ul>
        
        
           <button type="button" class="btn btn-outline-danger my-2 my-sm-0" onclick="signOut()">Sign out</button>
         
      </ul>
    </div>
  </div>
  
  <div class="sidebar">
      <ul>
        <li><a href="profile.jsp">
         
          <span class="title"><i class="fas fa-home"></i>&nbsp;&nbsp;Home</span>
          </a></li>
          <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle"  aria-haspopup="true" >
          <i class="fas fa-address-card"></i>&nbsp;&nbsp;Certification
        </a>
        <div class="title-dropdown-menu" aria-labelledby="navbarDropdown">   
            <a class="dropdown-item" href="add.jsp"><i class="fas fa-plus-square"></i>&nbsp;&nbsp;Add</a>
            
            
          <div class="dropdown-divider"></div>
        </div>
      </li>
       
    </ul>
  </div>
  
  <div class="main_container">
    <div class="item">
        
  
        <table class="table table-hover table-dark">
         
   
       
	   <form action="search.jsp" id="srchForm" method="POST">
	    <div class="container">
	       
	                   <div class="search"> <i class="fa fa-search"></i> <input name="search" type="text" class="form-control" placeholder="Search By Name">     <button type="submit" value="Search" class="btn btn-primary">Search</button> </div>
	      
	               </div>
	            
	     </form>
    </div>

  <thead>
    <tr>
     
      <th scope="col">Name</th>
      <th scope="col">CSP</th>
      <th scope="col">Certification Name</th>
      <th scope="col">Action</th>
      <div class="relodbtn">
         <button class="btn btn-outline-primary"  onClick="window.location.reload();" ><i class="fas fa-redo-alt"></i></button>
     </div>
          
      
    </tr>
  </thead>
  
  <tbody>
      
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="SELECT * FROM projectCertify where emp_name like'"+request.getParameter("search")+"%'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
    <tr>
     
      <td><%=resultSet.getString("emp_name") %></td>
      <td><%=resultSet.getString("csp") %></td>
      <td><%=resultSet.getString("certification_name") %></td>
      <td><a target="_blank"  href="view.jsp?id=<%=resultSet.getInt("id")%>" type="button" class="btn btn-outline-light">View Details</a></td>
     
      
    </tr>
    <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}



%>
   
  </tbody>
</table>
    </div>
  </div>



   
	

        
    <script>
        
        
   
   /* Authentication*/     
    var data = { 
		UserPoolId : _config.cognito.userPoolId,
        ClientId : _config.cognito.clientId
    };
    var userPool = new AmazonCognitoIdentity.CognitoUserPool(data);
    var cognitoUser = userPool.getCurrentUser();
	
	window.onload = function(){
    if (cognitoUser != null) {
        cognitoUser.getSession(function(err, session) {
            if (err) {
                alert(err);
                return;
            }
            console.log('session validity: ' + session.isValid());
			//Set the profile info
			cognitoUser.getUserAttributes(function(err, result) {
				if (err) {
					console.log(err);
					return;
				}
				console.log(result);
				document.getElementById("email_value").innerHTML = result[2].getValue();	
			});			
			
        });
    }
}
	function signOut(){
           
	    if (cognitoUser != null) {
                 console.log('hi');
                
          cognitoUser.signOut();
          window.close("/projectCertify/profile.jsp");
        }
	}
    </script>
  </body>
</html>
