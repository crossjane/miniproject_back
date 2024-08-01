<%--
  Created by IntelliJ IDEA.
  User: phani
  Date: 24. 7. 24.
  Time: 오후 7:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<html>
<head>
    <title>플랜트랩: 그린톡</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/board-main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/greentalk.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/nav.jsp"/>
    <header id="header">
        <img src="${pageContext.request.contextPath}/static/images/header_그린톡.png" alt="그린톡 헤더">
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
                <li class="label_underline activeBlock">
                    <label for="greenTalk">
                        <input type="checkbox" id="greenTalk">
                        <span>그린톡</span>
                    </label>
                </li>
            </ul>
        </div>
        <div class="greentalksearchcontainer">
            <form id="search-form" action="/board/greentalk.do" method="post">
                <input type="hidden" name="pageNum" value="${page.cri.pageNum}">
                <input type="hidden" name="amount" value="${page.cri.amount}">
                <select class="greentalksearchmenu" name="searchCondition">
                    <option value="all"
                            <c:if test="${searchMap == null || searchMap.searchCondition == 'all'}">
                                selected
                            </c:if>>전체</option>
                    <option value="content"
                            <c:if test="${searchMap.searchCondition == 'title'}">
                                selected
                            </c:if>>내용</option>
                    <option value="writer"
                            <c:if test="${searchMap.searchCondition == 'writer'}">
                                selected
                            </c:if>>작성자</option>
                </select>
                <input type="text" class="greentalksearch" name="searchKeyword" value="${searchMap.searchKeyword}">
                <button type="submit" class="greentalksearchbtn">검색</button>
            </form>
        </div>
        <div class="greenbody">
            <div class="container_green">
                <div class="dailycontent">
                                <c:forEach items="${greentalkList}" var="greentalk">
                    <div class="card" style="width: 546px;">
                                        <c:choose>
                                            <c:when test="${greentalk.file != null and greentalk.file.filetype eq 'image'}">
                                                <img class="gt-placeholder-img card-img-top" width="100%" height="261px"
                                                     src="/static/images/storage/${greentalk.file.filename}"
                                                     alt="${greentalk.file.fileoriginname}">
                                            </c:when>
                                        </c:choose>
                        <div class="card-header">
                            <div class="card-writer">
                                <img src="/static/images/storage/${greentalk.greentlakDto.mem_pic}" alt="" style="width: 30px; height: 30px;"> ${greentalk.greentalkDto.mem_nickname}
                            </div>
                            <div class="report">
                                <img src="${pageContext.request.contextPath}/static/images/그린톡/menu.png.png" alt="신고 버튼" class="reportbtn">
                            </div>
                        </div>
                        <img src="/static/images/storage/${greentalk.greentalkDto.green_pic}" class="card-img-top" alt="..."
                             onclick="openModal(${greentalk.greentalkDto.green_id});">
                        <div class="card-body">
                            <p class="card-text">${greentalk.greentalkDto.green_content}</p>
                            <div class="tag-group">
                                <div class="tags">
                                    <p class="tag1">#${greentalk.greentalkDto.green_tag}</p>
                                </div>
                                <div class="btnicon">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/hearticon.png" alt="" class="hearticon">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/filledhearticon.png" alt="" class="filledhearticon" style="display: none;">
                                </div>
                            </div>
                        </div>
                    </div>
                                </c:forEach>
