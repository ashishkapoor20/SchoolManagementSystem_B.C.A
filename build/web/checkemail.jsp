<%-- 
    Document   : checkemail
    Created on : Jul 2, 2019, 12:56:55 PM
    Author     : abc
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
        <%@page  import="java.sql.*" %>
    </head>
    <body>
        <%
            String email, psw;
            email = request.getParameter("eid");
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn = DriverManager.getConnection("jdbc:derby://localhost:1527/cllg_project");
                PreparedStatement st = cn.prepareStatement("select *  from login where email=? ");
                st.setString(1, (email));
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    //psw = rs.getString("password");
                    //session.setAttribute("op",psw);
                    session.setAttribute("em", email);

        %>
        <jsp:forward page="sendmail.jsp"/>
        <%        } else {
        %>
        <div class="card bg-danger text-white">
            <div class="card-body"><h1>This email does not exist please enter a valid email address</h1></div>
        </div>
        <a href="forgotpass.html" style="color: black">click to go to forgot password page</a>
        <%
                }
            } catch (Exception ex) {
                out.print(ex);
            }
        %>
    </body>
</html>
