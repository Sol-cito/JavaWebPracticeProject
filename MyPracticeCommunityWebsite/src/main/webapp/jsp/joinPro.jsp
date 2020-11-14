<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- MemberBean 및 UserDao 임포트 : 안하면 jsp 내에서 인스턴스 생성 못함 --%>
<%@ page import="User.UserDao" %>
<%@ page import="java.io.PrintWriter" %>

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
    int userDaoResult = userDao.register(memberBean);
    /* 1 : 가입 성공 / -1 : insert 에러 / -2 : DB접속 에러 / -3 : 중복 ID/이메일/닉네임*/
    PrintWriter printWriter = response.getWriter();
    printWriter.println("<script>");
    if (userDaoResult == 0) {
        printWriter.println("alert('회원가입에 성공하였습니다!!!');");
        printWriter.println("location.href = '/'");
    } else if (userDaoResult == -1) { // insert 에러
        printWriter.println("alert('[ERROR] insert 에러');");
        printWriter.println("location.href = '/jsp/register.jsp'");
    } else if (userDaoResult == -2) { // DB 접속 에러
        printWriter.println("alert('[ERROR] DB connection error');");
        printWriter.println("location.href = '/jsp/register.jsp");
    } else if (userDaoResult == -3) { // 중복 ID/이메일/닉네임
        printWriter.println("alert('ID or EMAIL or NICKNAME 중뷐');");
        printWriter.println("location.href = '/jsp/register.jsp'");
    }
    printWriter.println("</script>");
    printWriter.flush();
%>
</body>
</html>
