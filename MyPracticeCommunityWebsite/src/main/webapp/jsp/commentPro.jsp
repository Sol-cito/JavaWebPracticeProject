<%@ page import="Board.BoardDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>댓글 달기</title>
</head>
<body>
<jsp:useBean id="commentBean" class="Board.CommentContentBean"/>
<jsp:setProperty name="commentBean" property="*"/>

<%
    int post_no = Integer.parseInt(request.getParameter("post_no"));
    BoardDao boardDao = BoardDao.getInstance();
    commentBean.setAuthor((String) session.getAttribute("nickname"));
    commentBean.setRel_Seq(post_no);
    int insertResult = boardDao.makeComment(commentBean);
%>
<% if (insertResult == 0) {%>
<script>
    alert("댓글을 쓰는데 문제가 있음.")
</script>
<%
        response.sendRedirect("post.jsp?post_no=" + post_no);
    }
%>
</body>
</html>
