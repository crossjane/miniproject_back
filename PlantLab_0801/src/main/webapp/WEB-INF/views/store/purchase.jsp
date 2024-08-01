<%--
  Created by IntelliJ IDEA.
  User: bitcampp
  Date: 24. 8. 1.
  Time: 오후 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body class="noto-sans-kr">
<jsp:include page="../../../nav.jsp"/>
</nav>
<header>
    <img src="image/쇼핑몰 헤더 이미지.png" alt="쇼핑몰 헤더">
</header>
<main>
    <div class="main-container">
        <div class="right-panel" id="rightPanel">
            <div class="toggle-button" id="toggleButton">
                <span class="arrow arrow-left"></span>
            </div>
            <div class="panel-content">
                <div class="panel-item">
                    <a href="https://open.kakao.com/o/sWQxdYAg">
                        <img src="image/카카오톡 상담.png" alt="카카오톡 상담">
                        <br>
                        카카오톡
                        <br>
                        상담문의
                    </a>
                </div>
                <div class="panel-item">
                    <a href="" id="mypage">
                        <img src="image/마이페이지.png" alt="마이페이지">
                        <br>
                        마이페이지
                    </a>
                    <script>
                        const mypage = document.getElementById("mypage");
                        mypage.addEventListener("click", () => {
                            if(sessionStorage.getItem("login") === null){
                                alert("로그인 후 이용해주세요.");
                                return;
                            }
                            window.location.href("식물 프로젝트/_03_마이페이지_최종+재형님.html");
                            return;
                        });
                    </script>
                </div>
                <div class="panel-item">
                    <a href="">
                        <img src="image/장바구니.png" alt="장바구니">
                        <br>
                        장바구니
                    </a>
                </div>
                <div class="panel-item recent-items">
                    <button id="prevBtn" style="border: none; background-color: white;"><img src="image/좌측으로.png" alt="우측패널 좌측으로"></button>
                    <div class="recent-item-viewer" id="recentItemViewer">
                        <img src="" alt="최근 상품" id="recentItemImage">
                    </div>
                    <button id="nextBtn" style="border: none; background-color: white;"><img src="image/우측으로.png" alt="우측패널 우측으로"></button>
                </div>
                <div class="panel-item">
                    <span id="recentItemsText">최근 열람 품목</span>
                </div>
                <span><button id="topBtn" style="background-color: white; border: none; margin-left: 66px;"><img src="image/on top.png" alt="페이지 최상단으로"></button></span>
            </div>
        </div>
        <img src="image/베이직 키트.png" alt="베이직 키트 구매페이지" class="product-image" data-bs-toggle="modal" data-bs-target="#modalimg">

        <div class="product-details">

            <div class="product-title">[플랜트랩 특별전]식물나라 베이직 키트</div>
            <div class="product-rating">★★★★★ (1,114 고객 후기)</div>
            <div class="discount-container">
                <div class="discount-container">
                    <div class="discount-rate">
                        10% <span class="original-price">9,900원</span>
                    </div>
                    <div class="final-price">8,990<span class="currency">원</span></div>
                </div>

            </div>
            <div class="shipping-info">배송비: 2,500원 (25,000원 이상 무료배송)</div>
            <div class="sale-period">판매: 2024년 07월 01일 ~ 2024년 07월 31일</div>

            <div class="purchase-info">
                <div class="quantity_button">
                    <label for="quantity">수량: </label>
                    <input type="number" id="quantity" name="quantity" value="1" min="1" onchange="updatePrices()">
                </div>
                <p class="total-price"><span style="font-size: 30px;" id="calculated-price">8,990</span>원</p>
            </div>

            <div class="button-container">
                <button type="button" id="buyNowButton">바로 구매</button>
                <button type="button" id="addToCartButton">장바구니</button>
            </div>
        </div>

        <div class="modal fade" id="modalimg">
            <div class="modal-dialog">
                <div class="modal-content">
                    <img src="image/베이직 키트.png" alt="" class="modalimg">
                </div>
            </div>
        </div>

        <div class="tab-buttons">
            <button class="tab-link active" data-tab="details">상세정보</button>
            <button class="tab-link" data-tab="review">리뷰</button>
            <button class="tab-link" data-tab="qna">Q&A</button>
        </div>

        <div id="details" class="tab-content active">
            <!-- 상세정보 내용 -->
            <div class="purchase_introduce">
                <img src="image/구매페이지1.png" alt="구매페이지 상세정보">
                <img src="image/구매페이지2.png" alt="구매페이지 상세정보">
                <img src="image/구매페이지3.png" alt="구매페이지 상세정보">
                <img src="image/구매페이지4.png" alt="구매페이지 상세정보">
                <img src="image/구매페이지5.png" alt="구매페이지 상세정보">
                <img src="image/구매페이지6.png" alt="구매페이지 상세정보">
            </div>

            <div id="review" class="tab-content">
                <!-- 리뷰 내용 -->
            </div>
            <div id="qna" class="tab-content">
                <!-- Q&A 내용 -->
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const tabLinks = document.querySelectorAll('.tab-link');
            const tabContents = document.querySelectorAll('.tab-content');

            tabLinks.forEach(link => {
                link.addEventListener('click', () => {
                    // 모든 탭 링크에서 active 클래스 제거
                    tabLinks.forEach(link => link.classList.remove('active'));
                    // 클릭한 탭 링크에 active 클래스 추가
                    link.classList.add('active');

                    // 모든 탭 콘텐츠 숨기기
                    tabContents.forEach(content => content.classList.remove('active'));
                    // 클릭한 탭에 맞는 콘텐츠 보여주기
                    const tabId = link.getAttribute('data-tab');
                    document.getElementById(tabId).classList.add('active');
                });
            });
        });

        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('toggleButton').addEventListener('click', function() {
                var panel = document.getElementById('rightPanel');
                panel.classList.toggle('open');
                var arrows = document.querySelectorAll('.toggle-button .arrow');
                arrows.forEach(arrow => arrow.classList.toggle('open'));
            });

            function updateRecentItemViewer() {
                const viewer = document.getElementById('recentItemImage');
                if (recentItems.length > 0) {
                    viewer.src = recentItems[currentIndex];
                } else {
                    viewer.src = 'https://via.placeholder.com/30';
                }
            }

            let recentItems = [];
            let currentIndex = 0;

            document.getElementById('prevBtn').addEventListener('click', function() {
                if (recentItems.length > 0) {
                    currentIndex = (currentIndex - 1 + recentItems.length) % recentItems.length;
                    updateRecentItemViewer();
                }
            });

            document.getElementById('nextBtn').addEventListener('click', function() {
                if (recentItems.length > 0) {
                    currentIndex = (currentIndex + 1) % recentItems.length;
                    updateRecentItemViewer();
                }
            });

            document.getElementById('topBtn').addEventListener('click', function() {
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            });

            updateRecentItemViewer(); // 초기 업데이트
        });

        function updatePrices() {
            const quantity = document.getElementById('quantity').value;
            const originalPrice = 9900;
            const discountRate = 0.1;
            const discountedPrice = originalPrice - (originalPrice * discountRate);
            const totalPrice = discountedPrice * quantity;
            const finalTotalPrice = totalPrice >= 25000 ? totalPrice : totalPrice + 2500;

            document.getElementById('calculated-price').textContent = totalPrice.toLocaleString();
            document.querySelector('.final-price').textContent = discountedPrice.toLocaleString();
            document.querySelector('.total-price span').textContent = finalTotalPrice.toLocaleString();
        }

        document.addEventListener('DOMContentLoaded', updatePrices);

        document.getElementById('buyNowButton').addEventListener('click', function() {
            const quantity = document.getElementById('quantity').value;
            alert(quantity + '개 주문완료 되었습니다.');
        });

        document.getElementById('addToCartButton').addEventListener('click', function() {
            const quantity = document.getElementById('quantity').value;
            alert(quantity + '개 장바구니에 담았습니다.');
        });

    </script>
</main>
<div id="popup-icon1">
    <img src="image/챗봇아이콘.png" alt="Popup Icon" id="popup-image" style="width: 60px; height: 60px;">
</div>
<div id="popup-content1" class="hidden">
    <p>안녕하세요! 플랜트 봇 입니다!<br>궁금한 것은 모두 플랜트 봇에게 물어보세요!</p>
</div>
<div id="popup-icon2">
    <img src="image/top아이콘.png" alt="Popup Icon" id="popup-image" style="width: 60px; height: 60px;">
</div>
<jsp:include page="../../../footer.jsp"/>
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
