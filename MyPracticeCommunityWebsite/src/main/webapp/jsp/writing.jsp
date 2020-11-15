<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Writing Post</title>
    <link href="../css/style.css?ver=1" rel="stylesheet" type="text/css"/>
</head>
<body bgcolor="#f5f5dc">
<%@include file="/headerAndfooter/header.jsp" %>
<form action="writingPro.jsp">
    <p class="freeBoard_p_tag">제목 :<input name="title" type="text"><br></p>
    <p class="freeBoard_p_tag"> 글쓴이 :<input name="author" type="text"><br></p>
    <p class="freeBoard_p_tag">내용 : <input name="content" type="text" style="width: 80%; height: 50%"><br></p>
    <input type="submit" value="글쓰기">
</form>
</body>
<footer>
    <%@include file="/headerAndfooter/footer.jsp" %>
</footer>
</html>
