<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-07-24
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<html>
<head>
    <title>플랜트랩: ${board.board_title}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/board-detail.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/nav.jsp"/>
    <header id="header">
        <c:choose>
            <c:when test="${board.board_type eq 1}">
                <img src="${pageContext.request.contextPath}/static/images/header_정보.png" alt="정보게시판 헤더">
            </c:when>
            <c:when test="${board.board_type eq 2}">
                <img src="${pageContext.request.contextPath}/static/images/header_잡담.png" alt="잡담게시판 헤더">
            </c:when>
            <c:when test="${type eq 3}">
                <img src="${pageContext.request.contextPath}/static/images/header_질문.png" alt="질문게시판 헤더">
            </c:when>
            <c:when test="${type eq 4}">
                <img src="${pageContext.request.contextPath}/static/images/header_그린톡.png" alt="그린톡 헤더">
            </c:when>
        </c:choose>
    </header>
    <main>
        <!--게시판 이동 탭-->
        <div class="board_button_area">
            <ul>
                <li class="label_underline">
                    <label for="info">
                        <input type="checkbox" id="info">
                        <span>정보공유</span>
                    </label>
                </li>
                <li class="label_underline">
                    <label for="free">
                        <input type="checkbox" id="free">
                        <span>잡담</span>
                    </label>
                </li>
                <li class="label_underline">
                    <label for="QnA">
                        <input type="checkbox" id="QnA">
                        <span>Q&A</span>
                    </label>
                </li>
                <li class="label_underline">
                    <label for="greenTalk">
                        <input type="checkbox" id="greenTalk">
                        <span>그린톡</span>
                    </label>
                </li>
            </ul>
        </div>
        <script>
            const underline = document.getElementsByClassName("label_underline");

            for(let i = 0; i < 4; i++){
                if(i === ${board.board_type} - 1){
                    underline[i].classList.add("activeBlock");
                } else {
                    underline[i].classList.remove("activeBlock");
                }
            }
        </script>
        <!--글 내용-->
        <div class="page_container">
            <h5>${board.board_title}</h5>
            <div class="userInfo">
                <img src="${pageContext.request.contextPath}/static/images/profile.svg" alt="profile_photo" style="width:40px;">
                ${board.mem_nickname}
                <p>
                    작성일: <javatime:format value="${board.board_reg}" pattern="yyyy-MM-dd"/>
                </p>
                <p>
                    수정일: <javatime:format value="${board.board_reg}" pattern="yyyy-MM-dd"/>
                </p>
                <img src="${pageContext.request.contextPath}/static/images/heart_empty.svg" alt="heart" onclick="toggleHeart(this)">
                <p>${board.board_like_cnt}</p>
                <img src="${pageContext.request.contextPath}/static/images/bookmark_empty.svg" alt="bookmark" onclick="toggleBookmark(this)">
                <p>${board.board_bookmark_cnt}</p>
            </div>
            <div class="q-contents">
                <p>${board.board_content}</p>
            </div>
            <div class="comments">
                <h5>댓글</h5>
                <div class="comment-list" id="comment-list">
                    <!-- Comments will appear here -->
                </div>
                <div class="comment-input">
                    <div class="input-container">
                        <textarea type="text" id="comment-input" placeholder="댓글을 입력하세요"></textarea>
                        <button onclick="addComment()">댓글 쓰기</button>
                    </div>
                </div>
                <hr>
                <div id="button">
                    <a href="/board/board-main.do?tab=${board.board_type}">목록</a>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="${pageContext.request.contextPath}/chatbot.jsp"/>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
</body>
</html>
