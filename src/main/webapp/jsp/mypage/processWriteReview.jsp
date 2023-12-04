<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%

	request.setCharacterEncoding("utf-8");
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
		String loggedInUserId = (String) session.getAttribute("userId");
		
		// SQL 쿼리 (MySQL 쿼리)
		
		
		//review에 추가
		String s_star = request.getParameter("star");
		Integer star = Integer.parseInt(s_star);
		
		String s_pidx = request.getParameter("pidx");
		Integer pidx = Integer.parseInt(s_pidx);
		
		String comment = request.getParameter("comment");
		
		String sql = "INSERT INTO review(star, comment, pidx, id) values (?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, star);
		pstmt.setString(2, comment);
		pstmt.setInt(3, pidx);
		pstmt.setString(4, loggedInUserId);
		
		pstmt.executeUpdate();
		
		
		String s_bidx = request.getParameter("bidx");
		Integer bidx = Integer.parseInt(s_bidx);
		
		//구입 목록에선 리뷰 업데이트
		sql = "UPDATE buy set review=1 WHERE bidx = ?";
		pstmt2 = conn.prepareStatement(sql);
		pstmt2.setInt(1, bidx);
		
		pstmt2.executeUpdate();
		request.setAttribute("msg", "리뷰작성이 완료되었습니다.");
		
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
			
%>
<script>
alert("리뷰 작성완료!");
location.href = 'buyList.jsp';
</script>