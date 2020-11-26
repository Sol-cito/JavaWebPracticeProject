<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Board.BoardContentBean" %>
<%@ page import="Board.BoardDao" %>
<html>
<head>
    <title>Post Modification Pro</title>
</head>
<body>
<jsp:useBean id="boardContentBean" class="Board.BoardContentBean"/>
<jsp:setProperty name="boardContentBean" property="*"/>
<%
    BoardDao boardDao = BoardDao.getInstance();
    int post_no = Integer.parseInt(request.getParameter("post_no"));
    int updateResult = boardDao.modify(boardContentBean, post_no);
%>
<% if (updateResult == 0) {%>
<script>
    alert("포스트를 수정하는 데 문제가 있습니다.")
</script>
<%}%>
<%
    response.sendRedirect("post.jsp?post_no=" + post_no);
%>
</body>
</html>
