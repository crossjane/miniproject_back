<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-07-24
  Time: 오후 4:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/chatbot.css">
</head>
<body>
    <div id="popup-icon1">
        <img src="${pageContext.request.contextPath}/static/images/챗봇아이콘.png" alt="Popup Icon" id="chat-bot-image" style="width: 60px; height: 60px;">
    </div>
    <div id="popup-content1" class="hidden">
        <p>안녕하세요! 플랜트 봇 입니다!<br>궁금한 것은 모두 플랜트 봇에게 물어보세요!</p>
    </div>
    <div id="popup-icon2">
        <img src="${pageContext.request.contextPath}/static/images/top아이콘.png" alt="Popup Icon" id="top-image" style="width: 60px; height: 60px;">
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const popupIcon = document.getElementById('popup-icon1');
            const popupContent = document.getElementById('popup-content1');
            const popupIcon2 = document.getElementById('popup-icon2');

            popupIcon.addEventListener('mouseover', () => {
                popupContent.classList.remove('hidden');
            });

            popupIcon.addEventListener('mouseleave', () => {
                popupContent.classList.add('hidden');
            });

            popupIcon2.addEventListener('click', () => {
                window.scrollTo({ top: 0, behavior: 'smooth' });
            });
        });
    </script>
</body>
</html>
