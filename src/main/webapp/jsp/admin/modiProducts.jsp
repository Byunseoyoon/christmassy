<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html>
<head>
<jsp:include page="../frame/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="../../resources/css/myPage.css">
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
	<%
	int num = 0;
	%>
	<div class="container mt-5">
		<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// JDBC 드라이버 로딩 (MySQL 드라이버)
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 데이터베이스 연결 정보 설정 (MySQL 연결 정보)
			String url = "jdbc:mysql://localhost:3306/christmassyDB?useSSL=false&serverTimezone=UTC";
			String user = "root";
			String password = "1234";

			// 데이터베이스 연결
			conn = DriverManager.getConnection(url, user, password);

			// 세션에서 userId 가져오기
			session = request.getSession();
			String loggedInUserId = (String) session.getAttribute("userId");

			// SQL 쿼리 (MySQL 쿼리)
			String qParam = request.getParameter("pidx");
			Integer pidx = Integer.parseInt(qParam);
			String sql = "SELECT * FROM products WHERE pidx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pidx);
			rs = pstmt.executeQuery();

			// 결과 처리
			if (rs.next()) {
				String pname = rs.getString("pname");
				String price = rs.getString("price");
				String descriptor = rs.getString("descriptor");
				String category = rs.getString("category");
				String categoryDetail = rs.getString("categoryDetail");
				String image = rs.getString("image");
				String stock = rs.getString("stock");
				String flag = rs.getString("flag");
		%>
		<form action="updateProduct.jsp" method="post">
			<input name="pidx" type="hidden" class="form-item" value="<%=pidx%>" />
			<div>
				<div class="form-group row">
					<label class="col-sm-2">상품명</label>
					<div class="col-sm-3">
						<input name="pname" type="text" class="form-item" value="<%=pname%>" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">price</label>
					<div class="col-sm-3">
						<input name="price" type="text" class="form-item" value="<%=price%>" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">category</label>
					<div class="col-sm-3">
						<input name="category" type="text" class="form-item" value="<%=category%>" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">categoryDetail</label>
					<div class="col-sm-3">
						<input name="categoryDetail" type="text" class="form-item" value="<%=categoryDetail%>" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">stock</label>
					<div class="col-sm-3">
						<input name="stock" type="text" class="form-item" value="<%=stock%>" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">flag</label>
					<div class="col-sm-3">
						<input name="flag" type="text" class="form-item" value="<%=flag%>" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">descriptor</label>
					<div class="col-sm-3">
						<textarea class="form-item" id="descriptor" name="descriptor" rows="4" required><%=descriptor%></textarea>
					</div>
				</div>
				<div class="form-group row">
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
				</div>
				<div class="form-group row">
					<button type="submit" class="btn btn-buy">수정하기</button>
					<a href="adminProducts.jsp"  style="color:rgba(25, 79, 53, 0.75); background-color:white;" class="btn" >목록가기</a>
				</div>
			</div>
		</form>
		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		// 자원 해제
		if (rs != null)
		try {
			rs.close();
		} catch (Exception e) {
		}
		if (pstmt != null)
		try {
			pstmt.close();
		} catch (Exception e) {
		}
		if (conn != null)
		try {
			conn.close();
		} catch (Exception e) {
		}
		}
		%>
	</div>
</body>
</html>