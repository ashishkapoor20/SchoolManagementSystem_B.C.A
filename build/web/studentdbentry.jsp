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
            String uid = request.getParameter("uid");
            String pwd = request.getParameter("upass");
            String nme = request.getParameter("unm");
            String uml = request.getParameter("umail");
            String ureg = request.getParameter("urg");
            String ucou = request.getParameter("uco");
            String uadd = request.getParameter("uad");
            String t = "student";
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn = DriverManager.getConnection("jdbc:derby://localhost:1527/cllg_project");
                PreparedStatement ps=cn.prepareStatement("select * from login where userid=?");
                ps.setString(1,uid);
                ResultSet rs=ps.executeQuery();
                if(rs.next())
                {
                    %>
                    <div class="card bg-danger text-white">
                        <div class="card-body"><h1>This student already exist please go back and enter new entry</h1></div>
                    </div>
                    <a href="studententry.jsp" style="color: black">click to go to student entry page</a>
                    <%
                }
                else
                {
                    PreparedStatement ps1 = cn.prepareStatement("insert into login values(?,?,?,?,?,?,?,?)");
                    ps1.setString(1, uid);
                    ps1.setString(2, pwd);
                    ps1.setString(3, nme);
                    ps1.setString(4, uml);
                    ps1.setString(5, ureg);
                    ps1.setString(6, t);
                    ps1.setString(7, uadd);
                    ps1.setString(8, ucou);
                    int n=ps1.executeUpdate();
                    if(n>0)
                    {
                        %>
                            <div class="card bg-success text-white">
                                <div class="card-body"><h1>New Student Added Successfully</h1></div>
                            </div>
                            <a href="adminlogin.jsp" style="color: black">click to go to admin home</a>
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
