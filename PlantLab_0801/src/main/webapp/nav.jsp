<%@ page import="com.bit.springboard.dto.MemberDto" %><%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-07-24
  Time: 오전 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <!--로고-->
    <link rel="shortcut icon" href="<c:url value="/favicon.ico"/>" type="image/x-icon">
    <!--jquery-->
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.7.1.min.js"></script>
    <!--외부 css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weather.css">
    <!--외부 js-->
    <script src="${pageContext.request.contextPath}/static/js/weather.js"></script>
    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body class="noto-sans-kr">
    <nav>
        <div class="nav_left">
            <div>
                <a href="/">
                    <img src="${pageContext.request.contextPath}/static/images/nav_logo.svg" alt="플랜트랩 로고">
                </a>
            </div>
            <div>
                <ul class="nav_menu">
                    <li><a href="/board/board-main.do?tab=1">커뮤니티</a></li>
                    <li><a href="/products/shopping_main.do">스토어</a></li>
                    <div id="weather">
                        <li id="weatherList">
                            <img id="weatherImg" src="#" alt="날씨 이미지">
                            <img id="weatherLine" src="${pageContext.request.contextPath}/static/images/weatherLine.svg" alt="라인 이미지">
                            <p id="result"></p>
                        </li>
                    </div>
                </ul>
            </div>
        </div>
        <div class="nav_right">
            <div class="nav_search">
                    <span>
                        <svg width="25" height="25.5" viewBox="0 0 30 34" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M28.9749 26.5226L23.9072 20.9181L20.0092 19.137C21.3071 17.0958 22.0025 14.6606 22 12.1652C22 5.45727 17.0654 0 11 0C4.93455 0 0 5.45727 0 12.1652C0 18.8731 4.93455 24.3304 11 24.3304C13.276 24.3333 15.4961 23.551 17.3511 22.0925L18.9574 26.3918L24.0249 31.9966C24.3499 32.3561 24.7358 32.6412 25.1604 32.8357C25.5851 33.0303 26.0402 33.1304 26.4998 33.1304C26.9595 33.1305 27.4146 33.0303 27.8393 32.8358C28.2639 32.6413 28.6498 32.3562 28.9748 31.9968C29.2998 31.6374 29.5576 31.2106 29.7335 30.741C29.9094 30.2714 30 29.7681 30 29.2597C30 28.7514 29.9095 28.2481 29.7336 27.7784C29.5577 27.3088 29.2999 26.8821 28.9749 26.5226ZM2 12.1652C2 6.67703 6.03749 2.21185 11 2.21185C15.9625 2.21185 20 6.67703 20 12.1652C20 17.6534 15.9625 22.1185 11 22.1185C6.03749 22.1185 2 17.6534 2 12.1652ZM27.5606 30.4326C27.2791 30.7433 26.8976 30.9177 26.4999 30.9177C26.1022 30.9177 25.7208 30.7433 25.4393 30.4326L20.6535 25.1399L19.1601 21.1424L22.7749 22.7939L27.5607 28.0866C27.8416 28.398 27.9993 28.8198 27.9993 29.2596C27.9993 29.6994 27.8415 30.1213 27.5606 30.4326Z" fill="#878787"/>
                            </svg>
                    </span>
                <input type="text" id="search" placeholder="통합검색">
            </div>
            <c:choose>
                <c:when test="${loggedInMember eq null}">
                    <div class="member">
                        <ul>
                            <li><a href="/member/login.do">로그인</a></li>
                            |
                            <li><a href="/member/join.do">회원가입</a></li>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="member">
                        <ul>
                            <li style="margin:0;">
                                <a href="${pageContext.request.contextPath}/member/mypage.do">
                                    <c:choose>
                                        <c:when test="${loggedInMember.mem_pic == null}">
                                            <img src="/static/images/profile_default.svg" alt="기본프로필 사진">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/static/images/storage/${loggedInMember.mem_pic}" alt="프로필사진" width="40px" height="40px">
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                            </li>
                            <li style="margin-left: 10px; font-size: 1.1rem">
                                <a href="${pageContext.request.contextPath}/member/mypage.do" style="font-weight:400">${loggedInMember.mem_nickname}</a>
                            </li>
                            <li id="logout">
                                <a href="/member/logout.do">로그아웃</a>
                            </li>
                        </ul>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>
</body>
</html>
