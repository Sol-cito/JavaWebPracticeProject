<%@ page import="java.io.PrintWriter" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Writing Post</title>
    <link href="../css/style.css?ver=1" rel="stylesheet" type="text/css"/>
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
<form action="writingPro.jsp">
    <p class="freeBoard_p_tag">제목 :<input name="title" type="text"><br></p>
    <p class="freeBoard_p_tag">내용 : <input name="content" type="text" style="width: 80%; height: 50%"><br></p>
    <input type="submit" value="글쓰기">
</form>
</body>
<footer>
    <%@include file="/headerAndfooter/footer.jsp" %>
</footer>
</html>
<%}%>