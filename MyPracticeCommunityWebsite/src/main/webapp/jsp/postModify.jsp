<%@ page import="Board.BoardDao" %>
<%@ page import="Board.BoardInfoBox" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Post Modify</title>
    <link href="../css/style.css?ver=1" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<%@include file="/headerAndfooter/header.jsp" %>
<%
    int post_no = Integer.parseInt(request.getParameter("post_no"));
    BoardDao boardDao = BoardDao.getInstance();
    BoardInfoBox boardInfoBox = boardDao.showPost(post_no, 2);
%>
<div class="container">
    <form action="postModificationPro.jsp?post_no=<%=post_no%>" method="post">
        <input class="form-control mt-4 mb-2" value="<%=boardInfoBox.getTitle()%>" name="title" type="text" required>
        <textarea class="form-control" name="content" rows="10" required>
<%= boardInfoBox.getText()%></textarea>
        <div style="float: right; padding-right : 15px; margin-right: auto; margin-top: 10px">
            <button class="btn-primary" type="submit">수정완료</button>
        </div>
    </form>
</div>

<script>
    window.onbeforeunload = function () {
        return ""
    }
</script>

</body>
<footer>
    <%@include file="/headerAndfooter/footer.jsp" %>
</footer>
</html>
