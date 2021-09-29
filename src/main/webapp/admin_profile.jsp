
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
          PROJECT CERTIFY - ADMIN
      </div>
      <ul>
        
        
           <button type="button" class="btn btn-outline-danger my-2 my-sm-0" onclick="signOut()">Sign out</button>
         
      </ul>
    </div>
  </div>
  
  <div class="sidebar">
      <ul>
        <li><a href="admin_profile.jsp">
         
          <span class="title"><i class="fas fa-home"></i>&nbsp;&nbsp;Home</span>
          </a></li>
          <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle"  aria-haspopup="true" >
          <i class="fas fa-address-card"></i>&nbsp;&nbsp;Certification
        </a>
        <div class="title-dropdown-menu" aria-labelledby="navbarDropdown">   
            <a class="dropdown-item" href="admin_add.jsp"><i class="fas fa-plus-square"></i>&nbsp;&nbsp;Add</a>
            <a class="dropdown-item" href="admin_retrieve.jsp"><i class="fas fa-eye"></i>&nbsp;&nbsp;View</a>
            <a class="dropdown-item" href="admin_search.jsp"><i class="fas fa-search"></i>&nbsp;&nbsp;Search</a>
          </li>   
          
           <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle"  aria-haspopup="true" >
          <i class="far fa-clipboard"></i>&nbsp;&nbsp;Quiz Test
        </a>
              
               <div class="title-dropdown-menu" aria-labelledby="navbarDropdown">   
            <a class="dropdown-item" href="admin_courses.jsp"><i class="fas fa-book-open"></i>&nbsp;&nbsp;Courses</a>
            <a class="dropdown-item" href="admin_questions.jsp"><i class="fas fa-question-circle"></i>&nbsp;&nbsp;Questions</a>
            <a class="dropdown-item" href="admin_search.jsp"><i class="fas fa-poll"></i>&nbsp;&nbsp;Result</a>
               </div>
              
          </li> 
         
      </ul>
        </div>
     
       
    
  </div>
  
  <div class="main_container">   
      <div class="item">
        
          
          <h1 style="margin-left: 50%;" ><b>WELCOME ADMIN</b></h1>
      
        
       
        
   
  </div>
</div>
      
      
      
      
    
      <div >
          
                
       
		
      
	
	

	
          
          
          
      </div>
	

        

  </body>
</html>
