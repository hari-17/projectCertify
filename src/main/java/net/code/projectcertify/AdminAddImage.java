package net.code.projectcertify;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "AdminAddImage", urlPatterns = {"/AdminAddImage"})
public class AdminAddImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("In do post method of Add Image servlet.");
		Part file=request.getPart("image");
		
		String imageFileName=file.getSubmittedFileName();  // get selected image file name
		System.out.println("Selected Image File Name : "+imageFileName);
		
		String uploadPath="C:/Users/Hari/OneDrive/Documents/NetBeansProjects/projectCertify/src/main/webapp/images/"+imageFileName;  // upload path where we have to upload our actual image
		System.out.println("Upload Path : "+uploadPath);
		
		// Uploading our selected image into the images folder
		
		try
		{
		
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=file.getInputStream();
		
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		
		}
		
		
                catch(IOException e)
		{
		}
		//**********************
		
		//getting database connection (jdbc code)
		Connection conn=null;
		try 
		{
                        String name=request.getParameter("emp_name");
                        String csp=request.getParameter("csp");
                        String email=request.getParameter("email_id");
                        String certify_level=request.getParameter("certification_level");
                        String certify_name=request.getParameter("certification_name");
                        String certify_id=request.getParameter("certification_id");
                        String doc=request.getParameter("doc");
                        String e_doc=request.getParameter("expire_doc");
                        String validity=request.getParameter("validity");
			Class.forName("com.mysql.cj.jdbc.Driver");
                        conn=DriverManager.getConnection("jdbc:mysql://projectcertify1.cgbcsl010njm.ap-south-1.rds.amazonaws.com/projectCertify", "admin", "12345678");
			PreparedStatement ps;
			String query="insert into projectCertify(emp_name,email,csp,certification_level,certification_name,certification_id,doc,expire_doc,validity,imageFileName) values(?,?,?,?,?,?,?,?,?,?)";
			 ps = conn.prepareStatement(query);
                         ps.setString(1, name);
                         ps.setString(2, email);
                         ps.setString(3, csp);
                         ps.setString(4, certify_level);
                         ps.setString(5, certify_name);
                         ps.setString(6, certify_id);
                         ps.setString(7,doc);
                         ps.setString(8, e_doc);
                         ps.setString(9, validity);
                         ps.setString(10, imageFileName);
               
			int row=ps.executeUpdate(); // it returns no of rows affected.
			
			if(row>0)
			{
				response.sendRedirect("admin_retrieve.jsp");
			}
			
			else
			{
				System.out.println("Failed to upload data.");
			}
			
			
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		
	}

}