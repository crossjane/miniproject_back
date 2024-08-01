<%--
  Created by IntelliJ IDEA.
  User: bitcampp
  Date: 24. 8. 1.
  Time: 오후 12:24
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>플랜트랩_쇼핑몰</title>
    <link rel="stylesheet" href="/static/css/store.css">
    <!--bootstrap-->
</head>
<body class="noto-sans-kr">
<jsp:include page="../../../nav.jsp"/>
<header>
    <img src="image/쇼핑몰 헤더 이미지.png" alt="쇼핑몰 헤더">
</header>
<main>
    <div class="right-panel" id="rightPanel">
        <div class="toggle-button" id="toggleButton">
            <span class="arrow arrow-left"></span>
        </div>
        <div class="panel-content">
            <div class="panel-item">
                <div class="">
                    <a href="">
                        <img src="image/카카오톡 상담.png" alt="카카오톡 상담">
                        <br>
                        카카오톡
                        <br>
                        상담문의
                    </a>
                </div>
            </div>
            <div class="panel-item">
                <a href="">
                    <img src="image/마이페이지.png" alt="마이페이지">
                    <br>
                    마이페이지
                </a>
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
    <div class="overall_container">
        <div class="selector">
            <ul class="selector_group">
                <li class="item" id="item1" onclick="toggleAct(this)">#식물키트</li>
                <li class="item" id="item2" onclick="toggleAct(this)">#공기정화</li>
                <li class="item" id="item3" onclick="toggleAct(this)">#사무실</li>
                <li class="item" id="item3" onclick="toggleAct(this)">#인테리어</li>
                <li class="item" id="item3" onclick="toggleAct(this)">#간단식용</li>
                <li class="item" id="item3" onclick="toggleAct(this)">#미니식물</li>
            </ul>
        </div>
        <div class="sort_box">
            <div>
                <div class="color-container">
                    <span style="font-weight: bold; margin-right: 20px; margin-left: 20px; font-size: 20px;">색상</span>
                    <button class="circle" data-color="빨강" style="background-color: red;"></button>
                    <button class="circle" data-color="주황" style="background-color: orange;"></button>
                    <button class="circle" data-color="노랑" style="background-color: yellow;"></button>
                    <button class="circle" data-color="초록" style="background-color: green;"></button>
                    <button class="circle" data-color="파랑" style="background-color: blue;"></button>
                    <button class="circle" data-color="보라" style="background-color: indigo;"></button>
                    <button class="circle" data-color="분홍" style="background-color: violet;"></button>
                </div>
                <div class="sort_set">
                    <span style="font-weight: bold; margin-right: 40px;">꽃 / 열매 유무</span>
                    <label><input type="checkbox" name="flower" value="꽃"><span class="filter-text">꽃</span></label>
                    <label><input type="checkbox" name="fruit" value="열매"><span class="filter-text">열매</span></label>
                </div>
                <div class="sort_set">
                    <span style="font-weight: bold; margin-right: 40px;">채광 유무</span>
                    <label><input type="checkbox" name="light_mining" value="off"><span class="filter-text">음지(빛없는 실내)</span></label>
                    <label><input type="checkbox" name="light_mining" value="on"><span class="filter-text">양지(빛이 많은곳)</span></label>
                </div>
                <div class="sort_set">
                    <span style="font-weight: bold; margin-right: 40px;">원예 형태</span>
                    <label><input type="checkbox" name="horticultural_form" value="화분"><span class="filter-text">화분</span></label>
                    <label><input type="checkbox" name="horticultural_form" value="꽃병"><span class="filter-text">꽃병</span></label>
                    <label><input type="checkbox" name="horticultural_form" value="바구니"><span class="filter-text">바구니</span></label>
                </div>
                <div class="sort_set">
                    <span style="font-weight: bold; margin-right: 40px;">사이즈</span>
                    <label><input type="checkbox" name="size" value="마당용"><span class="filter-text">마당용</span></label>
                    <label><input type="checkbox" name="size" value="실내용"><span class="filter-text">실내용</span></label>
                    <label><input type="checkbox" name="size" value="탁상용"><span class="filter-text">탁상용(미니)</span></label>
                </div>
                <div class="sort_set">
                    <span style="font-weight: bold; margin-right: 40px;">할인 유무</span>
                    <label><input type="checkbox" id="sale" name="sale" value="on"><span class="filter-text">할인적용 상품</span></label>
                </div>
            </div>
        </div>
        <div class="goods_object" style="margin-bottom: 3rem;">
            <div class="entire_goods">
                <div class="dropdown1">
                    <button class="dropdown-btn" onclick="toggleDropdown()">정렬기준 ▼</button>
                    <ul class="dropdown-menu">
                        <li data-sort="rating">평점순</li>
                        <li data-sort="price-asc">가격낮은순</li>
                        <li data-sort="price-desc">가격높은순</li>
                        <li data-sort="views">조회순</li>
                    </ul>
                </div>
            </div>
            <h1 style="display: inline; margin-right: 5px;">식물 상품</h1>
            <p style="display: inline; font-size: 25px;">나에게 맞는 식물친구들을 찾아보세요</p>
        </div>
        <div id="product-container" class="product_container">
            <div class="product_row">
                <div class="product_item" data-category="식물키트" data-color="초록" data-rating="4.8" data-light_mining="on" data-horticultural_form="화분" data-size="탁상용" data-sale="on" data-fruit="">
                    <a href="/products/purchase.do">
                        <img src="image/베이직 키트.png" alt="물품 이미지">
                        <div class="goods_border">
                            <p class="product_title">식물나라 베이직 키트</p>
                            <p class="product_company">식물나라</p>
                            <p class="product_price">9,900 원</p>
                            <p class="product_rating">평점: 4.8</p>
                        </div>
                    </a>
                </div>
                <div class="product_item" data-category="공기정화" data-color="초록" data-rating="4.9" data-light_mining="off" data-horticultural_form="화분" data-size="실내용" data-sale="on" data-fruit="꽃">
                    <a href="product-page.html">
                        <img src="image/11.몬스테라.jpg" alt="물품 이미지">
                        <div class="goods_border">
                            <p class="product_title">몬스테라</p>
                            <p class="product_company">식물나라</p>
                            <p class="product_price">122,000 원</p>
                            <p class="product_rating">평점: 4.9</p>
                        </div>
                    </a>
                </div>
                <div class="product_item" data-category="사무실" data-color="보라" data-rating="4.9" data-light_mining="on" data-horticultural_form="바구니" data-size="화분" data-sale="on" data-fruit="꽃">
                    <a href="product-page.html">
                        <img src="image/12.샤프란.jpg" alt="물품 이미지">
                        <div class="goods_border">
                            <p class="product_title">샤프란</p>
                            <p class="product_company">식물나라</p>
                            <p class="product_price">130,000 원</p>
                            <p class="product_rating">평점: 4.9</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="product_row">
                <div class="product_item" data-category="인테리어" data-color="" data-rating="5.0" data-light_mining="on" data-horticultural_form="화분" data-size="마당용" data-sale="on" data-fruit="꽃">
                    <a href="purchase.html">
                        <img src="image/10.카두풀 꽃.jpg" alt="물품 이미지">
                        <div class="goods_border">
                            <p class="product_title">카두풀 꽃</p>
                            <p class="product_company">식물나라</p>
                            <p class="product_price">59,900 원</p>
                            <p class="product_rating">평점: 5.0</p>
                        </div>
                    </a>
                </div>
                <div class="product_item" data-category="식물키트" data-color="초록" data-rating="4.8" data-light_mining="on" data-horticultural_form="화분" data-size="탁상용" data-sale="on" data-fruit="">
                    <a href="purchase.html">
                        <img src="image/베이직 키트.png" alt="물품 이미지">
                        <div class="goods_border">
                            <p class="product_title">식물나라 베이직 키트</p>
                            <p class="product_company">식물나라</p>
                            <p class="product_price">9,900 원</p>
                            <p class="product_rating">평점: 4.8</p>
                        </div>
                    </a>
                </div>
                <div class="product_item" data-category="인테리어" data-color="파랑" data-rating="4.7" data-light_mining="on" data-horticultural_form="꽃병" data-size="실내용" data-sale="off" data-fruit="꽃">
                    <a href="product-page.html">
                        <img src="image/8-블루 데이지.png" alt="물품 이미지">
                        <div class="goods_border">
                            <p class="product_title">블루 데이지</p>
                            <p class="product_company">식물나라</p>
                            <p class="product_price">22,000 원</p>
                            <p class="product_rating">평점: 4.7</p>
                        </div>
                    </a>
                </div>
                <div class="product_item" data-category="사무실" data-color="빨강" data-rating="4.0" data-light_mining="on" data-horticultural_form="바구니" data-size="탁상용" data-sale="on" data-fruit="꽃">
                    <a href="product-page.html">
                        <img src="image/2-생화 카네이션 꽃바구니.jpg" alt="물품 이미지">
                        <div class="goods_border">
                            <p class="product_title">선물용 카네이션 & 꽃바구니</p>
                            <p class="product_company">식물나라</p>
                            <p class="product_price">30,000 원</p>
                            <p class="product_rating">평점: 4.0</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="product_row">
                <div class="product_item" data-category="공기정화" data-color="노랑" data-rating="4.6" data-light_mining="off" data-horticultural_form="꽃병" data-size="실내용" data-sale="off" data-fruit="꽃">
                    <a href="product-page.html">
                        <img src="image/4-노란색 구즈마니아.png" alt="물품 이미지">
                        <div class="goods_border">
                            <p class="product_title">구즈마니아</p>
                            <p class="product_company">식물나라</p>
                            <p class="product_price">27,000 원</p>
                            <p class="product_rating">평점: 4.6</p>
                        </div>
                    </a>
                </div>
                <div class="product_item" data-category="사무실" data-color="주황" data-rating="4.1" data-light_mining="on" data-horticultural_form="꽃병" data-size="탁상용" data-sale="off" data-fruit="꽃">
                    <a href="product-page.html">
                        <img src="image/5-주황장미.png" alt="물품 이미지">
                        <div class="goods_border">
                            <p class="product_title">주황장미</p>
                            <p class="product_company">식물나라</p>
                            <p class="product_price">14,500 원</p>
                            <p class="product_rating">평점: 4.1</p>
                        </div>
                    </a>
                </div>
                <div class="product_item" data-category="공기정화" data-color="초록" data-rating="4.5" data-light_mining="off" data-horticultural_form="화분" data-size="실내용" data-sale="off" data-fruit="">
                    <a href="product-page.html">
                        <img src="image/6-실내 음지 더피고사리.jpg" alt="물품 이미지">
                        <div class="goods_border">
                            <p class="product_title">더피고사리</p>
                            <p class="product_company">식물나라</p>
                            <p class="product_price">22,500 원</p>
                            <p class="product_rating">평점: 4.5</p>
                        </div>
                    </a>
                </div>
            </div>

            <div class="product_row">
                <div class="product_item" data-category="미니식물" data-color="분홍" data-rating="4.4" data-light_mining="on" data-horticultural_form="꽃병" data-size="탁상용" data-sale="off" data-fruit="꽃">
                    <a href="product-page.html">
                        <img src="image/7-취설송 다육이 핑크선인장.png" alt="물품 이미지">
                        <div class="goods_border">
                            <p class="product_title">취설송 다육이 핑크선인장</p>
                            <p class="product_company">식물나라</p>
                            <p class="product_price">24,000 원</p>
                            <p class="product_rating">평점: 4.4</p>
                        </div>
                    </a>
                </div>
                <div class="product_item" data-category="간단식용" data-color="빨강" data-rating="3.8" data-light_mining="on" data-horticultural_form="화분" data-size="마당용" data-sale="off" data-fruit="열매">
                    <a href="product-page.html">
                        <img src="image/3-tomato.png" alt="물품 이미지">
                        <div class="goods_border">
                            <p class="product_title">토마토 키우기 세트</p>
                            <p class="product_company">식물나라</p>
                            <p class="product_price">12,000 원</p>
                            <p class="product_rating">평점: 3.8</p>
                        </div>
                    </a>
                </div>
                <div class="product_item" data-category="인테리어" data-color="보라" data-rating="4.0" data-light_mining="on" data-horticultural_form="화분" data-size="마당용" data-sale="off" data-fruit="꽃">
                    <a href="product-page.html">
                        <img src="image/9 - 보라 마당식물 장미칼파눌라(신종보라겹꽃).jpg" alt="물품 이미지">
                        <div class="goods_border">
                            <p class="product_title">신종보라겹꽃</p>
                            <p class="product_company">식물나라</p>
                            <p class="product_price">38,500 원</p>
                            <p class="product_rating">평점: 4.0</p>
                        </div>
                    </a>
                </div>
            </div>
            <jsp:include page="../../../footer.jsp"/>
            <script>
                const selector = document.querySelector('.selector');
                const items = selector.querySelectorAll('.item');
                const circles = document.querySelectorAll('.circle');
                let recentItems = [];
                let currentIndex = 0;

                function toggleAct(item){
                    item.classList.toggle('act');

                }

                circles.forEach(circle => {
                    circle.addEventListener('click', () => {
                        circle.classList.toggle("selected");
                    });
                });


                // document.getElementById('toggleButton').addEventListener('click', function() {
                //       var panel = document.getElementById('rightPanel');
                //       panel.classList.toggle('open');
                //       var arrows = document.querySelectorAll('.toggle-button .arrow');
                //       arrows.forEach(arrow => arrow.classList.toggle('open'));
                //   });

                function updateRecentItemViewer() {
                    const viewer = document.getElementById('recentItemImage');
                    if (recentItems.length > 0) {
                        viewer.src = recentItems[currentIndex];
                    } else {
                        viewer.src = 'https://via.placeholder.com/30';
                    }
                }

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

                function toggleDropdown() {
                    var menu = document.querySelector('.dropdown1 .dropdown-menu');
                    if (menu.style.display === 'block') {
                        menu.style.display = 'none';
                    } else {
                        menu.style.display = 'block';
                    }
                }

                window.onclick = function(event) {
                    if (!event.target.matches('.dropdown-btn')) {
                        var dropdowns = document.getElementsByClassName("dropdown-menu");
                        for (var i = 0; i < dropdowns.length; i++) {
                            var openDropdown = dropdowns[i];
                            if (openDropdown.style.display === 'block') {
                                openDropdown.style.display = 'none';
                            }
                        }
                    }
                }

                document.getElementById('topBtn').addEventListener('click', function() {
                    window.scrollTo({
                        top: 0,
                        behavior: 'smooth'
                    });
                }); // 페이지 최상단으로(on top)

                // 예시: 상품을 클릭했을 때 recentItems에 추가하는 함수
                function addRecentItem(itemSrc) {
                    if (!recentItems.includes(itemSrc)) {
                        recentItems.push(itemSrc);
                        currentIndex = recentItems.length - 1;
                        updateRecentItemViewer();
                    }
                }

                // 예시: 페이지에 있는 상품을 클릭하면 recentItems에 추가
                // 실제 구현 시 상품 리스트에 맞게 수정 필요
                document.querySelectorAll('.product').forEach(product => {
                    product.addEventListener('click', function() {
                        addRecentItem(this.src);
                    });
                });

                updateRecentItemViewer(); // 초기 업데이트
            </script>
        </div>
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
    <div class="f_container">
        <div style="margin: auto 50px;">
            <!-- <img width="150px" height="150px" src="image/round_logo_colorBack.svg" alt="플랜트팜 로고"> -->

        </div>
        </a>
    </div>

    </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const products = document.querySelectorAll('.product_item');
            const productContainer = document.getElementById('product-container');
            const filters = {
                category: null,
                color: null,
                rating: null,
                light_mining: [],
                horticultural_form: [],
                size: [],
                sale: null,
                flower: null,
                fruit: null,
                sort: null
            };

            function applyFilters() {
                let filteredProducts = Array.from(products);

                if (filters.category) {
                    filteredProducts = filteredProducts.filter(product => product.getAttribute('data-category') === filters.category);
                }

                if (filters.color) {
                    filteredProducts = filteredProducts.filter(product => product.getAttribute('data-color') === filters.color);
                }

                if (filters.rating) {
                    filteredProducts = filteredProducts.filter(product => parseFloat(product.getAttribute('data-rating')) >= filters.rating);
                }

                if (filters.light_mining.length > 0) {
                    filteredProducts = filteredProducts.filter(product => filters.light_mining.includes(product.getAttribute('data-light_mining')));
                }

                if (filters.horticultural_form.length > 0) {
                    filteredProducts = filteredProducts.filter(product => filters.horticultural_form.includes(product.getAttribute('data-horticultural_form')));
                }

                if (filters.size.length > 0) {
                    filteredProducts = filteredProducts.filter(product => filters.size.includes(product.getAttribute('data-size')));
                }

                if (filters.sale) {
                    filteredProducts = filteredProducts.filter(product => product.getAttribute('data-sale') === filters.sale);
                }

                if (filters.flower) {
                    filteredProducts = filteredProducts.filter(product => product.getAttribute('data-flower') === filters.flower);
                }

                if (filters.fruit) {
                    filteredProducts = filteredProducts.filter(product => product.getAttribute('data-fruit') === filters.fruit);
                }

                if (filters.sort) {
                    filteredProducts.sort((a, b) => {
                        if (filters.sort === 'rating') {
                            return parseFloat(b.getAttribute('data-rating')) - parseFloat(a.getAttribute('data-rating'));
                        } else if (filters.sort === 'price-asc') {
                            return parseFloat(a.querySelector('.product_price').textContent.replace(/[^0-9.-]+/g, "")) - parseFloat(b.querySelector('.product_price').textContent.replace(/[^0-9.-]+/g, ""));
                        } else if (filters.sort === 'price-desc') {
                            return parseFloat(b.querySelector('.product_price').textContent.replace(/[^0-9.-]+/g, "")) - parseFloat(a.querySelector('.product_price').textContent.replace(/[^0-9.-]+/g, ""));
                        }
                        return 0;
                    });
                }

                productContainer.innerHTML = '';

                filteredProducts.forEach((product, index) => {
                    if (index % 3 === 0) {
                        currentRow = document.createElement('div');
                        currentRow.classList.add('product_row');
                        productContainer.appendChild(currentRow);
                    }
                    currentRow.appendChild(product);

                    // 이미지 크기 재설정
                    const img = product.querySelector('img');
                    if (img) {
                        img.style.width = '100%';
                        img.style.height = 'auto';
                    }
                });

                // 빈 자리 채우기
                const emptyItemsToAdd = (3 - (filteredProducts.length % 3)) % 3;
                for (let i = 0; i < emptyItemsToAdd; i++) {
                    const emptyItem = document.createElement('div');
                    emptyItem.classList.add('product_item');
                    emptyItem.style.visibility = 'hidden';
                    currentRow.appendChild(emptyItem);
                }
            }

            // 필터 이벤트 리스너 설정
            document.querySelectorAll('.selector .item').forEach(item => {
                item.addEventListener('click', function() {
                    const category = item.textContent.replace('#', '');
                    filters.category = (filters.category === category) ? null : category;
                    document.querySelectorAll('.selector .item').forEach(i => i.classList.remove('act'));
                    if (filters.category) item.classList.add('act');
                    applyFilters();
                });
            });

            document.querySelectorAll('.color-container .circle').forEach(circle => {
                circle.addEventListener('click', function() {
                    filters.color = (filters.color === circle.getAttribute('data-color')) ? null : circle.getAttribute('data-color');
                    document.querySelectorAll('.color-container .circle').forEach(c => c.classList.remove('selected'));
                    if (filters.color) circle.classList.add('selected');
                    applyFilters();
                });
            });

            document.querySelectorAll('input[name="light_mining"]').forEach(input => {
                input.addEventListener('change', function(event) {
                    if (event.target.checked) {
                        filters.light_mining.push(event.target.value);
                    } else {
                        filters.light_mining = filters.light_mining.filter(value => value !== event.target.value);
                    }
                    applyFilters();
                });
            });

            document.querySelectorAll('input[name="horticultural_form"]').forEach(input => {
                input.addEventListener('change', function(event) {
                    if (event.target.checked) {
                        filters.horticultural_form.push(event.target.value);
                    } else {
                        filters.horticultural_form = filters.horticultural_form.filter(value => value !== event.target.value);
                    }
                    applyFilters();
                });
            });

            document.querySelectorAll('input[name="size"]').forEach(input => {
                input.addEventListener('change', function(event) {
                    if (event.target.checked) {
                        filters.size.push(event.target.value);
                    } else {
                        filters.size = filters.size.filter(value => value !== event.target.value);
                    }
                    applyFilters();
                });
            });

            document.querySelectorAll('input[name="sale"]').forEach(input => {
                input.addEventListener('change', function(event) {
                    filters.sale = event.target.checked ? event.target.value : null;
                    applyFilters();
                });
            });

            document.querySelectorAll('input[name="flower"]').forEach(input => {
                input.addEventListener('change', function(event) {
                    filters.flower = event.target.checked ? event.target.value : null;
                    applyFilters();
                });
            });

            document.querySelectorAll('input[name="fruit"]').forEach(input => {
                input.addEventListener('change', function(event) {
                    filters.fruit = event.target.checked ? event.target.value : null;
                    applyFilters();
                });
            });

            // document.querySelector('.dropdown1 .dropdown-btn').addEventListener('click', function() {
            //   const menu = document.querySelector('.dropdown1 .dropdown-menu');
            //   menu.style.display = (menu.style.display === 'block') ? 'none' : 'block';
            // });

            document.querySelector('.dropdown1 .dropdown-menu').addEventListener('click', function(event) {
                filters.sort = event.target.getAttribute('data-sort');
                applyFilters();
                const menu = document.querySelector('.dropdown1 .dropdown-menu');
                menu.style.display = 'none';
            });

            applyFilters();
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

    </script>
    </div>
    </main>
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

            const sale = new URLSearchParams(window.location.search).get('sale');
            const checkbox = document.querySelector("#sale");
            if (sale == 1){
                checkbox.checked = true;
            }
        });

        const sale = new URLSearchParams(window.location.search).get('sale');
        const checkbox = document.querySelector("#sale");
        if (sale == 1){
            checkbox.checked = true;
        }
    </script>
</body>
</html>