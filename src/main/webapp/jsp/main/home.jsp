<%@ page contentType="text/html; charset=utf-8" %>

<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
    .login-register-links {
        margin-right: 30px;
    }
	 
   	.banner {
        height: 300px;
        color: black;
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
        width: 100%;
        overflow: hidden;
    }

    .banner img {
        width: 100%;
        height: auto;
		object-fit: cover;
    }

    .product-section {
        padding: 20px;
        text-align: center;
        margin-top: 20px;
    }
   	
    .product-item {
    	margin-top : 20px;
        margin-bottom: 30px;
    }
    
    .category-info {
        text-align: center;
        margin-top: 20px;
    }
    


</style>
<body>
    <jsp:include page="../frame/menu.jsp" />


    <!-- 배너 섹션 -->
    <div class="banner">
        <img src="../../resources/images/main.gif">
    </div>


    <!-- 추천 상품 섹션 -->
    <div class="container product-section">
        <h2 class="mb-4">Hot Item</h2>
        <div class="row">
            <div class="col-md-12 text-right">
                <p>크리스마스 | 파티 | 의류 | 기타</p>
            </div>
            <!-- 상품 아이템 예제 -->
            <div class="col-md-4 product-item">
                <img src="product_image1.jpg" alt="Product 1">
                <h4>상품 제목 1</h4>
                <p>상품 설명이나 추가 정보를 여기에 추가하세요.</p>
            </div>

            <div class="col-md-4 product-item">
                <img src="product_image2.jpg" alt="Product 2">
                <h4>상품 제목 2</h4>
                <p>상품 설명이나 추가 정보를 여기에 추가하세요.</p>
            </div>

            <div class="col-md-4 product-item">
                <img src="product_image3.jpg" alt="Product 3">
                <h4>상품 제목 3</h4>
                <p>상품 설명이나 추가 정보를 여기에 추가하세요.</p>
            </div>
        </div>
    </div>

    <!-- 카테고리 메뉴 섹션 -->
    <div class="category-info">
        <h2 class="mb-4">Categories</h2>
        <div class="row">
            <div class="col-md-6">
                <img src="category_image1.jpg" alt="Category 1">
                <h4>크리스마스</h4>
            </div>

            <div class="col-md-6">
                <img src="category_image2.jpg" alt="Category 2">
                <h4>파티용품</h4>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-6">
                <img src="category_image3.jpg" alt="Category 3">
                <h4>의류</h4>
            </div>

            <div class="col-md-6">
                <img src="category_image4.jpg" alt="Category 4">
                <h4>기타</h4>
            </div>
        </div>
    </div>
</body>
</html>
