<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link href="../css/style.css?ver=1" rel="stylesheet" type="text/css"/>
    <%-- ?ver=1 은 쿼리스트링으로, 즉각 반영을 위한 것 --%>
</head>
<body bgcolor="#f5f5dc">
<%@include file="../headerAndfooter/header.jsp" %>
<section class="mainSection">
    <h2>회원가입</h2>
    <section class="register">
        <h3>르그넷 회원 정보</h3>
        <form id="registerForm" method="post" action="testJSP.jsp"> <%-- action 에 link 페이지 걸어야 함--%>
            <div class="register-attributes">
                <div class="form-group">
                    <label for="id">아이디 : </label>
                    <input id="id" name="id" type="text" style="width: 250px">
                    <p>10자 이하의 알파벳, 숫자만 가능함</p>
                </div>
                <div class="form-group">
                    <label for="password">비밀번호 : </label>
                    <input id="password" name="password" type="password" style="width: 250px">
                </div>
                <div class="form-group">
                    <label for="password_check">비밀번호 확인 : </label>
                    <input id="password_check" type="password" style="width: 250px">
                    <p>확인을 위해 이전과 동일한 비밀번호를 입력하세요.</p>
                </div>
                <div class="form-group">
                    <label for="email">이메일 : </label>
                    <input id="email" type="text" style="width: 250px">
                    <p>비밀번호 분실시 찾을 수 있는 유일한 수단입니다. 정확히 입력해주세요.</p>
                </div>
                <div class="form-group">
                    <label for="nickname">닉네임 : </label>
                    <input id="nickname" name="nickname" type="text" style="width: 250px">
                    <p>닉네임은 글 작성시 노출됩니다. 개인정보가 노출되지 않도록 주의하시기 바랍니다.<br>
                        닉네임을 한 번 변경하신 후에는 7일 이내에 다시 닉네임을 변경하실 수 없습니다.</p>
                </div>
            </div>
            <input name="registerButton" type="button" value="회원가입하기" onclick="verifyInfo()"/>
            <script>
                function verifyInfo() {
                    let id = document.getElementById("id").value;
                    if (id.length == 0) {
                        alert("아이디 다시 확인해");
                        document.getElementById("id").focus();
                        return;
                    }
                    if (id.length > 10) {
                        alert("아이디 10자 이하만 가능");
                        document.getElementById("id").focus();
                        return;
                    }
                    let password = document.getElementById("password").value;
                    if (password.length == 0) {
                        alert("비밀번호 다시 확인해");
                        document.getElementById("password").focus();
                        return;
                    }
                    let password_check = document.getElementById("password_check").value;
                    if (password_check.length == 0) {
                        alert("비밀번호 확인 다시 확인해");
                        document.getElementById("password_check").focus();
                        return;
                    }
                    if (password != password_check) {
                        alert("비밀번호가 일치하지 않으니 확인 ㄱ")
                        document.getElementById("password").focus();
                        return;
                    }
                    let email = document.getElementById("email").value;
                    if (email.length == 0) {
                        alert("이메일 다시 확인해");
                        document.getElementById("email").focus();
                        return;
                    }
                    let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                    if (!regExp.test(email)) {
                        alert("이메일이 형식에 맞지 않음");
                        document.getElementById("email").focus();
                        return;
                    }
                    let nickname = document.getElementById("nickname").value;
                    if (nickname.length == 0) {
                        alert("닉네임 다시 확인해");
                        document.getElementById("nickname").focus();
                        return;
                    }
                    document.getElementById("registerForm").submit();
                }
            </script>
        </form>
    </section>
</section>
</body>
<footer>
    <%@include file="../headerAndfooter/footer.jsp" %>
</footer>
</html>
