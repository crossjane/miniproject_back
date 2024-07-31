<%@ page import="com.bit.springboard.dto.BoardDto" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-07-25
  Time: 오전 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>

<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/board-list.css">
</head>
<body>
    <%
        Object popList = request.getAttribute("popList");
        Object boardList = request.getAttribute("boardList");
    %>
    <!--게시판 내용-->
    <div id="title_table_area">
        <div class="search_bar">
            <form id="search_form" action="/board/board-list.do" method="post">
                <select name="search_condition" id="search_condition">
                    <option value="all">전체</option>
                    <option value="title">제목</option>
                    <option value="writer">작성자</option>
                </select>
                <input type="text" id="search_keyword" name="search_keyword" value="">
                <button type="submit" id="search_btn">검색</button>
            </form>
        </div>
        <div class="table_popular">
            <div class="t_headerbar">
                <div>
                    <img src="${pageContext.request.contextPath}/static/images/인기글 별.svg" alt="별" style="margin-right: 7px;">
                    인기글
                </div>
                <select name="pop_condition" id="pop_condition">
                    <option value="조회수">조회수</option>
                    <option value="공감순">공감순</option>
                    <option value="스크랩">스크랩</option>
                </select>
            </div>
            <div class="table_content">
                <table class="table table-hover" style="margin: 0;">
                    <colgroup>
                        <col width="5%">
                        <col width="42%">
                        <col width="10%">
                        <col width="15%">
                        <col width="10%">
                        <col width="10%">
                        <col width="13%">
                    </colgroup>
                    <thead>
                    <tr class="table-success">
                        <th scope="col">#</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">작성일</th>
                        <th scope="col">조회수</th>
                        <th scope="col">좋아요</th>
                        <th scope="col">스크랩</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${popList}" var="popBoard">
                            <tr onclick="location.href='/board/update-cnt.do?id=${popBoard.board_id}'">
                                <td scope="row">${popBoard.row_num}</td>
                                <td>${popBoard.board_title}</td>
                                <td>${popBoard.mem_nickname}</td>
                                <td>
                                    <javatime:format value="${popBoard.board_reg}" pattern="yyyy-MM-dd"/>
                                </td>
                                <td>${popBoard.board_view_cnt}</td>
                                <td>${popBoard.board_like_cnt}</td>
                                <td>${popBoard.board_bookmark_cnt}0</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="table_recent">
            <div class="t_headerbar">
                0000개
                <div id="t_dropdown">
                    <select name="rows-num" id="rows-num">
                        <option value="10">10</option>
                        <option value="15">15</option>
                        <option value="20">20</option>
                    </select>
                    <select name="rec_condition" id="rec_condition">
                        <option value="최신순">최신순</option>
                        <option value="조회수">조회수</option>
                        <option value="공감순">좋아요</option>
                        <option value="스크랩">스크랩</option>
                    </select>
                </div>
            </div>
            <div class="table_content">
                <table class="table table-hover" style="margin: 0;">
                    <colgroup>
                        <col width="5%">
                        <col width="42%">
                        <col width="10%">
                        <col width="15%">
                        <col width="10%">
                        <col width="10%">
                        <col width="13%">
                    </colgroup>
                    <thead>
                    <tr class="table-success">
                        <th scope="col">#</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">작성일</th>
                        <th scope="col">조회수</th>
                        <th scope="col">좋아요</th>
                        <th scope="col">스크랩</th>
                        <!--스파이-->
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${boardList}" var="board">
                        <tr onclick="location.href='/board/update-cnt.do?id=${board.board_id}'">
                            <!--스파이-->
                            <td scope="row">${board.row_num}</td>
                            <td>${board.board_title}</td>
                            <td>${board.mem_nickname}</td>
                            <td>
                                <javatime:format value="${board.board_reg}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>${board.board_view_cnt}</td>
                            <td>${board.board_like_cnt}</td>
                            <td>${board.board_bookmark_cnt}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="under_bar">
            <ul class="t_pagination">
                <li class="page-item">
                    <a class="pageBtn" aria-label="Previous" href=""><<</a>
                </li>
                <li class="page-item">
                    <a class="pageBtn" href="">1</a>
                </li>
                <li class="page-item">
                    <a class="pageBtn" href="">2</a>
                </li>
                <li class="page-item">
                    <a class="pageBtn" href="">3</a>
                </li>
                <li class="page-item">
                    <a class="pageBtn" href="">4</a>
                </li>
                <li class="page-item">
                    <a class="pageBtn" href="">5</a>
                </li>
                <li class="page-item">
                    <a class="pageBtn" aria-label="Next" href="">>></a>
                </li>
            </ul>
            <button type="button" id="button" onclick="location.href='/board/post.do'">글쓰기</button>
        </div>
    </div>
</body>

</html>
