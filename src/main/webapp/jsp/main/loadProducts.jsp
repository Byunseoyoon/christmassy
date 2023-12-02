<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="dbconn.jsp" %>
<style>
	.rounded-image {
	    border-radius: 50%;
	}
	p {
		margin-top: 15px;
		font-weight: bold;
		color: #115A5B;
	}	
</style>
<%
    String category = request.getParameter("category");

    // SQL 쿼리 실행
    String query = "SELECT pidx, pname, image FROM products WHERE category = ? LIMIT 3";
    try (
    	
        PreparedStatement statement = conn.prepareStatement(query)) {

        statement.setString(1, category);

        ResultSet resultSet = statement.executeQuery();

        // 결과 출력
        while(resultSet.next()) {
        	String pidx = resultSet.getString("pidx");
            String image = resultSet.getString("image");
            String pname = resultSet.getString("pname");
%>
            <div>
            	<a href="../category/productDetail.jsp?pidx= <%= pidx%>">
                	<img src="../../resources/images/<%= image %>" width="300" height="300" class="rounded-image">
                </a>
                <p><%= pname %> </p>
            </div>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
