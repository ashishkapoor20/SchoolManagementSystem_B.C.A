<%-- 
    Document   : viewfee
    Created on : Jul 13, 2019, 1:54:33 PM
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
            String u,n,e,a;
            u=request.getParameter("uid");
            n=request.getParameter("unm");
            e=request.getParameter("em");
            a=request.getParameter("ad");
            String type = (String) session.getAttribute("ut");
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn = DriverManager.getConnection("jdbc:derby://localhost:1527/cllg_project");
                PreparedStatement ps = cn.prepareStatement("update login set userid=?,name=?,email=?,address=? where userid=?");
                ps.setString(1,u);
                ps.setString(2,n);
                ps.setString(3,e);
                ps.setString(4,a);
                ps.setString(5,u);
                int ch=ps.executeUpdate();
                if(ch>0)
                {
                    %>
                    <div class="card bg-success text-white">
                        <div class="card-body"><h1>Your data has been successfully updated</h1></div>
                    </div>
                    <%
                    if(type.equals("admin"))
                    {
                    %>
                        <a href="adminlogin.jsp" style="color: black">click to go to admin home page</a>
                    <%
                    }
                    else if(type.equals("teacher"))
                    {
                    %>
                        <a href="teacherlogin.jsp" style="color: black">click to go to teacher home</a>
                    <%
                    }
                    else if(type.equals("student"))
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
