<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
  <jsp:include page="../frame/header.jsp"></jsp:include>
  <style>
    .title {
      margin-top: 50;
      background-color: rgba(255, 255, 255, 0);
      border: none;
      color: #115A5B;
      font-size: 30px;
      font-weight: bolder;
    }
    .date {
      background-color: rgba(255, 255, 255, 0);
      border: none;
      color: #115A5B;
      font-weight: bolder;
    }
    .answer {
      background: rgba(17, 90, 91, 0.3);
      color: black;
      padding: 20px;
      width: 600px;
      height: 150px;
      font-weight: bolder;
      display: inline-block;
    }
    .content-and-pic {
      display: flex;
      align-items: flex-start; /* 수직 정렬을 위해 flex-start 사용 */
      gap: 20px; /* 콘텐츠와 이미지 사이의 간격 설정 */
    }
    .content {
      background: rgba(17, 90, 91, 0.3);
      color: black;
      padding: 20px;
      width: 600px;
      height: 300px;
      font-weight: bolder;
    }
    .pic {
      text-align: center;
    }
    .pic img {
      max-width: 300px;
      max-height: 300px;
      width: auto;
      height: auto;
      display: block;
      margin: auto;
    }
  </style>
</head>
<body>
  <jsp:include page="../frame/menu.jsp" />

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
        String qParam = request.getParameter("q_num");
        int num = Integer.parseInt(qParam);
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
            <p class="title"><strong>제목: </strong> <%= title + " "%><%= confirmed.equals("yes") ? "✔" : "❌" %></p>
            <p class="date"><strong>일시: </strong><%= contentDate %></p>
            <div class="content-and-pic">
              <span class="content"><%= contents %></span>
              <% if (file != null && !file.isEmpty()) { %>
                <span class="pic"><img src="<%= "../../resources/images/" + file %>" alt="사진"></span>
              <% } %>
            </div>
            <p>
            <% if (answer != null) { %>
              <p class="answer"><%= answer %></p>
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

  <jsp:include page="../frame/footer.jsp" />
</body>
</html>