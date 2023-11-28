<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

    String checkId = request.getParameter("checkId");
    
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        // 쿼리 실행
        String query = "SELECT id FROM members WHERE id=?";
        preparedStatement = conn.prepareStatement(query);
        preparedStatement.setString(1, checkId);
        resultSet = preparedStatement.executeQuery();

        // 결과를 클라이언트로 보내기
        if (resultSet.next()) {
            out.println("중복된 아이디입니다.");
        } else {
            out.println("사용 가능한 아이디입니다.");
       
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // 리소스 정리
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>


