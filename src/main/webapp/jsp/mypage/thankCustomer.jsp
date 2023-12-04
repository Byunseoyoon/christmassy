<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
<jsp:include page="../frame/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../../resources/css/myPage.css">
</head>
<body>
	<%
		String shipping_phone = "";
		String shipping_name = "";
		String shipping_shippingDate = "";
		String shipping_country = "";
		String shipping_zipCode = "";
		String shipping_addressName = "";		

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if (n.equals("Shipping_shippingDate"))
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
		}
	%>
	<jsp:include page="../frame/menu.jsp" />
	<div class="box-title" style="margin-top: 50px">주문 완료</div>
		<div class="mypage-container" style="margin-right: 260px">
			
			<div class="container">
		<h2 class="form-item" style="font-size:3rem; padding:10px;">주문해주셔서 감사합니다.</h2>
		<p>	주문은	<%	out.println(shipping_shippingDate);	%>에 배송될 예정입니다! !
	</div>
	<div class="container">
		<p><a href="../category/categoryDetail.jsp" class="btn btn-buy float-right" > &laquo; 상품 목록</a>		
	</div>	
		</div>
		<jsp:include page="../frame/footer.jsp" />
</body>
</html>
<%
	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if (n.equals("Customer_cartId"))
			thisCookie.setMaxAge(0);
		if (n.equals("Customer_name"))
			thisCookie.setMaxAge(0);
		if (n.equals("Customer_shippingDate"))
			thisCookie.setMaxAge(0);
		if (n.equals("Customer_country"))
			thisCookie.setMaxAge(0);
		if (n.equals("Customer_zipCode"))
			thisCookie.setMaxAge(0);
		if (n.equals("Customer_addressName"))
			thisCookie.setMaxAge(0);
		
		if (n.equals("Shipping_cartId"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_name"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_shippingDate"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_country"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_zipCode"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_addressName"))
			thisCookie.setMaxAge(0);
		
		response.addCookie(thisCookie);
	}
%>