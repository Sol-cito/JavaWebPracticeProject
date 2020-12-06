<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>LG NET</title>
    <link href="css/style.css?ver=1" rel="stylesheet" type="text/css"/>
    <link href="css/bootstrap.css" rel="stylesheet">
    <%-- ?ver=1 은 쿼리스트링으로, 즉각 반영을 위한 것 --%>
</head>
<%@include file="/headerAndfooter/header.jsp" %>
<body class="bg-light">
<div>
    <h1>LG NET</h1>
</div>

<%--<% if (session.getAttribute("nickname") == null) { %>--%>
<%--<div style="margin-left: 15%">--%>
<%--    <form method="post" action="jsp/loginPro.jsp" onsubmit="return idAndPasswordCheck();">--%>
<%--        아이디 : <input id="id" name="id" type="text" style="width: 100px">--%>
<%--        비밀번호 : <input id="password" name="password" type="password" style="width: 100px">--%>
<%--        <input class="btn-primary" type="submit" value="로그인">--%>
<%--        <script>--%>
<%--            function idAndPasswordCheck() {--%>
<%--                let idValue = document.getElementById("id").value;--%>
<%--                let password = document.getElementById("password").value;--%>
<%--                if (idValue == "") {--%>
<%--                    alert("아이디를 입력하시오");--%>
<%--                    document.getElementById("id").focus();--%>
<%--                    return false;--%>
<%--                }--%>
<%--                if (password == "") {--%>
<%--                    alert("비밀번호를 입력하시오");--%>
<%--                    document.getElementById("password").focus();--%>
<%--                    return false;--%>
<%--                }--%>
<%--                return true;--%>
<%--            }--%>
<%--        </script>--%>
<%--    </form>--%>
<%--    <%} else {%>--%>
<%--    <h3>닉네임 : <%= session.getAttribute("nickname")%>--%>
<%--    </>--%>
<%--    <input class="btn-primary" type="button" value="로그아웃" onclick="location.href = '/jsp/logoutPro.jsp'">--%>
<%--    <%}%>--%>
<%--    <input class="btn-primary" type="button" value="회원가입" onclick="location.href = '/jsp/register.jsp'">--%>
<%--</div>--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
<footer>
    <%@include file="/headerAndfooter/footer.jsp" %>
</footer>
</html>