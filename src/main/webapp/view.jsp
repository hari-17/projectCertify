<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
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

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">    
        <title>View Details</title>
        
        <style>
            
            body{
                background-color: #e1ecf2;
                
                
            }
            .container{
                background-color: white;
                width:50%;
                margin-top: 5%;
                margin-bottom: 5%;
                border-radius: 10px;
                padding-bottom: 10px;
            }
            
           img {
  border: 5px solid #555;
}
       
            
        </style>
       
            
            
            
    
        
        
        
    </head>
<body>
    <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from projectCertify where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

 <form class="container">
     <h1><%=resultSet.getString("emp_name")%>'s Certification Details</h1><br>
      
  <div class="form-group">
      <label ><b>Employee Name</b></label>
    <input type="text" class="form-control" value="<%=resultSet.getString("emp_name")%>" readonly>
    
  </div>
    
  <div class="form-group">
      <label ><b>Email-ID</b></label>
    <input type="text" class="form-control" value="<%=resultSet.getString("email")%>" readonly>
    
  </div>
    
     <div class="form-group">
      <label ><b>Certificate ID</b></label>
    <input type="text" class="form-control" value="<%=resultSet.getString("certification_id")%>"  readonly>
  </div>
    
    
  <div class="form-group">
      <label ><b>Certificate Name</b></label>
    <input type="text" class="form-control" value="<%=resultSet.getString("certification_name")%>"  readonly>
  </div>
     
   <div class="form-group">
       <label ><b>Certificate Level</b></label>
    <input type="text" class="form-control" value="<%=resultSet.getString("certification_level")%>"  readonly>
    
  </div>
  <div class="form-group">
      <label ><bCSPb>CSP</label>
    <input type="text" class="form-control" value="<%=resultSet.getString("csp")%>"  readonly>
  </div>
  
  <div class="form-group">
      <label ><b>Date of Certification </b><small>(yyyy-mm-dd)</small></label>
    <input type="text" class="form-control" value="<%=resultSet.getString("doc")%>"   readonly>
    
  </div>
  <div class="form-group">
    <label ><b>Valid Till </b><small>(yyyy-mm-dd)</small></label>
    <input type="text" class="form-control" value="<%=resultSet.getString("expire_doc")%>" readonly>
  </div>
     
      <div class="form-group">
          <label ><b>Validity</b></label>
    <input type="text" class="form-control" value="<%=resultSet.getString("validity")%>"   readonly>
    
  </div>
    
       <div class="form-group">
          <label ><b>Your Certificate</b></label>
          <img  width="650" height="500"  src="images/<%=resultSet.getString("imageFileName")%>"  readonly>
    
  </div>
  
    <div onclick="closeT()" class="bckbtn">
   <button onclick="closeT();"  type="submit" class="btn btn-outline-danger btn-lg btn-block"><b>GO BACK</b></button>
    </div>
</form>
    <script>
        function closeT()
        {
            window.close();
        }
        </script>
    


</body>
      <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}



%>
   
</html>


