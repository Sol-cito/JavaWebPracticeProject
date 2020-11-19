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
<table class="table">
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
        BoardDao boardDao = BoardDao.getInstance();
        ArrayList<BoardInfoBox> arrayList = boardDao.readBoard();
        for (int i = 0; i < arrayList.size(); i++) {
            BoardInfoBox boardInfoBox = arrayList.get(i); %>
    <tr>
        <td><%= boardInfoBox.getSeq()%>
        <td><%= boardInfoBox.getTitle()%>
        <td><%= boardInfoBox.getAuthor()%>
        <td><%= boardInfoBox.getDate()%>
        <td><%= "아직 안함"%>
    </tr>
    <%}%>
</table>

<input type="button" value="글쓰기" onclick="location.href = 'writing.jsp'">
</body>
<footer>
    <%@include file="/headerAndfooter/footer.jsp" %>
</footer>
</html>
