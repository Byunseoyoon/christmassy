<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 데이터베이스 연결 정보 설정 (MySQL 연결 정보)
	String url = "jdbc:mysql://localhost:3306/christmassyDB?useSSL=false&serverTimezone=UTC";
	String user = "root";
	String password = "1234";
	
	
	try {
		// JDBC 드라이버 로딩 (MySQL 드라이버)
		Class.forName("com.mysql.cj.jdbc.Driver");

		// 데이터베이스 연결
		conn = DriverManager.getConnection(url, user, password);

		// 세션에서 userId 가져오기
		session = request.getSession();
		String loggedInUserId = (String) session.getAttribute("userMidx");
		
		Integer mIdx = Integer.parseInt(loggedInUserId);
		String spIdx = request.getParameter("pidx");
		Integer pIdx = Integer.parseInt(spIdx); 
		// SQL 쿼리 (MySQL 쿼리)
		String sql = "DELETE FROM cart WHERE midx = ? and pidx = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mIdx);
		pstmt.setInt(2, pIdx);

		// 쿼리 실행
		pstmt.executeUpdate();
		
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
	
	response.sendRedirect("cart.jsp");
		
%>