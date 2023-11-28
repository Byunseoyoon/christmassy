<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");

    // 입력된 id와 pw 가져오기
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    PreparedStatement pstmt1 = null;
    ResultSet rs1 = null;

    try {
        // SQL 쿼리
        String sql = "SELECT * FROM members WHERE id=? AND pw=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);

        // 쿼리 실행 및 결과 가져오기
        rs = pstmt.executeQuery();

        if (rs.next()) {
        	//세션에 사용자 아이디 저장
        	session.setAttribute("userId", id);
        	
        	String sql1 = "SELECT midx FROM members WHERE id=?";
        	pstmt1 = conn.prepareStatement(sql1);
        	pstmt1.setString(1, id);
        	
        	rs1 = pstmt.executeQuery();
        	if(rs1.next()){
	            // 세션에 사용자 번호 저장
	            String midx = rs1.getString("midx");
	            session.setAttribute("userMidx", midx);
        	}
            
            // 로그인 성공 후의 페이지로 리다이렉트 또는 필요한 로직 추가
            response.sendRedirect("home.jsp");
        } else {
            // 로그인 실패
%>
   <script type="text/javascript">
       alert("아이디 또는 비밀번호가 잘못되었습니다.");
       window.location.href = "login.jsp"; 
   </script>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("로그인 처리 중 오류가 발생했습니다.<br>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>