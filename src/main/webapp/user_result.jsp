<%-- 
    Document   : user_result
    Created on : 26-Sep-2021, 7:43:57 pm
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
        <style>
            body{
                margin-left:25%;
                background:  #e1ecf2;
                font-family: 'Montserrat', sans-serif;
            }
            .panel{
                position: relative;
                padding: 20px;
                margin-top: 60px;
                margin-left: 10px;
                border-radius: 3px;
                background-color: white;
                box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.14);
            }

            .title{
                position: relative;
                height: 50px;
                padding-top: 10px;
                float: left;
                padding-left: 15px;
                padding-right: 15px;
                font-size: 21px;
                color: white;
                border-radius: 4px;
                margin-left:15px;
                text-align: center;
                margin-top: -45px;
                background:  linear-gradient(60deg, #ffa726, #fb8c00);
                box-shadow: 0 4px 20px 0px rgba(0, 0, 0, 0.14), 0 7px 10px -5px rgba(233, 0, 0, 0.4);
            }

            .profile{
                font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
                margin-top: 70px;
            }
            .profile .tag{
                font-size: 17px;
                padding:10px;
                text-align: left;
                background: cadetblue;
                color: white;
                display: inline-block;border-bottom: 1px solid cadetblue;

                min-width: 120px !important;

            }
            .profile .val{
                text-align: left;
                min-width: 370px !important;
                font-size: 17px;
                font-weight: normal;
                padding:10px;
                display: inline-block;
                background: white ;
                border-bottom: 1px solid cadetblue;
            }
            .profile .val:hover{
                background: #CCCCCC; 
            }
            .profile h2{
                margin-bottom:1px;
                box-shadow: 1px 1px 3px #082F38;
                max-width: 530px;
            }



        </style>
    </head>
    <body>
        <%

            Exams result = pDAO.getResultByExamId(Integer.parseInt(request.getParameter("eid")));
        %>
        <div  class="panel" style="float: left;max-width: 900px">
            <div class="title"><b>Result of the Quiz<b></div>
                        <div class="profile">
                            <span style="font-weight:bold;" class="tag">Exam Date:</span><span class="val"><%=result.getDate()%></span><br/>
                            <span style="font-weight:bold;" class="tag">Start Time:</span><span class="val"><%=result.getStartTime()%></span><br/>
                            <span style="font-weight:bold;" class="tag">End Time:</span><span class="val"><%=result.getEndTime()%></span><br/>
                            <span style="font-weight:bold;" class="tag">Quiz Name:</span><span class="val"><%=result.getcName()%></span><br/>
                            <span style="font-weight:bold;" class="tag"> Marks:</span><span class="val"><%=result.getObtMarks()%></span><br/>
                            <span style="font-weight:bold;" class="tag">Tot Marks:</span><span class="val"><%=result.gettMarks()%></span><br/>
                            <span style="font-weight:bold;" class="tag">Result:</span><span class="val"><%=result.getStatus()%></span></h2><br><br>
                            <button  class="btn btn-primary" id="generatePDF">Download Result</button>

                        </div>

                        </div>

                        <script type="text/javascript">
                           
                                alert("Quiz Submitted Successfully!!");
                          

                            var doc = new jsPDF();
                            var specialElementHandlers = {
                                '#editor': function (element, renderer) {
                                    return true;
                                }
                            };


                            $('#generatePDF').click(function () {
                                doc.fromHTML($('.panel').html(), 15, 15, {
                                    'width': 500,
                                    'elementHandlers': specialElementHandlers
                                });
                                doc.save('result.pdf');
                            });
                        </script>

                        </body>
                        </html>
