<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Board.BoardContentBean" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="Board.BoardDao" %>

<html>
<head>
    <title>WritingPro</title>
</head>
<body>
<jsp:useBean id="boardContentBean" class="Board.BoardContentBean"/>
<jsp:setProperty name="boardContentBean" property="*"/>
<% BoardDao boardDao = BoardDao.getInstance(); %>

</body>
</html>
