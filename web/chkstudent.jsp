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
            String id = request.getParameter("uid");
            String sn = request.getParameter("sname");
            session.setAttribute("i", id);
            session.setAttribute("n", sn);
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn = DriverManager.getConnection("jdbc:derby://localhost:1527/cllg_project");
                PreparedStatement ps = cn.prepareStatement("select * from login where userid=? and name=? and type='student'");
                ps.setString(1, id);
                ps.setString(2, sn);
                ResultSet rs=ps.executeQuery();
                if(rs.next())
                {
                    response.sendRedirect("viewfee.jsp");
                }
                else
                {
                    %>
                    <div class="card bg-danger text-white">
                        <div class="card-body"><h1>This is not a valid student userid please enter a valid student userid</h1></div>
                    </div>
                    <a href="feeview.jsp" style="color: black">click to go to view fees page</a>
                    <%
                }
                cn.close();
            } catch (Exception ex) {
                out.println(ex);
            }
        %>
    </body>
</html>
