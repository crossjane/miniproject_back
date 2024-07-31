<%--
  Created by IntelliJ IDEA.
  User: germs
  Date: 2024-07-25
  Time: 오후 4:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>플랜트랩: 로그인</title>
    <link rel="icon" type="img/png" href="/static/images/round_logo_whiteBack.svg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login_01.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.7.1.min.js"></script>
</head>
<body>
<main>
    <div class="container_login">
        <div class="logo">
            <img src="/static/images/round_logo_whiteBack.svg" alt="식물나라 로고">
        </div>
        <h2 id="login_eng_name">Plant Lab</h2>
        <p id="login_kor_name">플랜트랩</p>
        <form action="/member/login.do" method="post">
        <div class="input-container">
            <input class="inputbox" type="text" name="login_id" placeholder="아이디" required>
        </div>
        <div class="input-container">
            <input class="inputbox" type="password" name="password" placeholder="비밀번호" required>
        </div>
        <button class="login" type="submit" >로그인</button>
        <div class="options">
            <ul>
                <li>
                    <a href="#">아이디 찾기</a>
                </li>
                |
                <li>
                    <a href="#">비밀번호 찾기</a>
                </li>
                |
                <li>
                    <a href="#">회원가입</a>
                </li>
            </ul>
        </div>
        <div style="font-size: 16px; color:#898989; margin-top:60px; margin-bottom:30px;">또는</div>
        <button class="social-login kakao">
            <img src="/static/images/login_kakao_logo.svg" alt="카카오톡 로고" style="height:20px; margin-right:10px;">
            카카오로 시작하기
        </button>
        <button class="social-login google">
            <img src="/static/images/login_google_logo.svg" alt="구글 로고" style="height:20px; margin-right:10px;">
            Google로 시작하기
        </button>
        </form>
    </div>
</main>
<script>
    $(() => {
        //model, session , request 에 담겨있는 데이터 javascript에서 꺼내서 사용하기
        const loginFailMsg = '${loginFailMsg}';
        console.log("Login Fail Message: " + loginFailMsg);

        if(loginFailMsg === 'idNotExist') {
            alert("존재하지 않는 아이디 입니다.");
        }else if(loginFailMsg === 'wrongPassword'){
            alert("잘못된 비밀번호 입니다.");
        }
    });
</script>
</body>
</html>
