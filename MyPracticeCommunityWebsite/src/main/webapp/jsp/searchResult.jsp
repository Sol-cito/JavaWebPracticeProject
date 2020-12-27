<%@ page import="Board.BoardDao" %>
<%@ page import="Board.BoardInfoBox" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색결과</title>
    <link href="../css/style.css?ver=1" rel="stylesheet" type="text/css"/>
    <link href="/css/bootstrap.css" rel="stylesheet">
</head>
<body>
<%@include file="/headerAndfooter/header.jsp" %>
<div class="container">
    <ul>
        <li>
            <div>No</div>
            <div>제목</div>
            <div>날짜</div>
            <div>글쓴이</div>
            <div>조회수</div>
        </li>
        <%
            String searchKeyword = request.getParameter("searchKeyword");
            BoardDao boardDao = BoardDao.getInstance();
            ArrayList<BoardInfoBox> boardInfoBoxArrayList = boardDao.searchBoard(searchKeyword);
            for (int i = 0; i < boardInfoBoxArrayList.size(); i++) {
                BoardInfoBox boardInfoBox = boardInfoBoxArrayList.get(i);
        %>
        <li>
            <div>
                <div><%=boardInfoBox.getSeq()%>
                </div>
                <div><%=boardInfoBox.getTitle()%>
                </div>
                <div><%=boardInfoBox.getDate()%>
                </div>
                <div><%=boardInfoBox.getAuthor()%>
                </div>
                <div><%=boardInfoBox.getViews()%>
                </div>
            </div>
            <div>
                <a><%=boardInfoBox.getText()%>
                </a>
            </div>
        </li>
        <%}%>
    </ul>
</div>
</body>
<footer>
    <%@include file="/headerAndfooter/footer.jsp" %>
</footer>
</html>
