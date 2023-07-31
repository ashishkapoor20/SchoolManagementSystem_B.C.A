<%-- 
    Document   : sendmail
    Created on : Jul 2, 2019, 1:01:05 PM
    Author     : abc
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@page import="java.util.Random.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="fontawesome-free-5.9.0-web/css/all.css">
        <link rel="stylesheet" href="css/style.css">
        <title>OTP Verification-Student Management System</title>
    </head>
    <body>
        <!--full header-->
        <header>
            <!--top header-->
            <div id="topHeader" class="p-1">
                <div class="container-fluid">
                    <div class="row">
                        <div class="cols-12">
                            <a href="tel:7011796901" class="p-1"><i class="fas fa-phone"></i> +(91)7011796901</a>
                            <a href="mailto:spriyank113@gmail.com" class="p-1"> | <i class="fas fa-envelope"></i>spriyank113@gmail.com</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--bottom header-->
            <div id="bottomHeader">
                <div class="container-fluid">
                    <nav class="navbar navbar-dark bg-dark navbar-expand-md">
                        <a href="#" class="navbar-brand">
                            <img src="images\logo.png" height=50 width=100>
                        </a>
                        <button data-toggle="collapse" data-target="#navbarToggler" type="button" class="navbar-toggler"><span
                                class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarToggler">
                            <ul class="navbar-nav">
                                <li class="navbar-item">
                                    <a href="index.html" class="navbar-link">Home</a> &nbsp;  &nbsp;  &nbsp; 
                                </li>
                                <li class="navbar-item dropdown">
                                    <a href="#" class="navbar-link dropdown-toggle" data-toggle="dropdown" role="button">About Us</a> &nbsp;  &nbsp;  &nbsp;
                                    <div class="dropdown-menu">
                                        <a href="schoolnews.html" class="dropdown-item">School in news</a>
                                        <a href="moto.html" class="dropdown-item">our moto</a>
                                        <a href="vision.html" class="dropdown-item">our vision</a>
                                        <a href="aboutschool.html" class="dropdown-item">about the school</a>
                                    </div>
                                </li>

                                <li class="navbar-item">
                                    <a href="contactus.html" class="navbar-link">Contact Us</a> &nbsp;  &nbsp;  &nbsp;
                                </li>

                                <li class="navbar-item">
                                    <a href="login.html" class="navbar-link">Login</a> &nbsp;  &nbsp;  &nbsp;
                                </li>

                                <li class="navbar-item">
                                    <a href="feedback.html" class="navbar-link">Feedback</a> &nbsp;  &nbsp;  &nbsp; 
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </header>
        <section class="breadcrumbs-section">
            <div class="container p-1 p-sm-3">
                <div class="row">
                    <div class="col-12">
                        <h2>Forgot Password</h2>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="index.html">Home</a>
                            </li>
                            <li class="breadcrumb-item active">
                                <a href="forgotpass.html">Forgot Password</a>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <div class="container">
            <div class="row">
                <div class="col-md-7 p-2">
                    <img class="img-fluid" src="images\logo.png">
                    <p><i>EFFECTIVE OF MANAGING ALL STUDENTS DATA</i></p>
                </div>
                <div class="col-md-5 p-2 pl-4 text-center">
                    <br>
                    <br>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="search">
                        <div class="input-group-append">
                            <button class="btn btn-success" type="submit">SEARCH</button>
                        </div>
                    </div>
                    <a href="https://www.youtube.com/channel/UC6-SK-rS2xMWqHyqYMVf73A" target="_blank"  style="color: black">YOUTUBE VIDEOS</a> |&nbsp;
                    <a href="#" style="color: black">SCHOOL IN NEWS</a> |&nbsp;
                    <a href="#" style="color: black">PREVIOUS RESULTS</a> &nbsp;
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center">
                    <img src="images/login.png" class="img-fluid">
                </div>
                <div class="col-md-6 text-center">
                    <h2 style="color: rgba(0, 181, 204, 1)"><i>OTP Verification</i></h2>
                    <br>
                    <%
                        String email = (String) session.getAttribute("em");
                        //String psw = (String)session.getAttribute("op");
                        //Creating a result for getting status that messsage is delivered or not!
                        Random rd = new Random();
                        int x = rd.nextInt(9000) + 1000;

                        String result;
                        // Get recipient's email-ID, message & subject-line from index.html page
                        final String to = email;
                        final String subject = "OTP for Change Password";
                        final String messg = "your OTP  is " + x;

                        // Sender's email ID and password needs to be mentioned
                        final String from = "spriyank113@gmail.com";
                        final String pass = "spellmyname";

                        // Defining the gmail host
                        String host = "smtp.gmail.com";

                        // Creating Properties object
                        Properties props = new Properties();

                        // Defining properties
                        props.put("mail.smtp.host", host);
                        props.put("mail.transport.protocol", "smtp");
                        props.put("mail.smtp.auth", "true");
                        props.put("mail.smtp.starttls.enable", "true");
                        props.put("mail.user", from);
                        props.put("mail.password", pass);
                        props.put("mail.port", "465");

                        // Authorized the Session object.
                        Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
                            @Override
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(from, pass);
                            }
                        });

                        try {
                            // Create a default MimeMessage object.
                            MimeMessage message = new MimeMessage(mailSession);
                            // Set From: header field of the header.
                            message.setFrom(new InternetAddress(from));
                            // Set To: header field of the header.
                            message.addRecipient(Message.RecipientType.TO,
                                    new InternetAddress(to));
                            // Set Subject: header field
                            message.setSubject(subject);
                            // Now set the actual message
                            message.setText(messg);
                            // Send message
                            Transport.send(message);
                    %>
                    <form action="checkotp.jsp" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                Enter OTP
                            </div>
                            <div class="form-group col-md-6">
                                <input type="text" name="userotp" required="" class="form-control">
                                <input type="hidden" name="systemotp" value="<%=x%>">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12 text-center">
                                <button class="btn btn-primary" type="submit">Verify OTP</button>
                            </div>
                        </div>
                    </form>
                    <%
                        } catch (MessagingException mex) {
                            //mex.printStackTrace();
                            out.println(mex);
                            result = "Error: unable to send mail....";
                        }
                    %>
                </div>
            </div>
        </div>
        <!--full footer-->
        <footer class="full-footer">
            <!--top footer-->
            <div class="container">
                <div class="row">
                    <div class="col-md-3 p-2 pl-5">
                        <img class="img-fluid" src="images\logo.png">
                        <p>school management system is for making the work of 
                            schools and colleges easier <a href="#">Read More...</a>
                        </p>
                        <a href="#" style="color: silver" class="p-2"><i class="fab fa-2x fa-facebook-square"></i></a>
                        <a href="#" style="color: silver" class="p-2"><i class="fab fa-2x fa-twitter-square"></i></a>
                        <a href="#" style="color: silver" class="p-2"><i class="fab fa-2x fa-google-plus-square"></i></a>
                        <a href="#" style="color: silver" class="p-2"><i class="fab fa-2x fa-instagram"></i></a>
                    </div>
                    <div class="cols-md-3 p-2 pl-5">
                        <h3>Important Links</h3><br>
                        <a href="#"><h6>Privacy Policy</h6></a>
                        <a href="#"><h6>Social media</h6></a>
                        <a href="#"><h6>About Us</h6></a>
                        <a href="#"><h6>Contact Us</h6></a>
                    </div>
                    <div class="cols-md-3 p-2 pl-5">
                        <h3>Our Services</h3><br>
                        <a href="#"><h6>School Management System</h6></a>
                        <a href="#"><h6>College Management System</h6></a>
                        <a href="#"><h6>Other IT Web Applications</h6></a>
                        <a href="#"><h6>Android Apps</h6></a>
                    </div>
                    <div class="cols-md-3 p-2 pl-5">
                        <h3>Contact Us</h3><br>
                        <a href="tel:7011796901"><i class="fas fa-phone"></i> +(91)7011796901</a><br>
                        <a href="mailto:spriyank113@gmail.com"><i class="fas fa-envelope"></i> spriyank113@gmail.com</a><br>
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7275397.621619401!2d76.38690360187536!3d27.079411268850745!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39994e9f7b4a09d3%3A0xf6a5476d3617249d!2sUttar+Pradesh!5e0!3m2!1sen!2sin!4v1560696223945!5m2!1sen!2sin" frameborder="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
            <!--bottom footer-->
            <div class="container-fluid bottomFooter text-center p-1">
                <p class="p-1">Copyrights 2019&nbsp;&nbsp;<i class="far fa-copyright"></i> - All rights reserved</p>
            </div>
        </footer>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="bootstrap/js/jquery-3.3.1.slim.min.js"></script>
        <script src="bootstrap/js/popper.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
