<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://projectcertify1.cgbcsl010njm.ap-south-1.rds.amazonaws.com/projectCertify", "admin", "12345678");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM projectCertify WHERE id="+id);
response.sendRedirect("admin_retrieve.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>