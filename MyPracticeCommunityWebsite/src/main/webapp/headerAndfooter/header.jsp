<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
</head>
<body>
<header id="header">
    <div class="header_mainDiv">
        <div class="header_box_LGnet">
            <p style="font-size: 30px; cursor: pointer" onclick="location.href= '/'">
                르그넷</p>
        </div>
        <div class="header_box">
            <a href="/jsp/freeBoard.jsp">자유게시판</a></li>
        </div>
        <% if (session.getAttribute("nickname") == null) { %>
        <div style="margin-left: 15%">
            <form method="post" action="../jsp/loginPro.jsp" onsubmit="return idAndPasswordCheck();">
                아이디 : <input id="id" name="id" type="text" style="width: 100px">
                비밀번호 : <input id="password" name="password" type="password" style="width: 100px">
                <input class="btn-primary" type="submit" value="로그인">
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
            <%} else {%>
            <h3>닉네임 : <%= session.getAttribute("nickname")%>
            </>
            <input class="btn-primary" type="button" value="로그아웃" onclick="location.href = '../jsp/logoutPro.jsp'">
            <%}%>
            <input class="btn-primary" type="button" value="회원가입" onclick="location.href = '../jsp/register.jsp'">
        </div>
    </div>
</header>
</body>
</html>
