<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
  <title>고객센터</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
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
        String hidxParam = request.getParameter("hidx");
        String sql = "SELECT * FROM help WHERE hidx = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, hidxParam);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
        	String midxQuery = "SELECT midx FROM members WHERE id = ?";
            pstmt = conn.prepareStatement(midxQuery);
            pstmt.setString(1, loggedInUserId);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
            	midx = rs.getString("midx");
            	
            	String midxParamsql = "SELECT * FROM help WHERE midx = ?";
                pstmt = conn.prepareStatement(midxParamsql);
                pstmt.setString(1, midx);
                rs = pstmt.executeQuery();
                
             // 결과 처리
                if (rs.next()) {
                  String title = rs.getString("title");
                  String contents = rs.getString("contents");
                  String file = rs.getString("file");
                  String contentDate = rs.getString("content_date");
                  String confirmed = rs.getString("confirmed");

            %>
                  <div>
                    <h3><%= title %></h3>
                    <p><strong>작성일:</strong> <%= contentDate %></p>
                    <p><strong>내용:</strong> <%= contents %></p>
                    <%-- 파일이 있는 경우에만 이미지 표시 --%>
                    <% if (file != null && !file.isEmpty()) { %>
                      <p><strong>사진:</strong></p>
                      <img src="<%= "C:\\upload\\" + file %>" alt="사진">
                    <% } %>
                    <p><strong>답변여부:</strong> <%= confirmed %></p>
                  </div>
            <%
                } else {
                  // 해당하는 글이 없는 경우에 대한 처리
            %>
                  <p>해당하는 글이 없습니다.</p>
            <%
                }
            }
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