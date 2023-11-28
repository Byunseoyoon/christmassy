
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>

<%@ include file="connect.jsp" %>

<%
String categoryDetail = request.getParameter("categoryDetail");
%>

<html>
<head>
<jsp:include page="../frame/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="categoryDetail.css"> <!-- Include the CSS file -->
<script type="text/javascript" src="categoryDetail.js"></script> <!-- Include the JavaScript file -->
<title><%=categoryDetail %></title>
    
</head>
<body>

    <jsp:include page="../frame/menu.jsp" />
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3"><%=categoryDetail%></h1>
        </div>

       
    </div>
    
    <div id="mainContent">
            <jsp:include page="category.jsp" />
        </div>

    <%
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();

            // SQL 쿼리 동적 
            String query = "SELECT pidx, pname, price, descriptor, image FROM products WHERE categoryDetail = ?";
            pstmt = connection.prepareStatement(query);
            pstmt.setString(1,categoryDetail);
            System.out.println("실행된 쿼리: " + pstmt.toString());
            resultSet = pstmt.executeQuery();
    %>

    <div class="container">
        <div class="row">
            <%
                while (resultSet.next()) {
                    int pidx = resultSet.getInt("pidx");
                    String pname = resultSet.getString("pname");
                    int price = resultSet.getInt("price");
                    String descriptor = resultSet.getString("descriptor");
                    String image = resultSet.getString("image");
            %>

            <div class="product-container" onclick="redirectToProductDetail('<%=pidx%>')">
                <img src="../../resources/images/<%=image%>" style="width: 100%;  height: 200px" />
                <h3><%=pname%></h3>
                <p>가격: <%=price%>원</p>
                <p>설명: <%=descriptor%></p>
                
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
    </div>

    <div class="container">
        <hr>
    </div>
    <jsp:include page="../frame/footer.jsp" />
</body>
</html>
