<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
<jsp:include page="../frame/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../../resources/css/myPage.css">
<!-- Include the CSS file -->
</head>
<body>
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
	<jsp:include page="../frame/menu.jsp" />
	<div class="main-box">
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
			String sbidx = request.getParameter("bidx");
			int bidx = Integer.parseInt(sbidx);
			String sql = "SELECT * FROM buy b join products p on b.pidx=p.pidx WHERE b.bidx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);

			// 쿼리 실행
			rs = pstmt.executeQuery();
			int sum = 0;
			String pidx =null;
			
		%>
		<div class="box-title" style="margin-top: 50px">리뷰 작성</div>
		<div class="mypage-container" style="margin-right: 260px">
			<div class="box-title">구매 상품</div>

			<div class="row"></div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<thead class="tr-title">
						<th>상품</th>
						<th>가격</th>
						<th>수량</th>
						<th>소계</th>
					</thead>
					<%
					while (rs.next()) {
						int total = Integer.parseInt(rs.getString("price")) * Integer.parseInt(rs.getString("number"));
						pidx = rs.getString("pidx");
					%>
					<tr
						onClick="location.href='../category/productDetail.jsp?pidx=<%=pidx%>'">
						<td style="vertical-align: middle; font-weight: bolder;"><img
							class="td-image"
							src="../../resources/images/<%=rs.getString("image")%>"> <%=rs.getString("pname")%></td>
						<td style="vertical-align: middle;"><fmt:formatNumber type="currency" value='<%=rs.getString("price")%>' /></td>
						<td style="vertical-align: middle;"><%=rs.getString("number")%></td>
						<td style="vertical-align: middle;"><fmt:formatNumber type="currency" value='<%=total%>' /></td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
			<hr>


		</div>
		<div class="mypage-container" style="margin-right: 260px">
			<div class="box-title">리뷰</div>
			<div class="form-container" >
				<form action="./processWriteReview.jsp" class="form-horizontal" method="post">
					<input type="hidden" name="pidx" value="<%=pidx%>"/>
					<input type="hidden" name="bidx" value="<%=bidx%>"/>
					<div class="form-group row">
						<label class="col-sm-2">별점</label>
						<div class="col-sm-3">
							<select name="star" id="star">
								<option value="1"><% out.print("🎅🏻"); %></option>
								<option value="2"><% out.print("🎅🎅🏻"); %></option>
								<option value="3"><% out.print("🎅🏻🎅🏻🎅🏻"); %></option>
								<option value="4"><% out.print("🎅🏻🎅🏻🎅🏻🎅🏻"); %></option>
								<option value="5"><% out.print("🎅🏻🎅🏻🎅🏻🎅🏻🎅🏻"); %></option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">comment</label>
						<div class="col-sm-5">
							<textarea class="form-item" id="comment" name="comment" rows="4" required></textarea>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
								<input type="submit" class="btn btn-buy float-right" value="작성하기" /> 
								<a href="./buyList.jsp" style="margin-right:5px;" class="btn btn-secondary float-right"	role="button"> 취소 </a>
						</div>
					</div>
				</form>
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
	<jsp:include page="../frame/footer.jsp" />
</body>
</html>