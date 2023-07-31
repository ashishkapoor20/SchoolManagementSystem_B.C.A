<%-- 
    Document   : logout
    Created on : Jun 30, 2019, 11:47:41 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout jsp</title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("index.html");
        %>
    </body>
</html>
