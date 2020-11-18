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
</head>
<body bgcolor="#f5f5dc">
<%@include file="/headerAndfooter/header.jsp" %>
<table>
    <tr>
        <th>No</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>날짜</th>
        <th>조회수</th>
    </tr>
    <%
        BoardDao boardDao = BoardDao.getInstance();
        ArrayList<BoardInfoBox> arrayList = boardDao.readBoard();
        PrintWriter printWriter = response.getWriter();
        for (int i = 0; i < arrayList.size(); i++) {
            BoardInfoBox boardInfoBox = arrayList.get(i);
            printWriter.println("<tr>");
            printWriter.println("<td>" + boardInfoBox.getSeq() + "</td>");
            printWriter.println("<td>" + boardInfoBox.getTitle() + "</td>");
            printWriter.println("<td>" + boardInfoBox.getAuthor() + "</td>");
            printWriter.println("<td>" + boardInfoBox.getDate() + "</td>");
            printWriter.println("</tr>");
        }
    %>
    <tr>
        <td>1</td>
        <td>테스트 글제목~~~</td>
        <td>글쓴이임</td>
        <td>2020-10-10</td>
        <td>13</td>
    </tr>
</table>

<input type="button" value="글쓰기" onclick="location.href = 'writing.jsp'">
</body>
<footer>
    <%@include file="/headerAndfooter/footer.jsp" %>
</footer>
</html>
