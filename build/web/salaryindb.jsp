<%-- 
    Document   : feeindb
    Created on : Jul 10, 2019, 10:31:10 PM
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
            String id=request.getParameter("uid");
            String un=request.getParameter("unm");
            int m=Integer.parseInt(request.getParameter("mo"));
            int p=Integer.parseInt(request.getParameter("pe"));
            int a=Integer.parseInt(request.getParameter("am"));
            String d=request.getParameter("da");
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection cn=DriverManager.getConnection("jdbc:derby://localhost:1527/cllg_project");
            PreparedStatement ps=cn.prepareStatement("select * from login where userid=? and name=? and type='teacher'");
            ps.setString(1,id);
            ps.setString(2,un);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                PreparedStatement ps1=cn.prepareStatement("insert into salary values(?,?,?,?,?,?)");
                ps1.setString(1,id);
                ps1.setString(2,un);
                ps1.setInt(3,m);
                ps1.setInt(4,p);
                ps1.setInt(5,a);
                ps1.setString(6,d);
                int n=ps1.executeUpdate();
                if(n>0)
                {
                    %>
                    <div class="card bg-success text-white">
                        <div class="card-body"><h1>Teacher Salary has been added successfully</h1></div>
                    </div>
                    <a href="adminlogin.jsp" style="color: black">click to go to admin home</a>
                    <%
                }
            }
            else
            {
                %>
                    <div class="card bg-danger text-white">
                        <div class="card-body"><h1>Teacher does not exist</h1></div>
                    </div>
                    <a href="addsalary.jsp" style="color: black">click to go to add salary page</a>
                <%
            }
        %>
    </body>
</html>
