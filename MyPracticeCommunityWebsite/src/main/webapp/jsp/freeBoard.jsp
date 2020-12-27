<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Board.BoardDao" %>
<%@ page import="Board.BoardInfoBox" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>자유게시판</title>
    <link href="../css/style.css?ver=1" rel="stylesheet" type="text/css"/>
    <link href="/css/bootstrap.css" rel="stylesheet">
</head>
<body bgcolor="#f5f5dc">
<%@include file="/headerAndfooter/header.jsp" %>
<div class="container">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>No</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>날짜</th>
            <th>조회수</th>
        </tr>
        </thead>
        <%
            String getPage_no = request.getParameter("page_no");
            int page_no = 0;
            if (getPage_no != null) {
                page_no = Integer.parseInt(getPage_no);
            }
            BoardDao boardDao = BoardDao.getInstance();
            int theNumberOfPosts = boardDao.getTheNumberOfPosts();
            ArrayList<BoardInfoBox> arrayList = boardDao.readBoard(page_no);
            for (int i = 0; i < arrayList.size(); i++) {
                BoardInfoBox boardInfoBox = arrayList.get(i);
                int post_no = boardInfoBox.getSeq();
        %>
        <tr>
            <td><%= post_no%>
            <td><a href="post.jsp?post_no=<%=post_no%>"><%= boardInfoBox.getTitle()%>
            </a>
                <span><b>[<%=boardDao.getCommentNumOfPost(post_no)%>]</b></span>
            <td><%= boardInfoBox.getAuthor()%>
            <td><%= boardInfoBox.getDate()%>
            <td><%= boardInfoBox.getViews()%>
        </tr>
        <%}%>
        </a>
    </table>
</div>
<div>
    <ul class="pagination justify-content-center">
        <% for (int i = 0; i <= (theNumberOfPosts - 1) / 10; i++) {%>
        <li class="page-item"><a class="page-link" href="?page_no=<%=i%>">
            <%=(i + 1)%>
        </a></li>
        <%}%>
    </ul>
    <div class="container">
        <div class="row justify-content-center">
            <form action="searchResult.jsp">
                <input name="searchKeyword" required>
                <button class="btn-primary" type="submit">검색</button>
            </form>
        </div>
        <div class="row justify-content-end">
            <input class="btn-primary" type="button" value="글쓰기" onclick="location.href = 'postWriting.jsp'">
        </div>
    </div>
</div>
</div>
</body>
<footer>
    <%@include file="/headerAndfooter/footer.jsp" %>
</footer>
</html>
