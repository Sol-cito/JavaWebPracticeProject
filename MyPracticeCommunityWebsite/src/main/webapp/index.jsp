<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>르그넷</title>
    <link href="css/style.css?ver=1" rel="stylesheet" type="text/css"/>
    <%-- ?ver=1 은 쿼리스트링으로, 즉각 반영을 위한 것 --%>
</head>
<body bgcolor="#f5f5dc">
<%@include file="headerAndfooter/header.jsp" %>

<% if (session.getAttribute("nickname") == null) { %>

<div style="margin-left: 15%">
    <form method="post" action="jsp/loginPro.jsp" onsubmit="return idAndPasswordCheck();">
        아이디 : <input id="id" name="id" type="text" style="width: 100px">
        비밀번호 : <input id="password" name="password" type="password" style="width: 100px">
        <input type="submit" value="로그인">
        <script>
            function idAndPasswordCheck() {
                let idValue = document.getElementById("id").value;
                let password = document.getElementById("password").value;
                if (idValue == "") {
                    alert("아이디를 입력하시오");
                    document.getElementById("id").focus();
                    return false;
                }
                if (password == "") {
                    alert("비밀번호를 입력하시오");
                    document.getElementById("password").focus();
                    return false;
                }
                return true;
            }
        </script>
    </form>
</div>
<%} else {%>
<div>
    <h3>닉네임 : <%= session.getAttribute("nickname")%>
    </h3>
</div>
<%}%>
<div>
    <input type="button" value="회원가입" onclick="location.href = 'jsp/register.jsp'">
</div>

</body>
<footer>
    <%@include file="headerAndfooter/footer.jsp" %>
</footer>
</html>