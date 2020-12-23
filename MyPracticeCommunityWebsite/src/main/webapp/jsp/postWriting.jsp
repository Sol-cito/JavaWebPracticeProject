<%@ page import="java.io.PrintWriter" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Writing Post</title>
    <link href="../css/style.css?ver=1" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrap.css" rel="stylesheet"/>
</head>
<body bgcolor="#f5f5dc">
<%@include file="/headerAndfooter/header.jsp" %>
<% if (session.getAttribute("nickname") == null) {
    PrintWriter printWriter = response.getWriter();
    printWriter.println("<script>");
    printWriter.println("alert('글을 쓰려면 로그인을 해야합니다.');");
    printWriter.println("location.href = 'freeBoard.jsp'");
    printWriter.println("</script>");
    printWriter.flush();
} else {%>
<div class="container">
    <form id="writingForm" action="postWritingPro.jsp">
        <input class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요" name="title" type="text" required>
        <textarea class="form-control" name="content" rows="10" placeholder="내용을 입력해주세요" required></textarea>
        <div style="float: right; padding-right : 15px; margin-right: auto; margin-top: 10px">
            <input class="btn-primary" type="submit" value="작성완료">
        </div>
    </form>
</div>

<%-- 아래 스크립트는 refresh 될 때 발생하므로, 작성완료를 눌렀을 떄도 동작함....--%>
<%--<script>--%>
<%--    window.onbeforeunload = function () {--%>
<%--        return ""--%>
<%--    }--%>
<%--</script>--%>

</body>
<footer>
    <%@include file="/headerAndfooter/footer.jsp" %>
</footer>
</html>
<%}%>