<%--                    <div class="card2" style="width: 546px;">--%>
<%--                        <div class="card-header">--%>
<%--                            <div class="card-writer">--%>
<%--                                <img src="${pageContext.request.contextPath}/static/images/그린톡/defaultprofile.png" alt="" style="width: 29px;">  장길산--%>
<%--                            </div>--%>
<%--                            <div class="report">--%>
<%--                                <img src="${pageContext.request.contextPath}/static/images/그린톡/menu.png.png" alt="신고 버튼" class="reportbtn">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <img src="${pageContext.request.contextPath}/static/images/그린톡/ranksample2.jpeg" class="card-img-top" alt="..." data-bs-toggle="modal"--%>
<%--                             data-bs-target="#rank2modal">--%>
<%--                        <div class="card-body">--%>
<%--                            <p class="card-text">오늘 심은 양파...^^</p>--%>
<%--                            <div class="tag-group">--%>
<%--                                <div class="tags">--%>
<%--                                    <p class="tag1">#내돈내심</p>--%>
<%--                                    <p class="tag2">#반찬</p>--%>
<%--                                </div>--%>
<%--                                <div class="btnicon">--%>
<%--                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">--%>
<%--                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">--%>
<%--                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/hearticon.png" alt="" class="hearticon" id="heart">--%>
<%--                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/filledhearticon.png" alt="" class="filledhearticon" style="display: none;">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
        <div class="normalcon">
            <div class="conimg">
                <img src="/static/images/storage/${greentalk.greentalkDto.green_pic}" alt="" class="thumbnail" id="normal1">
                <img src="/static/images/storage/${greentalk.greentalkDto.green_pic}" alt="" class="thumbnail" id="normal2">
                <img src="/static/images/storage/${greentalk.greentalkDto.green_pic}" alt="" class="thumbnail" id="normal3">
            </div>
        </div>
        </div>
        <!--modal 팝업-->
        <div class="modal fade" id="rank1modal">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modalbox">
                        <div class="modal-body">
                            <img src="/static/images/storage/${greentalk.file.filename}" alt="" class="modalmain">
                            <div class="modal-right">
                                <div class="modalthumb">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail1.png" alt="" class="modalthumbnail" id="modalthumb1_1">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail2.png" alt="" class="modalthumbnail" id="modalthumb1_2">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail3.png" alt="" class="modalthumbnail" id="modalthumb1_3">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail4.png" alt="" class="modalthumbnail" id="modalthumb1_4" style="height: 96.27px;">
                                </div>
                                <div class="modalcontentbox">
                                    <div class="modalcontents">
                                        <div class="writerpic">
                                            <img src="${pageContext.request.contextPath}/static/images/프로필사진.png" alt="" style="width: 30px; height: 30px;">
                                        </div>
                                        <div class="modalmaincon">
                                            karina87
                                        </div>
                                        <div class="modalmaindate">
                                            24.06.27
                                        </div>
                                        <div class="modalreport">
                                            <img src="${pageContext.request.contextPath}/static/images/그린톡/menu.png.png" alt="" style="width: 15px;">
                                        </div>
                                    </div>
                                    <div class="modalmaincontent">
                                        <p>123</p>
                                    </div>
                                </div>
                            </div>
                            <div class="title">
                                <p class="titlename">#초록  #자랑</p>
                                <div class="btnicon">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/hearticon.png" class="hearticon" alt="하트" style="display: inline;">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/filledhearticon.png" class="filledhearticon" alt="채워진 하트" style="display: none;">
                                </div>
                            </div>
                            <div class="comment">
                                <input action="text" class="commentbox" placeholder="댓글을 입력하세요."
                                       onfocus="placeholder=''" onblur="placeholder='댓글을 입력하세요.'"></input>
                                <div type="submit" class="confirmbox">게시</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%--        <div class="modal fade" id="rank2modal">--%>
