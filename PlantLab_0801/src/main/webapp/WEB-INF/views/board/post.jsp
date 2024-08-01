<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-07-24
  Time: 오후 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>플랜트랩:글쓰기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/post.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/nav.jsp"/>
    <header>
        <img src="${pageContext.request.contextPath}/static/images/header_글쓰기.png" alt="글쓰기 헤더 이미지">
    </header>
    <main>
        <div class="w_container">
            <div class="w_header">
                <select name="boardtype" id="boardtype">
                    <option value="info">정보게시판</option>
                    <option value="free">자유게시판</option>
                    <option value="QnA">질문게시판</option>
                </select>
                <form action="" method="post" style="margin:0;">
                    <input type="submit" value="저장" id="save_btn">
                </form>
            </div>
            <div class="writingbox">
                <div id="w_title">
                    <input type="text" placeholder="제목을 입력하세요.">
                </div>
                <div id="w_rule"></div>
                <div id="w_body">
                    <textarea name="body" id="w_content" cols="147" rows="20"></textarea>
                </div>
            </div>
            <div class="w_file">
                <div class="btn_line">
                    <input type="file" name="" id="" multiple>
                </div>
                <div class="f_list"></div>
            </div>
        </div>
    </main>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
    <script>
        const board_name = document.getElementById("boardtype");
        const text = document.getElementById("w_rule");

        switch(${tab}){
            case '1':
                board_name.value = 'info';
                break;
            case '2':
                board_name.value = 'free';
                break;
            case '3':
                board_name.value = 'QnA';
                break;
        }

        text.innerHTML = insertRule(board_name.value);

        board_name.addEventListener("change", () => {
            insertRule(board_name.value);
        });
    </script>
</body>
</html>
