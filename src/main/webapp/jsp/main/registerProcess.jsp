<%@ page contentType="text/html; charset=utf-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String midx = request.getParameter("midx");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String date = request.getParameter("date");

	PreparedStatement pstmt = null;

	
	try{
		String sql = "INSERT INTO members(midx, id, pw, name, phone, address, date) VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		// pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, midx);
		pstmt.setString(2, id);
		pstmt.setString(3, pw);
		pstmt.setString(4, name);
		pstmt.setString(5, phone);
		pstmt.setString(6, address);
		pstmt.setString(7, date);
		
		pstmt.executeUpdate();
		response.sendRedirect("home.jsp");
		
	} catch(SQLException e){
		e.printStackTrace(); 
		out.println("Members 테이블 삽입 실패<br>");
	} finally{
		if(conn != null) conn.close();
		if(pstmt != null) pstmt.close();
	}
	
%>