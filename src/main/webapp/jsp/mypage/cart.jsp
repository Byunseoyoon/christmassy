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
<jsp:include page="../frame/menu.jsp" />
<jsp:include page="../frame/myPageMenu.jsp" />

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
		String sql = "SELECT * FROM cart c JOIN members m ON c.midx=m.midx JOIN products p ON p.pidx=c.pidx WHERE m.midx = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mIdx);

		// 쿼리 실행
		rs = pstmt.executeQuery();
		int sum =0;
		
	%>
	<div class="main-box">
		<div class="mypage-container">
			<div class="box-title">장바구니</div>

			<div class="row"></div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<thead class="tr-title">
						<th>상품</th>
						<th>옵션</th>
						<th>가격</th>
						<th>수량</th>
						<th>소계</th>
						<th>삭제</th>
					</thead>
					<%
						while (rs.next()) {
							int total = Integer.parseInt(rs.getString("price")) * Integer.parseInt(rs.getString("number"));
							sum = sum + total; 
							String flag = rs.getString("flag");
					%>
					<tr onClick="location.href='../category/productDetail.jsp?pidx=<%=rs.getString("pidx") %>'">
						<td style="vertical-align : middle; font-weight:bolder;"><img class="td-image" src="../../resources/images/<%=rs.getString("image")%>">   <%=rs.getString("pname")%></td>
						<td style="vertical-align : middle; font-weight:bolder;">
							<% if(flag ==null || flag.isEmpty()){ %>
								X
							<%}else{ out.print(flag);}%>
						</td>
						<td style="vertical-align : middle;"><fmt:formatNumber type="currency" value='<%=rs.getString("price")%>' /></td>
						<td style="vertical-align : middle;"><%=rs.getString("number")%></td>
						<td style="vertical-align : middle;"><fmt:formatNumber type="currency" value='<%=total%>' /></td>
						<td style="vertical-align : middle;"><a href="./removeCart.jsp?pidx=<%=rs.getString("pidx")%>" class="badge badge-danger">삭제</a></td>
					</tr>
					<%
						}
					%>
					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><fmt:formatNumber type="currency" value='<%=sum%>' /></th>
						<th></th>
					</tr>
				</table>
				</td> 
					<a href="./shippingInfo.jsp" class="btn btn-buy" style="float: right;">주문하기</a>
				</td>
				<div>
					<a href="../category/categoryDetail.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
				</div>
			</div>
			<hr>
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
	<jsp:include page="../frame/footer.jsp" />
</body>
</html>