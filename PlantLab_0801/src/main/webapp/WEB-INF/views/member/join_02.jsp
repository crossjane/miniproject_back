<%--
  Created by IntelliJ IDEA.
  User: germs
  Date: 2024-07-25
  Time: 오후 5:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>가입이 완료되었습니다!</title>
    <link rel="icon" type="img/png" href="/static/images/round_logo_whiteBack.svg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/join_02.css">
</head>
<body>
    <main>
        <div class="join-container">
            <h2 id="join-congratulate">축하합니다!!<br>가입이 완료되었습니다.</h2>
            <img src="/static/images/cactus.png" alt="cactus">
            <p id="join-explain">식물에 대한 다양한 이야기와 정보를 공유해보세요.</p>
            <button type="button" class="submit-login-btn" onclick="window.location.href = `_01_login01.html`">
                로그인</button>
            <button type="button" class="submit-home-btn" onclick="window.location.href = `login_01.jsp`">
                홈으로</button>
        </div>
    </main>
</body>
</html>
