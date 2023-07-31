<%-- 
    Document   : adminlogin.jsp
    Created on : Jun 29, 2019, 3:00:08 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student home-Student Management System</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="fontawesome-free-5.9.0-web/css/all.css">
        <link rel="stylesheet" href="css/style.css">
        <%@page import="java.sql.*" %>
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
                                    <a href="studentlogin.jsp" class="navbar-link">Home</a> &nbsp;  &nbsp;  &nbsp; 
                                </li>

                                <li class="navbar-item">
                                    <a href="sattenreport.jsp" class="navbar-link">Attendance Report</a> &nbsp;  &nbsp;  &nbsp; 
                                </li>

                                <li class="navbar-item">
                                    <a href="sfeereport.jsp" class="navbar-link">Fees Report</a> &nbsp;  &nbsp;  &nbsp; 
                                </li>
                                <li class="navbar-item">
                                    <a href="smarkreport.jsp" class="navbar-link">Marks Report</a> &nbsp;  &nbsp;  &nbsp; 
                                </li>
                                <%
                                    String id = (String) session.getAttribute("user_id");
                                    try {
                                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                                        Connection cn4 = DriverManager.getConnection("jdbc:derby://localhost:1527/cllg_project");
                                        PreparedStatement ps4 = cn4.prepareStatement("select * from login where userid=?");
                                        ps4.setString(1, id);
                                        ResultSet rs = ps4.executeQuery();
                                        if (rs.next()) {
                                            out.print("<li class='navbar-item dropdown'>");
                                            out.print("<a href='#' class='navbar-link dropdown-toggle' data-toggle='dropdown' role='button'>" + "Welcome " + rs.getString("name") + "</a> &nbsp;  &nbsp;  &nbsp;");
                                            out.print("<div class='dropdown-menu'>");
                                            out.print("<a href='studentprofileedit.jsp' class='dropdown-item'>View/Edit My Profile</a>");
                                            out.print("<a href='studentchangepass.jsp' class='dropdown-item'>Change Password</a>");
                                            out.print("<a href='logout.jsp' class='dropdown-item'>Logout</a>");
                                            out.print("</div>");
                                            out.print("</li>");
                                        }
                                        session.setAttribute("pa", rs.getString("password"));
                                        session.setAttribute("nm", rs.getString("name"));
                                        session.setAttribute("mail", rs.getString("email"));
                                        session.setAttribute("reg", rs.getString("reg_date"));
                                        session.setAttribute("ut", rs.getString("type"));
                                        cn4.close();
                                    } catch (Exception ex) {
                                        out.println(ex);
                                    }
                                %>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </header>  
        <%
            String pass = (String) session.getAttribute("pa");
            String name = (String) session.getAttribute("nm");
            String ml = (String) session.getAttribute("mail");
            String rd = (String) session.getAttribute("reg");
            String tp = (String) session.getAttribute("ut");
        %>
        <br>
        <br>
        <div class="container text-center">
            <div class="row">
                <div class="col-md-6">
                    <div class="card-group" style="width:400px">
                        <img class="card-img-top" src="images/img_avatar1.jpg" alt="Card image" style="width:100%;height: 300px">
                        <div class="card-body">
                            <h4 class="card-title"><%=name%></h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <table class="table table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th>Name</th>
                                <th><%=name%></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>UserID</td>
                                <td><%=id%></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><%=ml%></td>
                            </tr>
                            <tr>
                                <td>Registration Date</td>
                                <td><%=rd%></td>
                            </tr>
                            <tr>
                                <td>User Type</td>
                                <td><%=tp%></td>
                            </tr>
                            <tr>
                                <td>password</td>
                                <td><%=pass%></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <br>
        <br>
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
