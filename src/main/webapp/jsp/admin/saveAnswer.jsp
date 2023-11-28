<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.*" %>
<%
  request.setCharacterEncoding("UTF-8");

  String qNum = request.getParameter("q_num");
  int q_num = Integer.parseInt(qNum);
  String q_answer = request.getParameter("q_answer");

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
    
    String updateQuery = "UPDATE help SET answer = ?, confirmed = 'yes' WHERE q_num = ?";
    pstmt = conn.prepareStatement(updateQuery);
    pstmt.setString(1, q_answer);
    pstmt.setInt(2, q_num);
    
    pstmt.executeUpdate();
    
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    // 자원 해제
    if (rs != null) try { rs.close(); } catch(Exception e) {}
    if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
    if (conn != null) try { conn.close(); } catch(Exception e) {}
  }

  // 글쓰기 완료 후 목록 페이지로 이동
  response.sendRedirect("adminQuestion.jsp");
%>