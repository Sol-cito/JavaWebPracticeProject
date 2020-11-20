<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="User.UserDao" %>
<%@ page import="User.MemberBean" %>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
    <title>로그인 jsp</title>
</head>
<body>
<jsp:useBean id="memberBean" class="User.MemberBean"/>
<jsp:setProperty name="memberBean" property="*"/>

<%
    UserDao userDao = UserDao.getInstance();
    int result = userDao.login(memberBean);
    PrintWriter printWriter = response.getWriter();
    printWriter.println("<script>");
    switch (result) {
        case 1: //로긴 성공
            session.setAttribute("nickname", memberBean.getNickname());
            System.out.println("세션 설정 : " + session.getAttribute("nickname"));
            break;
        case -1: // DB조회결과 0건
            printWriter.println("alert('아이디/비번 다시 확인하시오');");
            break;
        default:
            printWriter.println("alert('시스템 오류...');");
            break;
    }
    printWriter.println("location.href = '/'");
    printWriter.println("</script>");
    printWriter.flush();
%>

</body>
</html>
