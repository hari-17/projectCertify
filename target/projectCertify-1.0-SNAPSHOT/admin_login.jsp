<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">

	<!-- Javascript SDKs-->
	<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 
        
	
	
        
          <style>
             body {background-image:url("https://png.pngtree.com/thumb_back/fh260/back_pic/04/57/30/0358667282a6ebe.jpg");
             background-repeat: no-repeat;
               background-size: cover;}
         </style>

  </head>
 <body>
    <form action="<%=request.getContextPath()%>/login" method="post">
      <h1 style="margin:150px 20px 20px 680px">Admin Login</h1>
      
      
      <label style="margin:150px 20px 20px 650px ; font-family:Tahoma" >Email:</label>
      <input style="margin:10px 20px 20px 650px" type="text" id="inputUsername"  placeholder="Email address" name="username"  required autofocus><br>
      <label style="margin:150px 20px 20px 650px ; font-family:Tahoma" >Password:</label>
      <input style="margin:10px 20px 20px 650px" type="password" id="inputPassword"  placeholder="Password" name="password" required><br>    
      <button style="margin:10px 20px 20px 700px" type="submit" >Sign in</button><br>
      <label style="margin:7px 20px 20px 650px; color:black ;font-family:Tahoma">If you are not an Admin <a href='/projectCertify/login.jsp'>Click here for User Login</a></label><br>
        
       
      

    </form>
 </body>
</html>