<%@ page import="Board.BoardDao" %>
<%@ page import="Board.BoardInfoBox" %>
<%@ page import="java.io.PrintWriter" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Post</title>
    <link href="../css/style.css?ver=1" rel="stylesheet" type="text/css"/>
    <link href="/css/bootstrap.css" rel="stylesheet">
</head>
<body bgcolor="#f5f5dc">
<%@include file="/headerAndfooter/header.jsp" %>
<body>
<%
    int post_no = Integer.parseInt(request.getParameter("post_no"));
    BoardDao boardDao = BoardDao.getInstance();
    int viewUpdateResult = boardDao.addView(post_no);
%>
<% if (viewUpdateResult == 0) { %>
<script>
    alert("조회수 업데이트 실패");
</script>
<%}%>
<%
    BoardInfoBox boardInfoBox = boardDao.showPost(post_no);
%>
<div class="container">
    <div>
        <h3><%= boardInfoBox.getTitle()%>
        </h3>
    </div>
    <br>
    <div>
        글쓴이 : <%= boardInfoBox.getAuthor()%>
    </div>
    <div>
        <span> 작성일 : <%= boardInfoBox.getDate()%></span>
        <span> 조회수 : <%= boardInfoBox.getViews()%></span>
    </div>
    <br>
    <div>
        <%= boardInfoBox.getText()%>
    </div>
</div>
<div class="container mt-5">
    <% if (session.getAttribute("nickname") != null && session.getAttribute("nickname").equals(boardInfoBox.getAuthor())) {%>
    <input class="btn-primary mr-5" type="button" value="수정">
    <a class="btn" href="postDeletePro.jsp?post_no=<%=boardInfoBox.getSeq()%>"
       onclick="return askDelete()">삭제</a>
    <script>
        function askDelete() {
            return confirm("정말 삭제하시겠습니까?")
        }
    </script>
    <%}%>
    <button class="btn-primary mr-5" onclick="location.href = 'freeBoard.jsp'">목록으로</button>
</div>
</body>
<footer>
    <%@include file="/headerAndfooter/footer.jsp" %>
</footer>
</html>
