
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">    
        
	 <!--Cognito JavaScript-->
	
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
        
      <form enctype="multipart/form-data" action="AddImage" method="post">
    
     <div class="form-row">
    <div class="form-group col-md-6">
      <label >Name</label>
      <input name="emp_name" type="text" class="form-control"  placeholder="Enter Name">
    </div>
    <div class="form-group col-md-6">
      <label >Email-ID</label>
      <input name="email_id" type="email" class="form-control"  placeholder="Enter Email-ID">
    </div>
  </div>
  
     <div class="form-row">
    <div class="form-group col-md-6">
      <label >Certificate ID</label>
      <input name="certification_id" type="text" class="form-control"  placeholder="Enter Certificate ID">
    </div>
    <div class="form-group  col-md-6">
      <label >Certificate Name</label>
      <input name="certification_name" type="text" class="form-control"  placeholder="Enter Certificate Name">
    </div>
  </div>
    
   <div class="form-row">
    
    <div class="form-group col-md-4">
      <label >Certification Level</label>
      <input name="certification_level" type="text" class="form-control"  placeholder="Enter Certification Level">
    </div>
   <div class="form-group col-md-2">
      <label >CSP</label>
      <select name="csp"  class="form-control">
        <option selected>Choose...</option>
        <option>AWS</option>
        <option>Azure</option>
        <option>GCP</option>
      </select>
    </div>
      
  <div class="custom-file  mb-3  md-6">
       
      <input type="file" class="custom-file-input" id="customFile" name="image">
      <span class="custom-file-label" for="customFile">Upload Certification <small>as JPG</small></span>
    </div>
   </div>
 
  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputCity">Date of Certification</label>
      <input name="doc" type="date" class="form-control"  >
    </div>
    <div class="form-group col-md-4">
      <label >Valid till</label>
      <input name="expire_doc" type="date" class="form-control" >
    </div>
  <div class="form-group col-md-2">
      <label >Validity</label>
      <input name="validity" type="number" min="1" max="10" class="form-control"  >
    </div>

  </div>
   </div>
      
     <button type="submit" class="btn btn-primary">Update </button>

    
</form>
   
  </div>
</div>
      <script>

$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>
      
      
      
    
   
	

        
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
