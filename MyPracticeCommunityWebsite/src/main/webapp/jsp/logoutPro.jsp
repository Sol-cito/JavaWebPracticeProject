<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout Pro</title>
</head>
<body>
<%
    session.invalidate();
    response.sendRedirect("/"); // go to index

%>
</body>
</html>
