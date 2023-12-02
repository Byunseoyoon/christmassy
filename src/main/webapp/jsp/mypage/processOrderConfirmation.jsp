<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
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
		// SQL 쿼리 (MySQL 쿼리)
		
		//cart 값 선택
		String sql = "SELECT * FROM cart WHERE midx = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mIdx);
		rs= pstmt.executeQuery();
		
		while(rs.next()){
			String cartPidx = rs.getString("pidx");
			String cartNumber = rs.getString("number");
			
			Integer pIdx = Integer.parseInt(cartPidx);
			Integer number = Integer.parseInt(cartNumber);
			
			//buy에 추가
			String sql2 = "INSERT INTO buy(midx, pidx, number) values (?, ?, ?)";
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, mIdx);
			pstmt2.setInt(2, pIdx);
			pstmt2.setInt(3, number);
			
			pstmt2.executeUpdate();
		
		}
		
		//카트에선 삭제
		sql = "DELETE FROM cart WHERE midx = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mIdx);
		
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
		if (pstmt2 != null)
			try {
				pstmt2.close();
			} catch (Exception e) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (Exception e) {
			}
		}
			
	response.sendRedirect("thankCustomer.jsp");
%>