<%-- 
    Document   : checkpass
    Created on : Jul 3, 2019, 9:00:02 PM
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
            String id = request.getParameter("uid");
            String currentp = request.getParameter("cpass");
            String newp = request.getParameter("npass");
            session.setAttribute("new", newp);
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn = DriverManager.getConnection("jdbc:derby://localhost:1527/cllg_project");
                PreparedStatement ps = cn.prepareStatement("select * from login where userid=? and password=?");
                ps.setString(1, id);
                ps.setString(2, currentp);
                ResultSet rs = ps.executeQuery();
                if (rs.next())
                {
                    %>
                    <jsp:forward page="changed.jsp"/>
                    <%
                }
                else
                {
                    %>
                    <div class="card bg-danger text-white">
                        <div class="card-body"><h1>userid and current password does not match</h1></div>
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
            } catch (Exception ex) {
                out.println(ex);
            }
        %>
    </body>
</html>
