<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
  <jsp:include page="../frame/header.jsp"></jsp:include>
</head>
<body>
  <jsp:include page="../frame/menu.jsp" />
  <%int num = 0; %>
  <div class="container mt-5">
    <%
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String midx = null;

      try {
        // JDBC 드라이버 로딩 (MySQL 드라이버)
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 데이터베이스 연결 정보 설정 (MySQL 연결 정보)
        String url = "jdbc:mysql://localhost:3306/christmassyDB?useSSL=false&serverTimezone=UTC";
        String user = "root";
        String password = "1234";

        // 데이터베이스 연결
        conn = DriverManager.getConnection(url, user, password);

     // 세션에서 userId 가져오기
        session = request.getSession();
        String loggedInUserId = (String) session.getAttribute("userId");
        
     // SQL 쿼리 (MySQL 쿼리)
        String qParam = request.getParameter("help.q_num");
     	num = Integer.parseInt(qParam);
        String sql = "SELECT * FROM help WHERE q_num = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, num);
        rs = pstmt.executeQuery();
        
     // 결과 처리
        if (rs.next()) {
          String title = rs.getString("title");
          String contents = rs.getString("contents");
          String file = rs.getString("file");
          String contentDate = rs.getString("content_date");
          String confirmed = rs.getString("confirmed");
          String answer = rs.getString("answer");

    %>
          <div>
            <h3><%= title %></h3>
            <p><strong>작성일:</strong> <%= contentDate %></p>
            <p><strong>내용:</strong> <%= contents %></p>
            <%-- 파일이 있는 경우에만 이미지 표시 --%>
            <% if (file != null && !file.isEmpty()) { %>
              <p><strong>사진:</strong></p>
              <img src="<%= "../../resources/images/" + file %>" alt="사진">
            <% } %>
            <% if (answer != null) { %>
              <p><strong>답변:</strong></p>
              <%= answer %>
            <% } %>
          </div>
    <%
        } else {
          // 해당하는 글이 없는 경우에 대한 처리
    %>
          <p>해당하는 글이 없습니다.</p>
    <%
        }
      } catch (Exception e) {
        e.printStackTrace();
      } finally {
        // 자원 해제
        if (rs != null) try { rs.close(); } catch(Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if (conn != null) try { conn.close(); } catch(Exception e) {}
      }
    %>
  </div>
  <div class="container mt-5">
  <form action="saveAnswer.jsp" method="post">
    <div class="form-group">
      <label for="q_answer">답변:</label>
      <textarea class="form-control" id="q_answer" name="q_answer" rows="4" required></textarea>
    </div>
    <input type="hidden" name="q_num" value="<%= num %>">
	<button type="submit" class="btn btn-primary">답변 작성</button>
  </form>
	</div>
  <jsp:include page="../frame/footer.jsp" />
</body>
</html>