<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<jsp:include page="../frame/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../../resources/css/myPage.css"> <!-- Include the CSS file -->
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Integer mIdx = null;

// 데이터베이스 연결 정보 설정 (MySQL 연결 정보)
String url = "jdbc:mysql://localhost:3306/christmassyDB?useSSL=false&serverTimezone=UTC";
String user = "root";
String password = "1234";
%>
</head>
<style>


</style>
<jsp:include page="../frame/adminMenu.jsp" />

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

		
		// SQL 쿼리 (MySQL 쿼리)
		mIdx = Integer.parseInt(loggedInUserId);
		String sql = "SELECT * FROM products";
		pstmt = conn.prepareStatement(sql);

		// 쿼리 실행
		rs = pstmt.executeQuery();
		int sum =0;
		
	%>
			<div class="box-title">상품</div>

			<div class="row"></div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<thead class="tr-title">
						<th>상품</th>
						<th>가격</th>
						<th>수정</th>
						<th>삭제</th>
						<th>사이트</th>
					</thead>
					<%
						while (rs.next()) {
					%>
					<tr onClick="location.href='./modiProducts.jsp?pidx=<%=rs.getString("pidx")%>'">
						<td style="vertical-align : middle; font-weight:bolder;"><img class="td-image" src="../../resources/images/<%=rs.getString("image")%>">   <%=rs.getString("pname")%></td>
						<td style="vertical-align : middle;"><fmt:formatNumber type="currency" value='<%=rs.getString("price")%>' /></td>
						<td style="vertical-align : middle;"><a href="./modiProducts.jsp?pidx=<%=rs.getString("pidx")%>" class="button button-success">수정</a></td>
						<td style="vertical-align : middle;"><a href="./removeProducts.jsp?pidx=<%=rs.getString("pidx")%>" class="button button-danger">삭제</a></td>
						<td style="vertical-align : middle;"><a href="../category/productDetail.jsp?pidx=<%=rs.getString("pidx") %>" class="button">보러가기</a></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<hr>


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
</body>
</html>