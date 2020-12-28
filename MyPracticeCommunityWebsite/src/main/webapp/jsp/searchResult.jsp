<%@ page import="Board.BoardDao" %>
<%@ page import="Board.BoardInfoBox" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색결과</title>
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="../css/style.css?ver=1" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@include file="/headerAndfooter/header.jsp" %>
<div class="container">
    <table class="table">
        <thead class="thead-light">
        <tr>
            <th>No</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>날짜</th>
            <th>조회수</th>
        </tr>
        </thead>
        <%
            String searchKeyword = request.getParameter("searchKeyword");
            BoardDao boardDao = BoardDao.getInstance();
            ArrayList<BoardInfoBox> boardInfoBoxArrayList = boardDao.searchBoard(searchKeyword);
            for (int i = 0; i < boardInfoBoxArrayList.size(); i++) {
                BoardInfoBox boardInfoBox = boardInfoBoxArrayList.get(i);
        %>
        <tbody>
        <tr>
            <td><%=boardInfoBox.getSeq()%>
            </td>
            <td>
                <a href="post.jsp?post_no=<%=boardInfoBox.getSeq()%>"><%=boardInfoBox.getTitle()%>
            </td>
            <td><%=boardInfoBox.getDate()%>
            </td>
            <td><%=boardInfoBox.getAuthor()%>
            </td>
            <td><%=boardInfoBox.getViews()%>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <%=boardInfoBox.getText()%>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>
</body>
<footer>
    <%@include file="/headerAndfooter/footer.jsp" %>
</footer>
</html>
