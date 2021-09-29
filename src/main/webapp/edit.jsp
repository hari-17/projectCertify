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
            
            .updatebtn{
              
              font-weight: bold;
             
                
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

 <form method="post" action="processUpdate.jsp" class="container">
     
     <h1><%=resultSet.getString("emp_name")%>'s Certification Details</h1><br>
      
  <div class="form-group">
      <input hidden type="text" name="id" value="<%=resultSet.getString("id") %>">
      <label ><b>Employee Name</b></label>
    <input type="text" name="emp_name" class="form-control" value="<%=resultSet.getString("emp_name")%>" >
    
  </div>
    
  <div class="form-group">
      <label ><b>Email-ID</b></label>
    <input type="text"  name="email_id"  class="form-control" value="<%=resultSet.getString("email")%>" readonly>
    
  </div>
    
     <div class="form-group">
      <label ><b>Certificate ID</b></label>
    <input type="text"  name="certification_id"  class="form-control" value="<%=resultSet.getString("certification_id")%>"  >
  </div>
    
    
  <div class="form-group">
      <label ><b>Certificate Name</b></label>
    <input type="text"  name="certification_name"  class="form-control" value="<%=resultSet.getString("certification_name")%>"  >
  </div>
     
   <div class="form-group">
       <label ><b>Certificate Level</b></label>
    <input type="text"  name="certification_level"  class="form-control" value="<%=resultSet.getString("certification_level")%>"  >
    
  </div>
  <div class="form-group">
      <label ><bCSPb>CSP</label>
    <input type="text"  name="csp"  class="form-control" value="<%=resultSet.getString("csp")%>"  >
  </div>
  
  <div class="form-group">
      <label ><b>Date of Certification </b><small>yyyy-mm-dd</small></label>
    <input type="text"  name="doc"  class="form-control" value="<%=resultSet.getString("doc")%>"   >
    
  </div>
  <div class="form-group">
    <label ><b>Valid Till</b><small>yyyy-mm-dd</small></label>
    <input type="text"  name="expire_doc"  class="form-control" value="<%=resultSet.getString("expire_doc")%>" >
  </div>
     
      <div class="form-group">
    <label ><b>Validity</b>Validity</label>
    <input type="text"  name="validity"  class="form-control" value="<%=resultSet.getString("validity")%>"   >
    
  </div>
  
    <div class="updatebtn">
 
        <button onclick="closeT();"  type="submit" class="btn btn-outline-success btn-lg btn-block"><b>UPDATE</b></button>
    </div>
</form>
    
    <script>
        function closeT{
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


