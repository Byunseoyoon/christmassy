<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html>
<head>
<jsp:include page="../frame/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"	href="../../resources/css/myPage.css">
<script type ="text/javascript" src ="validation.js"></script>
<style>
.title {
	margin-top: 100;
	background-color: rgba(255, 255, 255, 0);
	border: none;
	color: #115A5B;
	font-size: 30px;
	font-weight: bolder;
}

.date {
	background-color: rgba(255, 255, 255, 0);
	border: none;
	color: #115A5B;
	font-weight: bolder;
}

.answer {
	background: rgba(17, 90, 91, 0.3);
	color: black;
	padding: 20px;
	width: 600px;
	height: 150px;
	font-weight: bolder;
	display: inline-block;
}

.content-and-pic {
	display: flex;
	align-items: flex-start; /* 수직 정렬을 위해 flex-start 사용 */
	gap: 20px; /* 콘텐츠와 이미지 사이의 간격 설정 */
}

.content {
	background: rgba(17, 90, 91, 0.3);
	color: black;
	padding: 20px;
	width: 600px;
	height: 300px;
	font-weight: bolder;
}

.pic {
	text-align: center;
}

.pic img {
	max-width: 300px;
	max-height: 300px;
	width: auto;
	height: auto;
	display: block;
	margin: auto;
}

.gradient {
	background: #115A5B;
	margin-right: 100;
	width: 80px;
	height: 30px;
	font-weight: 900;
	color: white;
	text-align: center;
	background: linear-gradient(to bottom, #115A5B, #115A5B);
	background-color: rgba(255, 255, 255, 0);
	border: solid 2px white;
	border-radius: 5px;
}

.btn {
	margin-top: 20px;
	margin-botton: 40px;
	margin-left: 500px;
}

.answer {
	background-color: rgba(17, 90, 91, 0.3);
	margin-top: 10px;
	height: 150px;
	width: 600px;
	color: black;
}

.answer textarea {
	background-color: rgba(0, 0, 0, 0);
	width: 100%;
	height: 100%;
	border: none;
	outline: none;
}

.answer textarea:focus {
	box-shadow: none;
}
</style>
</head>
<body>
	<jsp:include page="../frame/adminMenu.jsp" />
	<div class="container mt-5">
		<form action="processAddProduct.jsp" method="post">
			<input name="pidx" type="hidden" class="form-item" />
			<div>
				<div class="form-group row">
					<label class="col-sm-2">상품명</label>
					<div class="col-sm-3">
						<input name="pname" id="pname" type="text" class="form-item" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">price</label>
					<div class="col-sm-3">
						<input name="price" id="price"  type="text" class="form-item" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">category</label>
					<div class="col-sm-3">
						<input name="category" id="category"  type="text" class="form-item"  />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">categoryDetail</label>
					<div class="col-sm-3">
						<input name="categoryDetail" id="categoryDetail" type="text" class="form-item" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">stock</label>
					<div class="col-sm-3">
						<input name="stock" id="stock"  type="text" class="form-item" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">descriptor</label>
					<div class="col-sm-3">
						<textarea class="form-item" id="descriptor" name="descriptor" rows="4" required></textarea>
					</div>
				</div>
				<%-- <div class="form-group row">
					<label class="col-sm-2">image</label>
					<div class="col-sm-3">
						<% if (image != null && !image.isEmpty()) {	%>
						<span class="pic"> 
							<img src="<%="../../resources/images/" + image%>" alt="사진">
						</span>
						<%
						}
						%>
					</div>
				</div> --%>
				<div class="form-group row">
					<button type="submit" class="btn btn-buy" onClick="CheckAddProduct()">추가하기</button>
					<a href="adminProducts.jsp"  style="color:rgba(25, 79, 53, 0.75); background-color:white;" class="btn" >목록가기</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>