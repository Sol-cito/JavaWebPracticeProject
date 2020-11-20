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
<% BoardDao boardDao = BoardDao.getInstance();
    int writingResult = boardDao.write(boardContentBean, (String) session.getAttribute("nickname"));
    if (writingResult == 0) {
        response.sendRedirect("freeBoard.jsp");
    } else {
        PrintWriter printWriter = response.getWriter();
        printWriter.println("<script>");
        printWriter.println("alert('글쓰는데 문제가 생겼음');");
        printWriter.println("location.href = 'freeBoard.jsp'");
        printWriter.println("</script>");
        printWriter.flush();
    }
%>
</body>
</html>
