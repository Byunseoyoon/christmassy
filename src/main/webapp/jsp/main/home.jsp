<%@ page contentType="text/html; charset=utf-8" %>

<html>
<jsp:include page="../frame/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	@font-face {
        font-family: 'JollyLodger-Regular'; /* 사용하고자 하는 글꼴 이름 */
        src: url('../../resources/font/JollyLodger-Regular.ttf') format('truetype'); /* 글꼴 파일 경로 및 형식 */
    }
    .mb-4 {
        font-family: 'JollyLodger-Regular', sans-serif; 
        color: #115A5B; 
        font-size: 80px;
		margin-top: 50px;
    }   
    .login-register-links {
        margin-right: 30px;
    }
   	.banner {
	    text-align: center;
	    align-items: center;
	    justify-content: center;
	    position: relative;
	    overflow: hidden;
	    width: 100%;
	    height: 0;
	    padding-bottom: 47.27%;
	    background-size: cover;
	    background-position: center;
	    background-repeat: no-repeat;
	}
    .banner-img {
	    text-align: center;
	    align-items: center;
	    justify-content: center;
	    position: relative;
	    overflow: hidden;
	    width: 100%;
	    height: 0;
	    padding-bottom: 47.27%;
	    background-image: url('../../resources/images/main.gif');
	    background-size: cover;
	    background-position: center;
	    background-repeat: no-repeat;
	    opacity: 0.6;
    }

    .banner-text h2 {
        position: absolute;
        font-size: 60px;
        font-weight: bold;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
        opacity: 1; /* 이미지에 투명도 적용 */
    }
    
    .col-md-12.text-right a {
        color: inherit; /* 링크의 기본 색상을 상속받음 */
        text-decoration: none; /* 밑줄 제거 */
    }
	.recommend-section {
        text-align: center;
        max-width: 1200px;
        margin: 0 auto; /* 가운데 정렬을 위한 스타일 */
    }
    .category-container {
    	text-align: right;
    	margin-bottom: 30px;
    }
    .category {
    	color: #115A5B; 
        text-align: right;
        cursor: pointer;
        margin-left: 5px;
        margin-right: 5px;
        font-weight: bold;
    }
    .line {
      width: 1400px;
      height: 1px;
      background-color: #ccc; /* 연한 회색으로 지정 (#ccc는 회색을 나타내는 색상 코드입니다.) */
      margin: 80px 80px;
    }
    .category-section {
    	text-align: center;
        max-width: 900px;
        margin: 0 auto; /* 가운데 정렬을 위한 스타일 */
    }
    .category-section img {
    	border-radius: 20px;
    	box-shadow: 0 4px 8px rrgba(17, 90, 91, 0.5) /* 그림자 효과 추가 */
    }
    .product {
        display: flex;
        justify-content: space-around;
    }	
    .category-section .box-text {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    text-align: center;
	    width: 100%;
	    color: #fff; /* 텍스트 색상 설정 */
	}
	
	.category-section .box-text h3 {
	    font-size: 50px;
	    margin: 0;
	    -webkit-text-stroke: 1px #115A5B; /* 크로스 브라우징을 위해 -webkit- 접두어 사용 */
	    text-stroke: 1px #115A5B;
	    text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.9);
	}

</style>

<script>
	$(document).ready(function() {
	    $(".category").click(function() {
	        var category = $(this).text().trim(); // 선택한 카테고리 텍스트 가져오기
	        loadProducts(category);
	    });
	
	    // 페이지 로드 시 기본 카테고리 로딩
	    loadProducts("크리스마스"); // 예시로 "크리스마스"로 시작
	});
	
	function loadProducts(category) {
	    $.ajax({
	        type: "POST",
	        url: "loadProducts.jsp", // 서버 측 로직이 있는 JSP 파일 경로
	        data: { category: category },
	        success: function(data) {
	            $(".product").html(data); // 서버에서 받은 HTML을 product 영역에 삽입
	        },
	        error: function(xhr, status, error) {
	            console.error("Error loading products: " + error);
	        }
	    });
	}
    function redirect() {
        var pageURL = 'register.jsp';
        window.location.href = pageURL;
    }
</script>
<body>
    <jsp:include page="../frame/menu.jsp" />


    <!-- 배너 섹션 -->
    <div class="banner">
    	<div class="banner-img">
        </div>
    	<div class="banner-text">
	        <h2>Merry Christmas and <br> Happy New Year!</h2>
	    </div>
    </div>


    <!-- 추천 상품 섹션 -->
    <div class="recommend-section">
	    <h2 class="mb-4 text-center">Hot Item</h2>
	
	   	<div class="category-container text-right">
	        <p>
	            <span class="category" id="christmas">크리스마스</span> |
	            <span class="category" id="party">파티용품</span> |
	            <span class="category" id="clothing">의류</span> |
	            <span class="category" id="etc">기타</span>
	        </p>
	    </div>
	
	    <div class="product">
	        <%-- 초기 로딩 시 상품이 여기에 나타납니다. --%>
	    </div>
	</div>
	
	<div class="line"></div>
    
    <div class="category-section">
	    <h2 class="mb-4 text-center">Categories</h2>
	    <div class="row">
	        <div class="col-md-6 text-center mb-4">
		        <a href="../category/categoryDetail.jsp?category=크리스마스&categoryDetail=트리">
		            <img src="../../resources/images/tree1.png" width="300" height="300">
		        </a>
		        <div class="box-text">
			        <h3>Christmass</h3>
			    </div>
		    </div>

	        <div class="col-md-6 text-center mb-4">
	            <a href="../category/categoryDetail.jsp?category=파티용품&categoryDetail=코스튬">
		            <img src="../../resources/images/main_party.png" width="300" height="300">
		        </a>
			    <div class="box-text">
			        <h3>Party</h3>
			    </div>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-6 text-center mb-4">
			    <a href="../category/categoryDetail.jsp?category=의류&categoryDetail=옷">
		            <img src="../../resources/images/main_cloth.png" width="300" height="300">
		        </a>
			    <div class="box-text">
			        <h3>Cloth</h3>
			    </div>
	        </div>
	        <div class="col-md-6 text-center mb-4">
	            <a href="../category/categoryDetail.jsp?category=기타&categoryDetail=포장">
		            <img src="../../resources/images/main_acc.png" width="300" height="300">
		        </a>
			    <div class="box-text">
			        <h3>Acc</h3>
			    </div>
	        </div>
	    </div>
	</div>

    
    <jsp:include page="../frame/footer.jsp" />
</body>
</html>
