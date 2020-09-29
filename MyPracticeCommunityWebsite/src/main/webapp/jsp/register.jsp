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
        <form method="post" action="/test"> <%-- action 에 link 페이지 걸어야 함--%>
            <div class="register-attributes">
                <div class="form-group">
                    <label for="id">아이디 : </label>
                    <input id="id" type="text" style="width: 250px">
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
                    <input id="nickname" type="text" style="width: 250px">
                    <p>닉네임은 글 작성시 노출됩니다. 개인정보가 노출되지 않도록 주의하시기 바랍니다.<br>
                        닉네임을 한 번 변경하신 후에는 7일 이내에 다시 닉네임을 변경하실 수 없습니다.</p>
                </div>
            </div>
            <input name="registerButton" type="submit" value="회원가입하기"/>
            <input name="testInput" type="submit" value="입력 내용 확인하기"/>
        </form>
    </section>
</section>
</body>
<footer>
    <%@include file="../headerAndfooter/footer.jsp" %>
</footer>
</html>