<%--            <div class="modal-dialog modal-xl">--%>
<%--                <div class="modal-content">--%>
<%--                    <div class="modalbox">--%>
<%--                        <div class="modal-body">--%>
<%--                            <img src="${pageContext.request.contextPath}/static/images/ranksample2.jpeg" alt="" class="modalmain">--%>
<%--                            <div class="modal-right">--%>
<%--                                <div class="modalthumb">--%>
<%--                                    <img src="${pageContext.request.contextPath}/static/images/thumbnail1.png" alt="" class="modalthumbnail" id="modalthumb2_1">--%>
<%--                                    <img src="${pageContext.request.contextPath}/static/images/thumbnail2.png" alt="" class="modalthumbnail" id="modalthumb2_2">--%>
<%--                                    <img src="${pageContext.request.contextPath}/static/images/thumbnail3.png" alt="" class="modalthumbnail" id="modalthumb2_3">--%>
<%--                                    <img src="${pageContext.request.contextPath}/static/images/thumbnail4.png" alt="" class="modalthumbnail" id="modalthumb2_4" style="height: 96.27px;">--%>
<%--                                </div>--%>
<%--                                <div class="modalcontentbox">--%>
<%--                                    <div class="modalcontents">--%>
<%--                                        <div class="writerpic">--%>
<%--                                            <img src="${pageContext.request.contextPath}/static/images/defaultprofile.png" alt="" style="width: 30px;">--%>
<%--                                        </div>--%>
<%--                                        <div class="modalmaincon">--%>
<%--                                            장길산--%>
<%--                                        </div>--%>
<%--                                        <div class="modalmaindate">--%>
<%--                                            24.06.28--%>
<%--                                        </div>--%>
<%--                                        <div class="modalreport">--%>
<%--                                            <img src="${pageContext.request.contextPath}/static/images/menu.png.png" alt="" style="width: 15px;">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="modalmaincontent">--%>
<%--                                        <p>오늘 심은 양파...^^</p>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="title">--%>
<%--                                <p class="titlename">#내돈내심  #반찬</p>--%>
<%--                                <div class="btnicon">--%>
<%--                                    <img src="${pageContext.request.contextPath}/static/images/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">--%>
<%--                                    <img src="${pageContext.request.contextPath}/static/images/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">--%>
<%--                                    <img src="${pageContext.request.contextPath}/static/images/hearticon.png" class="hearticon" alt="하트" style="display: inline;">--%>
<%--                                    <img src="${pageContext.request.contextPath}/static/images/filledhearticon.png" class="filledhearticon" alt="채워진 하트" style="display: none;">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="comment">--%>
<%--                                <input action="text" class="commentbox" placeholder="댓글을 입력하세요."--%>
<%--                                       onfocus="placeholder=''" onblur="placeholder='댓글을 입력하세요.'"></input>--%>
<%--                                <div type="submit" class="confirmbox">게시</div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
        <jsp:include page="${pageContext.request.contextPath}/chatbot.jsp"/>
        <jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
    </main>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const cardTexts = document.querySelectorAll('.card-text');

            cardTexts.forEach(function(cardText) {
                const text = cardText.textContent.trim();
                const maxLength = 30;

                if (text.length > maxLength) {
                    const trimmedText = text.slice(0, maxLength) + '...';
                    cardText.textContent = trimmedText;
                }
            });
        });


        let pageNum = 1;
        const amount = 3;

        let timer;

        $(window).on("scroll", (e) => {
            if (timer) {
                clearTimeout(timer);
            }
            timer = setTimeout(() => {

                // 현재 스크롤의 위치
                const scrollTop = $(window).scrollTop();
                // 브라우저의 세로길이(스크롤 길이는 포함되지 않음)
                const windowHeight = window.innerHeight;
                // 웹 문서의 세로 길이(스크롤 길이 포함됨)
                const documentHeight = document.documentElement.scrollHeight;

                // 스크롤이 바닥에 닿았는지 여부
                const isBottom = documentHeight <= scrollTop + windowHeight;

                if(isBottom) {
                    // 현재 페이지의 번호가 마지막 페이지의 번호와 같으면 함수 종료
                    if($("input[name='pageNum']").val() >= $("input[name='endPage']").val()) {
                        return;
                    } else {
                        // 스크롤이 바닥에 닿으면 현재 페이지 번호 + 1
                        $("input[name='pageNum']").val(parseInt($("input[name='pageNum']").val()) + 1);
                        console.log("바닥에 닿음");


                        $.ajax({
                            url: '/board/greentalk-list-ajax.do',
                            type: 'POST',
                            data: $("#search-form").serialize(),
                            success: (obj) => {
                                console.log(obj);
                                let htmlStr = "";
                                for(let i = 0; i < obj.greentalkList.length; i++) {
                                    htmlStr += `
                                              <img class="thumbnail" width="100%" height="261px"
                                                         src="/static/images/storage/\${obj.greentalkList[i].greentalkDto.green_pic}"
                                                         alt="${greentalk.file.fileoriginname}">
                                            `;
                                }
                                // console.log(htmlStr);
                                $(".conimg").append(htmlStr);
                            },
                            error: (err) => {
                                console.log(err);
                            }
                        });
                    }
                }

            }, 50);
        });

        // 커뮤니티 탭 이동
        const info_button = document.querySelector("#info");
        const free_button = document.querySelector("#free");
        const QnA_button = document.querySelector("#QnA");

        info_button.addEventListener("click", () => {
            window.location.href = "/board/board-main.do?tab=1";
        });

        free_button.addEventListener("click", () => {
            window.location.href = "/board/board-main.do?tab=2";
        });

        QnA_button.addEventListener("click", () => {
            window.location.href = "/board/board-main.do?tab=3";
        });

        // const viewModal = document.getElementsByClassName("card");

        const openModal = (greenId) => {
            // console.log(greenId);
            //greenId로 ajax를 보내서
            // modal 구성 후 modal 표출
            let htmlStr = '';

            $.ajax({
                url: '/board/modal-ajax.do',
                type: 'POST',
                data: {"green_id": greenId},
                success: (obj) => {
                    console.log(obj);
                    // let htmlStr = "";
                        htmlStr += `
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modalbox">
                        <div class="modal-body">
                            <img src="/static/images/storage/\${obj.greentalk.green_pic}" alt="" class="modalmain">
                            <div class="modal-right">
                                <div class="modalthumb">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail1.png" alt="" class="modalthumbnail" id="modalthumb1_1">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail2.png" alt="" class="modalthumbnail" id="modalthumb1_2">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail3.png" alt="" class="modalthumbnail" id="modalthumb1_3">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail4.png" alt="" class="modalthumbnail" id="modalthumb1_4" style="height: 96.27px;">
                                </div>
                                <div class="modalcontentbox">
                                    <div class="modalcontents">
                                        <div class="writerpic">
                                            <img src="/static/images/storage/\${obj.greentalk.mem_pic}" alt="" style="width: 30px; height: 30px;">
                                        </div>
                                        <div class="modalmaincon">
                                            \${obj.greentalk.mem_nickname}
                                        </div>
                                        <div class="modalmaindate">
                                            \${obj.greentalk.green_mod}
                                        </div>
                                        <div class="modalreport">
                                            <img src="${pageContext.request.contextPath}/static/images/그린톡/menu.png.png" alt="" style="width: 15px;">
                                        </div>
                                    </div>
                                    <div class="modalmaincontent">
                                        <p>\${obj.greentalk.green_content}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="title">
                                <p class="titlename">#\${obj.greentalk.green_tag}</p>
                                <div class="btnicon">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/hearticon.png" class="hearticon" alt="하트" style="display: inline;">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/filledhearticon.png" class="filledhearticon" alt="채워진 하트" style="display: none;">
                                </div>
                            </div>
                            <div class="comment">
                                <input action="text" class="commentbox" placeholder="댓글을 입력하세요."
                                       onfocus="placeholder=''" onblur="placeholder='댓글을 입력하세요.'"></input>
                                <div type="submit" class="confirmbox">게시</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                                            `;
                    $('#rank1modal').html(htmlStr);

                    // $("#rank1modal").modal('show');

                },
                error: (err) => {
                    console.log(err);
                }
            });

            $("#rank1modal").modal('show');
        }
    </script>
</body>
</html>
