<%-- 
<%@page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Date" %>
<html>
<head>
	<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<title>Welcome</title>
	<style>
        .login-register-links {
            margin-right: 20px;
        }
    </style>
</head>
<body>
	<jsp:include page="../frame/menu.jsp" />
	<div class="text-right login-register-links"> 
			<a href="login.jsp" >로그인</a> | <a href="register.jsp" >회원가입</a>
	</div>

</body>
</html>
--%>

<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>Welcome</title>
    <style>
        .login-register-links {
            margin-right: 30px;
        }
        .banner {
            height: 300px; /* 배너의 높이 조절 */
            background: url('your_banner_image.jpg') center/cover; /* 배너 이미지 설정 */
            color: black; /* 배너 텍스트 색상 설정 */
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .product-section {
            padding: 20px;
        }
        .product-item {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <jsp:include page="../frame/menu.jsp" />
    
    <div class="text-right login-register-links"> 
			<a href="login.jsp" >로그인</a> | <a href="register.jsp" >회원가입</a>
	</div>

    <!-- 배너 섹션 -->
    <div class="banner">
        <h1>배너 내용</h1>
    </div>

    <!-- 추천 상품 섹션 -->
    <div class="container product-section">
        <h2>추천 상품</h2>
        <div class="row">
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

</body>
</html>
