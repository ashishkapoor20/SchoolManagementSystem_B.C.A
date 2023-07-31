<%-- 
    Document   : chkcourse
    Created on : Jul 13, 2019, 12:33:47 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String c=request.getParameter("course");
            if(c.equals("bca"))
            {
                %>
                <jsp:forward page="bcareport.jsp"/>
                <%
            }
            else if(c.equals("bba"))
            {
                %>
                <jsp:forward page="bbareport.jsp"/>
                <%
            }
            else if(c.equals("bcom"))
            {
                %>
                <jsp:forward page="bcomreport.jsp"/>
                <%
            }
        %>
    </body>
</html>
