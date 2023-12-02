<%@ page contentType="text/html; charset=utf-8"%>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");

	PreparedStatement pstmt = null;

	
	try{
		String sql = "INSERT INTO members(id, pw, name, phone, address, mdate) VALUES (?, ?, ?, ?, ?, ?)";
		
		// pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, phone);
		pstmt.setString(5, address);
		
		// 현재 날짜를 가져오기
		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String contentDate = dateFormat.format(currentDate);
		
		pstmt.setString(6, contentDate);
		
		pstmt.executeUpdate();
		response.sendRedirect("login.jsp");
		
	} catch(SQLException e){
		e.printStackTrace(); 
		out.println("Members 테이블 삽입 실패<br>");
	} finally{
		if(conn != null) conn.close();
		if(pstmt != null) pstmt.close();
	}
	
%>