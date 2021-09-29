<%-- 
    Document   : questions
    Created on : 26-Sep-2021, 12:12:16 pm
    Author     : Hari
--%>
<%@page import="net.code.projectcertify.classes.Exams"%>
<%@page import="net.code.projectcertify.classes.Questions"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="net.code.projectcertify.DatabaseClass" scope="page"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">    

        <style>
            body{
                background: #e1ecf2;
                font-family: 'Montserrat', sans-serif;
            }



            .question-label{
                position: relative;
                width: 50px;
                height: 50px;
                padding-top: 10px;
                float: left;
                font-size: 21px;
                color: black;
                border-radius: 4px;
                margin-left: 15px;
                text-align: center;
                margin-top: -65px;
                background: linear-gradient(60deg, #86b3fc, #86b3fc);
                box-shadow: 5px 10px #888888;
            }
            .question{
                margin-top: 60px;
                position: relative;
                padding-top: 25px;
                width: 78%;
                min-height: 100px;
                font-size: 24px;
                background-color: white;
                box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.14);
            }

            .answer{
                padding-bottom: 9em;
                margin-top: 4px;
                margin-left:2em;
                width: 83%;
                max-height: 200px;
                font-size: 15px;


            }
            .answer input[type="radio"]:checked + label{
                background: linear-gradient(60deg, #66bb6a, #43a047);
                color: white;
            }

            .answer input[type="radio"] + label {
                margin-top: 10px;
                margin-left: 22px;
                border-radius: 5px;
                border:1px solid green;
                padding:5px;
                float: left;
            }
            .answer .show,.show-correct{
                margin-top: 10px;
                margin-left: 15px;
                border-radius: 5px;
                border:1px solid green;
                padding:5px;
                float: left;
            }


            .content-area{
                position: absolute;
                right: 0;
                top: 80px;
                min-width: calc( 100% - 300px );
                padding: 20px; 
                padding-left: 30px;
            }
            .content-area .inner{
                position: relative;
                width: 98%;
                min-height: 500px;
                margin-left: 10px;
                border-radius: 3px;
                background-color: white;
                box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.14);
            }

            #remainingTime {
                background: #ffe600;
                animation: shake 0.5s;
                animation-iteration-count: infinite;
            }

            @keyframes shake {
                0% { transform: translate(1px, 1px) rotate(0deg); }
                10% { transform: translate(-1px, -2px) rotate(-1deg); }
                20% { transform: translate(-3px, 0px) rotate(1deg); }
                30% { transform: translate(3px, 2px) rotate(0deg); }
                40% { transform: translate(1px, -1px) rotate(1deg); }
                50% { transform: translate(-1px, 2px) rotate(-1deg); }
  60% { transform: translate(-3px, 1px) rotate(0deg); }
  70% { transform: translate(3px, 1px) rotate(-1deg); }
  80% { transform: translate(-1px, -1px) rotate(1deg); }
  90% { transform: translate(1px, 2px) rotate(0deg); }
  100% { transform: translate(1px, -2px) rotate(-1deg); }
}

        </style>   

    </head>
    <body id="outside">
        <h1  style="text-align:center;font-family: 'Montserrat'; background: white;color: #2e4ead"><%= request.getParameter("coursename")%>- Quiz</h1>
                <span class="time" id="remainingTime" style="position: fixed;top: 23em;left:53em;font-size: 23px;border-radius: 5px;padding: 10px;box-shadow: 2px -2px 6px 0px;"> </span>

        <script>
                        var time = <%=pDAO.getRemainingTime(Integer.parseInt(session.getAttribute("examId").toString()))%>;
                        time--;
                        var sec = 60;
                        document.getElementById("remainingTime").innerHTML =time + " : " + sec;
                        //it calls fuction after specific time again and again                  
                        var x = window.setInterval(timerFunction, 1000);

                        function timerFunction() {
                            sec--;
                            // Display the result in the element with id="demo"


                            if (time < 0) {
                                clearInterval(x);
                                document.getElementById("remainingTime").innerHTML = "00 : 00";
                                document.getElementById("myform").submit();
                            }
                            document.getElementById("remainingTime").innerHTML = time + " : " + sec;
                            if (sec == 0) {
                                sec = 60;
                                time--;

                            }
                        }
        </script>

        <form id="myform" action="controller.jsp">

            <%
                ArrayList list = pDAO.getQuestions(request.getParameter("coursename"),20);
                Questions question;
            %>
            <input type="hidden" name="size" value="<%=list.size()%>">
            <input type="hidden" name="totalmarks" value="<%=pDAO.getTotalMarksByName(request.getParameter("coursename"))%>">

            <%
                for (int i = 0; i < list.size(); i++) {
                    question = (Questions) list.get(i);
            %>


            <center>
                <div class="question-panel" style="width:70em;">
                    <div class="question" >
                        <label class="question-label"><%=i + 1%></label>
                        <center style="font-size: 20px;padding: 35px;"><%=question.getQuestion()%></center>
                    </div>
                    <div class="answer" >
                        <input type="radio" id="c1<%=i%>" name="ans<%=i%>" value="<%=question.getOpt1()%>"/>
                        <label for="c1<%=i%>"><%=question.getOpt1()%></label>
                        <input type="radio" id="c2<%=i%>" name="ans<%=i%>" value="<%=question.getOpt2()%>" />
                        <label for="c2<%=i%>"><%=question.getOpt2()%></label>
                        <input type="radio" id="c3<%=i%>" name="ans<%=i%>" value="<%=question.getOpt3()%>" />
                        <label for="c3<%=i%>"><%=question.getOpt3()%></label>
                        <input type="radio"  id="c4<%=i%>" name="ans<%=i%>" value="<%=question.getOpt4()%>"/>
                        <label for="c4<%=i%>" ><%=question.getOpt4()%></label>

                    </div>
                </div>
                <input type="hidden" name="question<%=i%>" value="<%=question.getQuestion()%>">
                <input type="hidden" name="qid<%=i%>" value="<%=question.getQuestionId()%>">




                <%
                    }

                %>  


                <input type="hidden" name="page" value="exams">
                <input type="hidden" name="operation" value="submitted"> 
                <input style="width:45em;margin-bottom:40px;font-weight: bold;" type="submit" class="btn btn-success btn-lg btn-block" value="SUBMIT">
                </form>

                </body>
                
                <script>
                   
var i=3;
document.addEventListener('visibilitychange', function() {
    
    
    if((document.hidden))
    {
       alert("Enabled Tab-Proctoring, Remaining : "+i);
         if(i==0){
            alert("You have been trying to change the tab frequently, Please contact the Quiz Co-ordinator"); 
           window.close();
       }
       i--;
     
    
    }
   
    console.log(document.hidden);
  
});
                    
                    
                    
                </script>
                </html>
                
                
