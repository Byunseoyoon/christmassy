<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%!//변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Integer mIdx = null;
	Timestamp timestamp = null;

	// 데이터베이스 연결 정보 설정 (MySQL 연결 정보)
	String url = "jdbc:mysql://localhost:3306/christmassyDB?useSSL=false&serverTimezone=UTC";
	String user = "root";
	String password = "1234";%>
<html>
<head>
<jsp:include page="../frame/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../../resources/css/myPage.css"> <!-- Include the CSS file -->
<style>


/*  */
img {
	width: 150px;
	height: 150px;
	overfit: contain;
	margin-bottom: 50px;
}
</style>
</head>
<body>
	<%
	try {
		// JDBC 드라이버 로딩 (MySQL 드라이버)
		Class.forName("com.mysql.cj.jdbc.Driver");

		// 데이터베이스 연결
		conn = DriverManager.getConnection(url, user, password);

		// 세션에서 userId 가져오기
		session = request.getSession();
		String loggedInUserId = (String) session.getAttribute("userMidx");
		
		if(loggedInUserId==null){
			response.sendRedirect("../main/login.jsp");
		}

		// SQL 쿼리 (MySQL 쿼리)
		mIdx = Integer.parseInt(loggedInUserId);
		String sql = "SELECT * FROM members WHERE midx = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mIdx);
		
		// 쿼리 실행
		rs = pstmt.executeQuery();
		

		if (rs.next()) {
			timestamp = rs.getTimestamp("mdate");
		} else {
			out.println("데이터가 없습니다.");
		}
	%>
	<jsp:include page="../frame/menu.jsp" />
	<jsp:include page="../frame/myPageMenu.jsp" />
	<div class="main-box">
		<div class="mypage-container">
			<div class="box-title">회원정보</div>
			<div class="box-title">
				<img src="../../resources/images/profile.png" alt="profile">
			</div>
			<div class="box">
				<div class=" box-item">
					이름   :
					<div class="item"><%=rs.getString("name")%></div>
				</div>
			</div>
			<div class="box">
				<div class="box-item">
					아이디 :
					<div class="item"><%=rs.getString("id")%></div>
				</div>
			</div>
			<div class="box">
				<div class="box-item">
					phone :
					<div class="item"><%=rs.getString("phone")%></div>
				</div>
			</div>
			<div class="box">
				<div class="box-item">
					주소 :
					<div class="item"><%=rs.getString("address")%></div>
				</div>
			</div>
			<div class="box">
				<div class="box-item">
					가입 날짜 :
					<div class="item"><fmt:formatDate value="<%= timestamp %>" pattern="yyyy-MM-dd" /></div>
				</div>
			</div>

			<%
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
	</div>

	<jsp:include page="../frame/footer.jsp" />
</body>
</html>
