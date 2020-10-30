<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- MemberBean 및 UserDao 임포트 : 안하면 jsp 내에서 인스턴스 생성 못함 --%>
<%@ page import="User.UserDao" %>
<%@ page import="User.MemberBean" %>

<html>
<head>
    <title>회원가입 처리 JSP</title>
</head>
<body>
<%-- form에 담긴 data를 전송받는다.--%>
<%--    <%--%>
<%--    request.setCharacterEncoding("euc-kr"); 한글 깨짐 방지 인코딩인데 일단 주석처리 --%>
<%--    %>--%>
<jsp:useBean id="memberBean" class="User.MemberBean"/>
<%--
MemberBean memberBean = request.getAttribute("memberBean");
if(memberBean == null){
    memberBean = new MemberBean();
    memberBean.setAttribute("memberBean", memberBean);
}
--%>
<%-- setProperty : 자바빈의 set 메소드를 호출하는 것임. request.set 쓸 필요 없음
반대는 getProperty --%>
<jsp:setProperty name="memberBean" property="*"/>
<%-- property 의 속성은 태그의 name으로 맵핑됨 --%>
<%-- property = "*" 로 하면 모든 속성--%>
<%
    UserDao userDao = UserDao.getInstance();
    userDao.register(memberBean);
%>
회원가입을 축하드립니다! <br>
<div>
    아이디 : <%=memberBean.getId() %>
</div>
<div>
    비밀번호 : <%=memberBean.getPassword() %>
</div>
<div>
    이메일 : <%=memberBean.getEmail() %>
</div>
<div>
    닉네임 : <%=memberBean.getNickname() %>
</div>
</body>
</html>
