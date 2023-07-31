<%-- 
    Document   : chklogin
    Created on : Jun 29, 2019, 2:44:24 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login-Student Management System</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="fontawesome-free-5.9.0-web/css/all.css">
        <link rel="stylesheet" href="css/style.css">
        <%@page import="java.sql.*" %>
    </head>
    <body>
        <%
            String id = request.getParameter("uid");
            String pass = request.getParameter("upass");
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn2 = DriverManager.getConnection("jdbc:derby://localhost:1527/cllg_project");
                PreparedStatement ps2 = cn2.prepareStatement("select * from login where userid=? and password=?");
                ps2.setString(1, id);
                ps2.setString(2, pass);
                ResultSet rs = ps2.executeQuery();
                if (rs.next()) 
                {
                    session.setAttribute("user_id", id);
                    String type = rs.getString("type");
                    if(type.equals("admin"))
                    {
                        response.sendRedirect("adminlogin.jsp");
                    }
                    else if(type.equals("teacher"))
                    {
                        response.sendRedirect("teacherlogin.jsp");
                    }
                    else if(type.equals("student"))
                    {
                        response.sendRedirect("studentlogin.jsp");
                    }
                }
                else 
                {
                    response.sendRedirect("login.html");
                }
            } catch (Exception ex) {
                out.println(ex);
            }
        %>
    </body>
</html>
