<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>

<%@ include file="connect.jsp" %>

<%
String pidx = request.getParameter("pidx");
%>

<html>
<head>

<title>Review</title>
    
    <style>
    .product-container {
    display: flex;
    flex-direction: row; /* 요소들을 가로로 배열하도록 설정 */
    margin-bottom: 10px; /* 필요에 따라 조절하세요 */
}

.rating, .comment {
    margin-right: 10px; /* 요소들 사이의 간격 조절 */
}
    
    
    
    
    </style>
    
    
</head>
<body>

<p>리뷰jsp</p>

   
   
    <%
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();

            // SQL 쿼리 동적 
            String query = "SELECT star, comment FROM review WHERE pidx = ?";
            pstmt = connection.prepareStatement(query);
            pstmt.setString(1, pidx);
            System.out.println("실행된 쿼리: " + pstmt.toString());
            resultSet = pstmt.executeQuery();
    %>

<div class="container">
   
        <%
            while (resultSet.next()) {
                int star = resultSet.getInt("star");
                String comment = resultSet.getString("comment");
        %>
<div class="row">
        <div class="product-container">
            <span class="rating">평점: <%=star%></span>
            <span class="comment">코멘트: <%=comment%></span>
        </div>
        </div>
        </div>

        <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            if (resultSet != null) resultSet.close();
            if (pstmt != null) pstmt.close();
            if (connection != null) connection.close();
        }
        %>
    
</div>


</body>
</html>

