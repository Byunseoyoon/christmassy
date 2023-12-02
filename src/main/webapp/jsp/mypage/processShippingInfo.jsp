<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
	request.setCharacterEncoding("UTF-8");

	Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie phone = new Cookie("Shipping_phone", URLEncoder.encode(request.getParameter("phone"), "utf-8"));
	Cookie shippingDate = new Cookie("Shipping_shippingDate",	URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
	Cookie country = new Cookie("Shipping_country",	URLEncoder.encode(request.getParameter("country"), "utf-8"));
	Cookie zipCode = new Cookie("Shipping_zipCode",	URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
	Cookie addressName = new Cookie("Shipping_addressName",	URLEncoder.encode(request.getParameter("addressName"), "utf-8"));

	name.setMaxAge(24 * 60 * 60);
	phone.setMaxAge(24 * 60 * 60);
	country.setMaxAge( 24 * 60 * 60);
	zipCode.setMaxAge( 24 * 60 * 60);
	addressName.setMaxAge(24 * 60 * 60);

	response.addCookie(name);
	response.addCookie(phone);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);

	response.sendRedirect("orderConfirmation.jsp");
%>