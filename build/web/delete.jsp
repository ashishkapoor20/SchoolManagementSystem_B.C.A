<%-- 
    Document   : techerdbentry
    Created on : Jul 7, 2019, 1:39:05 PM
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
            String ud = request.getParameter("uid");
            String ut = request.getParameter("utp");
            if(ut.equals("admin"))
            {
                %>
                    <div class="card bg-danger text-white">
                        <div class="card-body"><h1>This is an admin userid please enter valid userid </h1></div>
                    </div>
                    <a href="deleteentry.jsp" style="color: black">click to go to delete entry page</a>
                <%
            }
            else if(ut.equals("teacher"))
            {
                try
                {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection cn = DriverManager.getConnection("jdbc:derby://localhost:1527/cllg_project");
                    PreparedStatement ps=cn.prepareStatement("select * from login where userid=? and type='teacher'");
                    ps.setString(1,ud);
                    ResultSet rs=ps.executeQuery();
                    if(rs.next())
                    {
                        PreparedStatement ps1 = cn.prepareStatement("delete from login where userid=?");
                        ps1.setString(1, ud);
                        int n=ps1.executeUpdate();
                        if(n>0)
                        {
                            %>
                                <div class="card bg-success text-white">
                                    <div class="card-body"><h1>This entry has been successfully deleted</h1></div>
                                </div>
                                <a href="adminlogin.jsp" style="color: black">click to go to admin home</a>
                            <%
                        }
                    }
                    else
                    {
                        %>
                            <div class="card bg-danger text-white">
                                <div class="card-body"><h1>The entry you want to delete does not exist please enter valid userid</h1></div>
                            </div>
                            <a href="deleteentry.jsp" style="color: black">click to go to delete page</a>
                        <%
                    }
                    cn.close();
                } 
                catch (Exception ex) 
                {
                    out.println(ex);
                }
            }
            else if(ut.equals("student"))
            {
                try
                {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection cn = DriverManager.getConnection("jdbc:derby://localhost:1527/cllg_project");
                    PreparedStatement ps=cn.prepareStatement("select * from login where userid=? and type='student'");
                    ps.setString(1,ud);
                    ResultSet rs=ps.executeQuery();
                    if(rs.next())
                    {
                        PreparedStatement ps1 = cn.prepareStatement("delete from login where userid=?");
                        ps1.setString(1, ud);
                        int n=ps1.executeUpdate();
                        if(n>0)
                        {
                            %>
                                <div class="card bg-success text-white">
                                    <div class="card-body"><h1>This entry has been successfully deleted</h1></div>
                                </div>
                                <a href="adminlogin.jsp" style="color: black">click to go to admin home</a>
                            <%
                        }
                    }
                    else
                    {
                        %>
                            <div class="card bg-danger text-white">
                                <div class="card-body"><h1>The entry you want to delete does not exist please enter valid userid</h1></div>
                            </div>
                            <a href="deleteentry.jsp" style="color: black">click to go to delete page</a>
                        <%
                    }
                    cn.close();
                } 
                catch (Exception ex) 
                {
                    out.println(ex);
                }
            }
        %>
    </body>
</html>
