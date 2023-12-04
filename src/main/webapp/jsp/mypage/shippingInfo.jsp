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
			mIdx = Integer.parseInt(loggedInUserId);
			String sql = "SELECT * FROM cart c JOIN members m ON c.midx=m.midx JOIN products p ON p.pidx=c.pidx WHERE m.midx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mIdx);

			// 쿼리 실행
			rs = pstmt.executeQuery();
			int sum = 0;
			
		%>
		<div class="box-title" style="margin-top: 50px">주문하기</div>
		<div class="mypage-container" style="margin-right: 260px">
			<div class="box-title">상품</div>

			<div class="row"></div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<thead class="tr-title">
						<th>상품</th>
						<th></th>
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
					<tr	onClick="location.href='../category/productDetail.jsp?pidx=<%=rs.getString("pidx")%>'">
						<td style="vertical-align: middle; font-weight: bolder;">
						<img class="td-image" src="../../resources/images/<%=rs.getString("image")%>">
					</td>
						<td style="vertical-align: middle;"><%=rs.getString("pname")%></td>
						<td style="vertical-align : middle; font-weight:bolder;">
							<% if(flag ==null || flag.isEmpty()){ %>
								X
							<%}else{ out.print(flag);}%>
						</td>
						<td style="vertical-align: middle;"><fmt:formatNumber type="currency" value='<%=rs.getString("price")%>' /></td>
						<td style="vertical-align: middle;"><%=rs.getString("number")%></td>
						<td style="vertical-align: middle;"><fmt:formatNumber type="currency" value='<%=total%>' /></td>
						<td style="vertical-align: middle;"><a
							href="./removeCart.jsp?pidx=<%=rs.getString("pidx")%>"
							class="badge badge-danger">삭제</a></td>
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
			</div>
			<hr>


		</div>
		<div class="mypage-container" style="margin-right: 260px">
			<div class="box-title">배송정보</div>
			<div class="form-container" >
				<form action="./processShippingInfo.jsp" class="form-horizontal" method="post">
				<%
					sql = "SELECT * FROM members WHERE midx = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, mIdx);

					// 쿼리 실행
					rs = pstmt.executeQuery();
					if(rs.next()){
						
					}else{
						out.println("데이터가 없습니다.");
					}
				%>
					<%-- <input type="hidden" name="cartId" value="<%=rs.getString("midx")%>" /> --%>
					<div class="form-group row">
						<label class="col-sm-2">성명</label>
						<div class="col-sm-3">
							<input name="name" type="text" class="form-item" value="<%=rs.getString("name")%>" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">전화번호</label>
						<div class="col-sm-3">
							<input name="phone" type="text" class="form-item" value="<%=rs.getString("phone")%>" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">배송일</label>
						<div class="col-sm-3">
							<c:set var="ymd" value="<%=new java.util.Date()%>" />
							<input name="shippingDate" type="text" class="form-item" value="<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" />" readonly/>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">국가</label>
						<div class="col-sm-3">
							<input name="country" type="text" class="form-item" value="Korea"/>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">우편번호</label>
						<div class="col-sm-3">
							<input name="zipCode" type="text" class="form-item" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">주소</label>
						<div class="col-sm-5">
							<input name="addressName" type="text" class="form-item" value="<%=rs.getString("address")%>" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
								<input type="submit" class="btn btn-buy float-right" value="주문하기" /> 
								<a href="./checkOutCancelled.jsp" style="margin-right:5px;" class="btn btn-secondary float-right"	role="button"> 취소 </a>
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