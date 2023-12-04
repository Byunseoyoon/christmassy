<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*"%>
<%
request.setCharacterEncoding("UTF-8");

String spidx = request.getParameter("pidx");
Integer pidx = Integer.parseInt(spidx);

String pname = request.getParameter("pname");

String sprice = request.getParameter("price");
Integer price = Integer.parseInt(sprice);

String descriptor = request.getParameter("descriptor");
String category = request.getParameter("category");
String categoryDetail = request.getParameter("categoryDetail");
String image = request.getParameter("image");
String sstock = request.getParameter("stock");

Integer stock = Integer.parseInt(sstock);

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
	// JDBC 드라이버 로딩 (MySQL 드라이버)
	Class.forName("com.mysql.cj.jdbc.Driver");

	// 데이터베이스 연결 정보 설정 (MySQL 연결 정보)
	String url = "jdbc:mysql://localhost:3306/christmassyDB?useSSL=false&serverTimezone=UTC";
	String user = "root";
	String password = "1234";

	// 데이터베이스 연결
	conn = DriverManager.getConnection(url, user, password);

	String updateQuery = "UPDATE products SET pname = ?, price = ?, descriptor = ?, category = ?, categoryDetail = ?, stock = ? WHERE pidx = ?";
	pstmt = conn.prepareStatement(updateQuery);
	pstmt.setString(1, pname);
	pstmt.setInt(2, price);
	pstmt.setString(3, descriptor);
	pstmt.setString(4, category);
	pstmt.setString(5, categoryDetail);
	/* pstmt.setString(6, image); */
	pstmt.setInt(6, stock);
	pstmt.setInt(7, pidx);
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

// 글쓰기 완료 후 목록 페이지로 이동
response.sendRedirect("adminProducts.jsp");
%>