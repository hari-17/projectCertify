<%@page import="java.time.LocalTime"%>
<%@page import="net.code.projectcertify.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <jsp:useBean id="pDAO" class="net.code.projectcertify.DatabaseClass" scope="page"/>
 <%
   if(request.getParameter("page").toString().equals("courses")){
    if(request.getParameter("operation").toString().equals("addnew")){
        pDAO.addNewCourse(request.getParameter("coursename"),Integer.parseInt(request.getParameter("totalmarks")),
                request.getParameter("time"));
        response.sendRedirect("admin_courses.jsp");
    }else if(request.getParameter("operation").toString().equals("del")){
        pDAO.delCourse(request.getParameter("cname").toString());
        response.sendRedirect("admin_courses.jsp");
    }
   }
   
   
else if(request.getParameter("page").toString().equals("questions")){
    if(request.getParameter("operation").toString().equals("addnew")){
        pDAO.addQuestion(request.getParameter("coursename"),request.getParameter("question"),
                request.getParameter("opt1"), request.getParameter("opt2"),request.getParameter("opt3"),
        request.getParameter("opt4"), request.getParameter("correct"));
        response.sendRedirect("admin_questions.jsp");
    }else if(request.getParameter("operation").toString().equals("delQuestion")){
        pDAO.delQuestion(Integer.parseInt(request.getParameter("qid")));
        response.sendRedirect("admin_questions.jsp");
        
    }

}

else if(request.getParameter("page").toString().equals("exams")){
    if(request.getParameter("operation").toString().equals("startexam")){
        String cName=request.getParameter("coursename");
        String emailid = request.getParameter("email");
        
        int examId=pDAO.startExam(cName,emailid);
        session.setAttribute("examId",examId);
        session.setAttribute("examStarted","1");
        response.sendRedirect("questions.jsp?coursename="+cName);
    }

   
else if(request.getParameter("operation").toString().equals("submitted")){
        try{
        String time=LocalTime.now().toString();
        int size=Integer.parseInt(request.getParameter("size"));
        int eId=Integer.parseInt(session.getAttribute("examId").toString());
        int tMarks=Integer.parseInt(request.getParameter("totalmarks"));
        session.removeAttribute("examId");
        session.removeAttribute("examStarted");
        for(int i=0;i<size;i++){
            String question=request.getParameter("question"+i);
            String ans=request.getParameter("ans"+i);
            
            int qid=Integer.parseInt(request.getParameter("qid"+i));
            
            pDAO.insertAnswer(eId,qid,question,ans);
        }
        System.out.println(tMarks+" conn\t Size: "+size);
        pDAO.calculateResult(eId,tMarks,time,size);
        
        response.sendRedirect("user_result.jsp?eid="+eId);
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
    }

}
     
    
%>