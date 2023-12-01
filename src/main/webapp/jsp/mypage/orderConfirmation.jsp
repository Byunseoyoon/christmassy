<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();

	String shipping_name = "";
	String shipping_phone = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_phone"))
				shipping_phone = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Integer mIdx = null;

	// 데이터베이스 연결 정보 설정 (MySQL 연결 정보)
	String url = "jdbc:mysql://localhost:3306/christmassyDB?useSSL=false&serverTimezone=UTC";
	String user = "root";
	String password = "1234";
%>
<html>
<head>
<jsp:include page="../frame/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../../resources/css/myPage.css"> <!-- Include the CSS file -->
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
		String sql = "SELECT * FROM cart c JOIN members m ON c.midx=m.midx JOIN products p ON p.pidx=c.pidx WHERE m.midx = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mIdx);

		// 쿼리 실행
		rs = pstmt.executeQuery();
		int sum =0;
		
	%>
	<jsp:include page="../frame/menu.jsp" />
	<div class="main-box">
		<div class="box-title" style="margin-top: 50px">결제 정보</div>
	<div class="mypage-container" style="margin-right: 260px">
		<div class="text-center ">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong> <br> 성명 : <% out.println(shipping_name); %>	<br> 
				우편번호 : <% 	out.println(shipping_zipCode);%><br> 
				주소 : <%	out.println(shipping_addressName);%>(<%	out.println(shipping_country);%>) <br>
			</div>
			<div class="col-4" align="right">
				<p>	<em>배송일: <% out.println(shipping_shippingDate);%></em>
			</div>
		</div>
		<div>
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
							sum = sum + total; 
					%>
					<tr onClick="location.href='../category/productDetail.jsp?pidx=<%=rs.getString("pidx") %>'">
						<td style="vertical-align : middle; font-weight:bolder;"><img class="td-image" src="../../resources/images/<%=rs.getString("image")%>">   <%=rs.getString("pname")%></td>
						<td style="vertical-align : middle;"><fmt:formatNumber type="currency" value='<%=rs.getString("price")%>' /></td>
						<td style="vertical-align : middle;"><%=rs.getString("number")%></td>
						<td style="vertical-align : middle;"><fmt:formatNumber type="currency" value='<%=total%>' /></td>
					</tr>
					<%
						}
					%>
					<tr>
						<td> </td>
						<td> </td>
						<td class="text-right">	<strong>총액: </strong></td>
						<td class="text-center text-danger"><strong><fmt:formatNumber type="currency" value='<%=sum%>' /> </strong></td>
					</tr>
				</table>
				<div class="text-center ">
					<a href="./shippingInfo.jsp"class="btn btn-secondary" style="float: right; margin-right:10px" role="button"> 이전 </a>
					<a href="./processOrderConfirmation.jsp" class="btn btn-buy" style="float: right; margin-right:10px">결제 하기</a>
					<a href="./checkOutCancelled.jsp" class="btn btn-secondary"	role="button" style="float: right; margin-right:10px"> 취소 </a>			
				</div>
		</div>
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
</body>
</html>