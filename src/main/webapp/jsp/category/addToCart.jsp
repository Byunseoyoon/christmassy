<%@ page import="java.sql.*" %>


<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="connect.jsp" %>

<%
    String pidx = request.getParameter("productId");
    String quantity = request.getParameter("quantity");
    String option = request.getParameter("option");

    Connection connection = null;
    PreparedStatement pstmt = null;

    try {
        connection = getConnection();

        // 받아온 값 콘솔에 출력
        System.out.println("Received productId: " + pidx);
        System.out.println("Received quantity: " + quantity);
        System.out.println("Received option: " + option);

        // PreparedStatement를 사용하여 SQL 인젝션을 방지
        String insertQuery = "INSERT INTO notcart (pidx, number, flag) VALUES (?, ?, ?)";
        pstmt = connection.prepareStatement(insertQuery);

        // 데이터베이스 테이블의 pidx와 number 컬럼이 int 형이므로 setInt()를 사용
        pstmt.setInt(1, Integer.parseInt(pidx));
        pstmt.setInt(2, Integer.parseInt(quantity));
        pstmt.setString(3, option);

        pstmt.executeUpdate();
        
      

        response.sendRedirect("productDetail.jsp?pidx=" + pidx);
    } catch (Exception e) {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    } finally {
        // 리소스 해제
        try {
            if (pstmt != null) {
                pstmt.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

