
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">

	<!-- Javascript SDKs-->
	<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 
        
	<script src="js/amazon-cognito-auth.min.js"></script>
	<script src="https://sdk.amazonaws.com/js/aws-sdk-2.7.16.min.js"></script> 
	<script src="js/amazon-cognito-identity.min.js"></script>   
	<script src="js/config.js"></script>
        
          <style>
             body {background-image:url("https://png.pngtree.com/thumb_back/fh260/back_pic/04/57/30/0358667282a6ebe.jpg");
             background-repeat: no-repeat;
               background-size: cover;}
         </style>

  </head>
 <body>
    <form action="profile.jsp">
      <h1 style="margin:150px 20px 20px 680px">User Login</h1>
      
      
      <label style="margin:150px 20px 20px 650px ; font-family:Tahoma" >Email:</label>
      <input style="margin:10px 20px 20px 650px" type="email" id="inputUsername"  placeholder="Email address" name="username" required autofocus><br>
      <label style="margin:150px 20px 20px 650px ; font-family:Tahoma" >Password:</label>
      <input style="margin:10px 20px 20px 650px" type="password" id="inputPassword"  placeholder="Password" name="password" required><br>    
      <button style="margin:10px 20px 20px 700px" type="button" onclick="signInButton()">Sign in</button><br>
      <label style="margin:7px 20px 20px 650px; color:black ;font-family:Tahoma">If you don't have an account  <a href='/projectCertify/register.html'>Register Here</a></label><br>
        
       
      

    </form>
     
<script>

  function signInButton() {
    
	var authenticationData = {
        Username : document.getElementById("inputUsername").value,
        Password : document.getElementById("inputPassword").value,
    };
	
    var authenticationDetails = new AmazonCognitoIdentity.AuthenticationDetails(authenticationData);
    
	var poolData = {
        UserPoolId : _config.cognito.userPoolId, 
        ClientId : _config.cognito.clientId, 
    };
	
    var userPool = new AmazonCognitoIdentity.CognitoUserPool(poolData);
	
    var userData = {
        Username : document.getElementById("inputUsername").value,
        Pool : userPool,
    };
	
    var cognitoUser = new AmazonCognitoIdentity.CognitoUser(userData);
    
	cognitoUser.authenticateUser(authenticationDetails, {
        onSuccess: function (result) {
			var accessToken = result.getAccessToken().getJwtToken();
			console.log(accessToken);
                        window.open("http://localhost:8080/projectCertify/profile.jsp")
            
        },

        onFailure: function(err) {
            alert(err.message || JSON.stringify(err));
        },
    });
  }
  
 
</script>
</body>
</html>








