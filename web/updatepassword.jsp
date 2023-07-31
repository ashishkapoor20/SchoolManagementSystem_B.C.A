<%-- 
    Document   : updatepassword
    Created on : Jul 3, 2019, 8:03:34 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="fontawesome-free-5.9.0-web/css/all.css">
        <link rel="stylesheet" href="css/style.css">
        <%@page import="java.sql.*" %>
    </head>
    <body>
        <%
            String newpass = request.getParameter("npass");
            String email = (String) session.getAttribute("em");
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn = DriverManager.getConnection("jdbc:derby://localhost:1527/cllg_project");
                PreparedStatement ps = cn.prepareStatement("update login set password=? where email=?");
                ps.setString(1,newpass);
                ps.setString(2,email);
                int n=ps.executeUpdate();
                if(n>0)
                {
                    %>
                    <div class="card bg-success text-white">
                        <div class="card-body"><h1>New password has been updated</h1></div>
                    </div>
                    <a href="index.html" style="color: black">click to go to home page</a>
                    <%
                    session.invalidate();
                }
                cn.close();
            } catch (Exception ex) {
                out.println(ex);
            }
        %>
    </body>
</html>
