<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-07-24
  Time: 오전 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>플랜트랩</title>
    <link rel="icon" type="img/png" href="/static/images/round_logo_whiteBack.svg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mainpage.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/nav.jsp"/>
    <header id="header">
        <img src="/static/images/Header with image_메인페이지.svg" alt="메인 헤더">
    </header>
    <a href="member/mypage.do?mem_id=1">숨겨진 마이페이지 버튼..</a>
    <main>
        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="3000">
                    <img src="/static/images/캐러셀03.svg" class="d-block w-100" alt="carousel01">
                </div>
                <div class="carousel-item"  data-bs-interval="3000">
                    <img src="/static/images/캐러셀02.svg" class="d-block w-100" alt="carousel02">
                </div>
                <div class="carousel-item"  data-bs-interval="3000">
                    <img src="/static/images/캐러셀01.svg" class="d-block w-100" alt="carousel03">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <section class="content">
            <div class="table-section">
                <div class="table1">
                    <div class="tablecaption-container">
                        <h2>정보글</h2>
                        <!-- <caption align="top">Q&A</caption> -->
                        <button type="button" class="morebtn" onclick="window.location.href='board_list.html'">더 보기</button>
                    </div>
                    <table>
                        <tr>
                            <th class="table-title">제목</th>
                            <th class="table-title">작성자</th>
                            <th class="table-title">작성일</th>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                    </table>
                </div>
                <div class="table2">
                    <table>
                        <div class="tablecaption-container">
                            <h2>Q&A</h2>
                            <button type="button" class="morebtn" onclick="window.location.href='board_list.html?tab=3'">더 보기</button>
                        </div>
                        <tr>
                            <th class="table-title">제목</th>
                            <th class="table-title">작성자</th>
                            <th class="table-title">작성일</th>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="section-title">
                <h2>인기 친구들</h2>
                <p>다른 유저들의 반려식물들을 구경하세요.</p>
                <button type="button" class="morebtn" onclick="window.location.href='board_list.html?tab=4'">더 보기</button>
            </div>
            <div class="popular-container">
                <div class="popular-post">
                    <img src="/static/images/mainpage/01.svg" alt="grid_item">
                    <h5 class="contents">책상에 놨더니 너무 뽀짝해요 </h5>
                    <p><img src="/static/images/profile_photo.svg" alt="">Karina  | 2024.06.28</p>
                </div>
                <div class="popular-post">
                    <img src="/static/images/mainpage/02.svg" alt="grid_item">
                    <h5 class="contents">이쁜 저희 초록이좀 보고 가세요~!!</h5>
                    <p><img src="/static/images/profile_photo.svg" alt="">Karina  | 2024.06.28</p>
                </div>
                <div class="popular-post">
                    <img src="/static/images/mainpage/03.svg" alt="grid_item" style="width: 356px;" style="height: 196px;">
                    <h5 class="contents">이쁜 저희 초록이좀 보고 가세요~!!</h5>
                    <p><img src="/static/images/profile_photo.svg" alt="">Karina  | 2024.06.28</p>
                </div>
                <div class="popular-post">
                    <img src="/static/images/mainpage/04.svg" alt="grid_item">
                    <h5 class="contents">이쁜 저희 초록이좀 보고 가세요~!!</h5>
                    <p><img src="/static/images/profile_photo.svg" alt="">Karina  | 2024.06.28</p>
                </div>
                <div class="popular-post">
                    <img src="/static/images/mainpage/05.svg" alt="grid_item">
                    <h5 class="contents">이쁜 저희 초록이좀 보고 가세요~!!</h5>
                    <p><img src="/static/images/profile_photo.svg" alt="">Karina  | 2024.06.28</p>
                </div>
                <div class="popular-post">
                    <img src="/static/images/mainpage/06.svg" alt="grid_item">
                    <h5 class="contents">이쁜 저희 초록이좀 보고 가세요~!!</h5>
                    <p><img src="/static/images/profile_photo.svg" alt="">Karina  | 2024.06.28</p>
                </div>
            </div>
            <div class="section-title2">
                <h2>할인전</h2>
                <p>할인된 인기상품을 만나보세요.</p>
                <button type="button" class="morebtn" onclick="window.location.href='shopping_main.html?sale=1'">더 보기</button>
            </div>
            <div class="discount-container">
                <div class="products">
                    <img src="/static/images/mainpage/mainpage_sale_img01.svg" alt="Featured Product">
                    <div class="textbox">
                        <h5 class="discount-title">1+1 독일토분 공기정화식물 마오리소포라 율마 몬스테라 유칼립투스</h5>
                        <p class="shop">필플랜트</p>
                    </div>
                    <div class="price-container">
                        <p class="discount-price"> <span  class="origin-price">36,000원</span></p>
                        <p class="price">50% <span class="final-price">18,000</span><span style="font-weight: lighter; color:black;"> 원</span></p>
                    </div>
                </div>
                <div class="products">
                    <img src="/static/images/mainpage/mainpage_sale_img02.svg" alt="Featured Product">
                    <h5 class="discount-title">프렌치 장미 조화_4colors</h5>
                    <p class="shop">언제나 무드</p>
                    <div class="price-container">
                        <p class="discount-price"> <span class="origin-price">10,000원</span></p>
                        <p class="price">33% <span class="final-price">10,800</span><span style="font-weight: lighter; color:black;"> 원</span></p>
                    </div>
                </div>
                <div class="products">
                </div>
                <div class="products">
                    <img src="/static/images/mainpage/mainpage_sale_img03.svg" alt="Featured Product">
                    <h5 class="discount-title">은은한 꽃 향기 오렌지자스민 + 독일토분</h5>
                    <p class="shop">미플린</p>
                    <div class="price-container">
                        <p class="discount-price"> <span  class="origin-price">18,000원</span></p>
                        <p class="price">40% <span class="final-price">10,800</span><span style="font-weight: lighter; color:black;"> 원</span></p>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <jsp:include page="${pageContext.request.contextPath}/chatbot.jsp"/>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
</body>
</html>
