<%-- 
    Document   : changed
    Created on : Jul 3, 2019, 8:54:32 PM
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
            String usid = (String) session.getAttribute("user_id");
            String nep = (String) session.getAttribute("new");
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn = DriverManager.getConnection("jdbc:derby://localhost:1527/cllg_project");
                PreparedStatement ps = cn.prepareStatement("update login set password=? where userid=?");
                ps.setString(1, nep);
                ps.setString(2, usid);
                int n=ps.executeUpdate();
                if(n>0)
                {
                    %>
                    <div class="card bg-success text-white">
                        <div class="card-body"><h1>Password changed successfully</h1></div>
                    </div>
                    <%
                    String t=(String)session.getAttribute("ut");
                    if(t.equals("admin"))
                    {
                    %>
                        <a href="adminlogin.jsp" style="color: black">click to go to admin home</a>
                    <%
                    }
                    else if(t.equals("teacher"))
                    {
                    %>
                        <a href="teacherlogin.jsp" style="color: black">click to go to teacher home</a>
                    <%
                    }
                    else if(t.equals("student"))
                    {
                    %>
                        <a href="studentlogin.jsp" style="color: black">click to go to student home</a>
                    <%
                    }
                }
                cn.close();
            } catch (Exception ex) {
                out.println(ex);
            }
        %>
    </body>
</html>
