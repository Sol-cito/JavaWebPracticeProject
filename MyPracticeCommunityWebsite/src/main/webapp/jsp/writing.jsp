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
    printWriter.println("location.href = '/'");
    printWriter.println("</script>");
    printWriter.flush();
} else {%>
<div class="container">
    <form action="writingPro.jsp">
        <input class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요" name="title" type="text" required>
        <textarea class="form-control" name="content" rows="10" placeholder="내용을 입력해주세요" required></textarea>
        <div style="float: right; padding-right : 15px; margin-right: auto; margin-top: 10px">
            <input class="btn-primary" type="submit" value="작성완료">
        </div>
    </form>
</div>
</body>
<footer>
    <%@include file="/headerAndfooter/footer.jsp" %>
</footer>
</html>
<%}%>