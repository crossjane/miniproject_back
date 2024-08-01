<%--
  Created by IntelliJ IDEA.
  User: phani
  Date: 24. 7. 30.
  Time: 오전 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/greentalk_post.css">
<html>
<head>
    <title>Title</title>
</head>
<body class="noto-sans-kr">
    <jsp:include page="${pageContext.request.contextPath}/nav.jsp"/>

<!-- <header id="header">
    <img src="image/header_정보.png" alt="글쓰기 헤더">
</header> -->
<!-- <div class="hero">
    <img src="images/Header image.png.png" alt="">
    <h1></h1>
    <p></p>
</div> -->
<div class="container">
    <div class="form-group">
        <label for="title"></label>
        <!-- <input type="text" id="title" name="title" placeholder="제목을 입력하세요."
        onfocus="placeholder=''" onblur="placeholder='제목을 입력하세요.'"
        > -->
        <textarea name="content" id="content" placeholder="내용을 입력하세요."
                  onfocus="placeholder=''" onblur="placeholder='내용을 입력하세요.'" class="textarea"></textarea> <!--폰트 바꿀 것-->
    </div>
    <div class="form-group">
        <label for="tags"></label>
        <input type="text" id="tags" name="tags" class="tag-input" placeholder="#태그"
               onfocus="placeholder=''" onblur="placeholder='#태그'"
        >
    </div>
    <div class="warning-group">
        <p class="warning">※타인을 향한 비난 또는 비방 및 게시판의 목적에 맞지 않는 글은 관리자에 의해 삭제될 수 있습니다.</p>

    </div>
    <div class="uploadBox">
        <div class="uploadIcons">
            <img src="/static/images/images.png.png" alt="이미지 업로드 아이콘" width="60px" height="60px" id="img">
            <img src="/static/images/video.png.png" alt="비디오 업로드 아이콘"width="45px" height="50px" class="vid" id="vid">
        </div>
        <div class="uploadBtn">
            <input type="file" class="imageBtn" accept="image/*">
            <input type="file" class="videoBtn" accept="video/*">
        </div>
    </div>
    <div class="confirm-group">
        <button type="submit" class="confirm">글 올리기</button>
    </div>
</div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>

<script>
    $(() => {
        $("#img").click((e) => {
            $(".imageBtn").trigger("click");
        });

        $("#vid").click((e) => {
            $(".videoBtn").trigger("click");
        });
    });
</script>
</body>
</html>
