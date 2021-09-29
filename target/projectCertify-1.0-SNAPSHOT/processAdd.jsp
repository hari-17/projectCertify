<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*,java.util.*"%>

<%
 Connection conn=null;   
PreparedStatement ps = null;
ResultSet rs=null;
 FileInputStream fis=null;


String name=request.getParameter("emp_name");
String csp=request.getParameter("csp");
String email=request.getParameter("email_id");
String certify_level=request.getParameter("certification_level");
String certify_name=request.getParameter("certification_name");
String certify_id=request.getParameter("certification_id");
String doc=request.getParameter("doc");
String e_doc=request.getParameter("expire_doc");
String validity=request.getParameter("validity");
String mypic=request.getParameter("filename");

try{
Class.forName("com.mysql.cj.jdbc.Driver");

conn=DriverManager.getConnection("jdbc:mysql://projectcertify1.cgbcsl010njm.ap-south-1.rds.amazonaws.com/projectCertify", "admin", "12345678");
File image= new File(mypic);
 
ps = conn.prepareStatement("insert into projectCertify(emp_name,email,csp,certification_level,certification_name,certification_id,doc,expire_doc,validity,pic) " + "values(?,?,?,?,?,?,?,?,?,?)");
 out.print("hiii4");
  out.print(image);
ps.setString(1, name);
ps.setString(2, email);
ps.setString(3, csp);
ps.setString(4, certify_level);
ps.setString(5, certify_name);
ps.setString(6, certify_id);
ps.setString(7, doc);
ps.setString(8, e_doc);
ps.setString(9, validity);
 out.print("hiii5");

fis=new FileInputStream(image); 
 out.print("hiii6");
ps.setBinaryStream(10,(InputStream)fis, (int) (image.length()));
int count = ps.executeUpdate();
if(count>0){
    out.print("hiii4");
    response.sendRedirect("profile.jsp");
}
else
{
     out.print("hiii");
out.println("not successfully");

}

}
catch(Exception ex)
{
ex.printStackTrace();
}
 finally{
try{
if(rs!=null){
rs.close();
rs= null;
}
if(ps !=null)
{
ps.close();
ps=null;
}
if(conn!=null)
{
conn.close();
conn=null;
}
}
catch(Exception e)
{
e.printStackTrace();
}
}

%>