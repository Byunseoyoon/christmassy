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

  // 세션에서 userId 가져오기
  session = request.getSession();
  String loggedInUserId = (String) session.getAttribute("userId");

  String filename = "";
  String realFolder = "C:\\upload"; // 웹 어플리케이션상의 절대 경로
  String encType = "utf-8"; // 인코딩 타입
  int maxSize = 5 * 1024 * 1024; // 최대 업로드될 파일의 크기 5MB

  MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

  Enumeration files = multi.getFileNames();
  String fname = (String) files.nextElement();
  String fileName = multi.getFilesystemName(fname);

  String title = multi.getParameter("title");
  String contents = multi.getParameter("contents");

  // 현재 날짜를 가져오기
  Date currentDate = new Date();
  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
  String contentDate = dateFormat.format(currentDate);

  // midx를 세션 정보로부터 가져오기
  String midx = null;
  int hidx = 0; // 추가된 부분

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

    // SQL 쿼리 (MySQL 쿼리)
    String midxQuery = "SELECT midx FROM members WHERE id = ?";
    pstmt = conn.prepareStatement(midxQuery);
    pstmt.setString(1, loggedInUserId);

    // 쿼리 실행
    rs = pstmt.executeQuery();

    // 결과 처리
    if (rs.next()) {
      midx = rs.getString("midx");

      // hidx 계산을 위한 SQL 쿼리
      String countQuery = "SELECT COUNT(*) FROM help WHERE midx = ?";
      pstmt = conn.prepareStatement(countQuery);
      pstmt.setString(1, midx);
      rs = pstmt.executeQuery();

      // 결과 처리
      if (rs.next()) {
        hidx = rs.getInt(1) + 1;
      }

      // 글 저장 SQL 쿼리
      String insertQuery = "INSERT INTO help (midx, title, contents, content_date, confirmed, hidx, file) VALUES (?, ?, ?, ?, 'no', ?, ?)";
      pstmt = conn.prepareStatement(insertQuery);
      pstmt.setString(1, midx);
      pstmt.setString(2, title);
      pstmt.setString(3, contents);
      pstmt.setString(4, contentDate);
      pstmt.setString(5, String.valueOf(hidx));
      
      if (fileName != null) {
        pstmt.setString(6, fileName);
      } else {
        pstmt.setNull(6, Types.VARCHAR);
      }

      pstmt.executeUpdate();
    }

  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    // 자원 해제
    if (rs != null) try { rs.close(); } catch(Exception e) {}
    if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
    if (conn != null) try { conn.close(); } catch(Exception e) {}
  }

  // 글쓰기 완료 후 목록 페이지로 이동
  response.sendRedirect("question.jsp");
%>
