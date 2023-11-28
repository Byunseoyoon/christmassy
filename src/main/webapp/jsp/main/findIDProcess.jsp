<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");

    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        // 쿼리 실행
        String query = "SELECT id FROM members WHERE name=?";
        preparedStatement = conn.prepareStatement(query);
        preparedStatement.setString(1, name);
        resultSet = preparedStatement.executeQuery();

        // 결과를 클라이언트로 보내기
        if (resultSet.next()) {
            out.println("찾은 아이디: " + resultSet.getString("id"));
        } else {
            out.println("해당 이름의 아이디가 존재하지 않습니다.");
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
