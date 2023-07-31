<%-- 
    Document   : chkstudmark
    Created on : Jul 17, 2019, 9:42:00 PM
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
            String u,n,cc,c;
            int m,s,p;
            u=request.getParameter("uid");
            n=request.getParameter("unm");
            cc=request.getParameter("ci");
            c=request.getParameter("co");
            m=Integer.parseInt(request.getParameter("ma"));
            s=Integer.parseInt(request.getParameter("se"));
            p=Integer.parseInt(request.getParameter("pe"));
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn4 = DriverManager.getConnection("jdbc:derby://localhost:1527/cllg_project");
                PreparedStatement ps4 = cn4.prepareStatement("select * from login where userid=? and name=? and type='student' and course=?");
                ps4.setString(1, u);
                ps4.setString(2, n);
                ps4.setString(3, c);
                ResultSet rs = ps4.executeQuery();
                if (rs.next())
                {
                    PreparedStatement ps = cn4.prepareStatement("select * from course where courseid=? and course=?");
                    ps.setString(1,cc);
                    ps.setString(2,c);
                    ResultSet rs1=ps.executeQuery();
                    if(rs1.next())
                    {
                        PreparedStatement ps1 = cn4.prepareStatement("insert into marks values(?,?,?,?,?,?,?)");
                        ps1.setString(1,u);
                        ps1.setString(2,n);
                        ps1.setString(3,cc);
                        ps1.setString(4,c);
                        ps1.setInt(5,m);
                        ps1.setInt(6,s);
                        ps1.setInt(7,p);
                        int num=ps1.executeUpdate();
                        if(num>0)
                        {
                            %>
                            <div class="card bg-success text-white">
                                <div class="card-body"><h1>student marks has been added successfully</h1></div>
                            </div>
                            <a href="teacherlogin.jsp" style="color: black">click to go back to teacher home</a>
                            <%
                        }
                    }
                    else
                    {
                        %>
                        <div class="card bg-danger text-white">
                            <div class="card-body"><h1>invalid courseid and name please enter a valid courseid</h1></div>
                        </div>
                        <a href="addmarks.jsp" style="color: black">click to go back to add marks page</a>
                        <%
                    }
                }
                else
                {
                    %>
                    <div class="card bg-danger text-white">
                        <div class="card-body"><h1>invalid userid and name please enter a valid student userid</h1></div>
                    </div>
                    <a href="addmarks.jsp" style="color: black">click to go back to add marks page</a>
                    <%
                }
                cn4.close();
            } catch (Exception ex) {
                out.println(ex);
            }
        %>
    </body>
</html>
