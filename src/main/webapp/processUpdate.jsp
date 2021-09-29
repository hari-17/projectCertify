<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
 String id = request.getParameter("id");
String name=request.getParameter("emp_name");
String csp=request.getParameter("csp");
String email=request.getParameter("email_id");
String certify_level=request.getParameter("certification_level");
String certify_name=request.getParameter("certification_name");
String certify_id=request.getParameter("certification_id");
String doc=request.getParameter("doc");
String e_doc=request.getParameter("expire_doc");
String validity=request.getParameter("validity");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://projectcertify1.cgbcsl010njm.ap-south-1.rds.amazonaws.com/projectCertify", "admin", "12345678");
String sql="Update projectCertify set id=?,emp_name=?,email=?,csp=?,certification_level=?,certification_name=?,certification_id=?,doc=?,expire_doc=?,validity=? where id="+id;
ps = conn.prepareStatement(sql);
ps.setString(1, id);
ps.setString(2, name);
ps.setString(3, email);
ps.setString(4, csp);
ps.setString(5, certify_level);
ps.setString(6, certify_name);
ps.setString(7, certify_id);
ps.setString(8, doc);
ps.setString(9, e_doc);
ps.setString(10, validity);
int i = ps.executeUpdate();
if(i > 0)
{ 
response.sendRedirect("/projectCertify/profile.jsp");

}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
