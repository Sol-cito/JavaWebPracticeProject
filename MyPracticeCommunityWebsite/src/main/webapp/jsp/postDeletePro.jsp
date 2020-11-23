<%@ page import="Board.BoardDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Post Delete</title>
</head>
<body>
<%
    int post_no = Integer.parseInt(request.getParameter("post_no"));
    BoardDao boardDao = BoardDao.getInstance();
    int deleteResult = boardDao.deletePost(post_no);
%>
<% if (deleteResult == 0) {%>
<script>
    alert("포스트를 삭제하는 데 문제가 있습니다.")
</script>
<%}%>
<%
    response.sendRedirect("freeBoard.jsp");
%>
</body>
</html>
