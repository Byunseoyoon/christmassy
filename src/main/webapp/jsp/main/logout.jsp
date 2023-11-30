<%@ page contentType="text/html; charset=utf-8" %>
<%
	session.invalidate();
	response.sendRedirect("/christmassy/src/main/webapp/jsp/main/home.jsp");
%>