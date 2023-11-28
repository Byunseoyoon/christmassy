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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="productDetail.css"> <!-- Include the CSS file -->
    <script type="text/javascript" src="productDetail.js"></script> <!-- Include the JavaScript file -->
    <title>Product Detail</title>
</head>
<body>

    <jsp:include page="../frame/menu.jsp" />
    
    <div class="container">
        <div class="row">
            <%
                Connection connection = null;
                PreparedStatement pstmt = null;
                ResultSet resultSet = null;

                try {
                    connection = getConnection();

                    // SQL 쿼리 동적 
                    String query = "SELECT pidx, pname, price, descriptor, image FROM products WHERE pidx = ?";
                    pstmt = connection.prepareStatement(query);
                    pstmt.setString(1, pidx);
                    System.out.println("실행된 쿼리: " + pstmt.toString());
                    resultSet = pstmt.executeQuery();

                    // Expecting one product, so no need for a loop
                    if (resultSet.next()) {
                        int productId = resultSet.getInt("pidx");
                        String pname = resultSet.getString("pname");
                        int price = resultSet.getInt("price");
                        String descriptor = resultSet.getString("descriptor");
                        String image = resultSet.getString("image");
            %>

            <div class="col-md-6">
                <img src="../../resources/images/<%=image%>" alt="<%=pname%>" class="img-fluid">
            </div>

            <div class="col-md-6">
                <h3><%=pname%></h3>
                <p>가격: <%=price%>원</p>
                <p>설명: <%=descriptor%></p>

                <!-- 추가된 부분: 상세보기와 리뷰 버튼 -->
                <button onclick="showDetailSection()">상세보기</button>
                <button onclick="showReviewSection()">리뷰</button>
            </div>

            <!-- 추가된 부분: 상세보기 섹션 -->
            <div class="col-md-12 detail-section" id="detailSection">
                <!-- 상세보기 내용 -->
                <!-- 여기에 상세보기에 대한 내용을 추가하세요 -->
                상세보기 내용이 여기에 표시됩니다.
            </div>

            <!-- 추가된 부분: 리뷰 섹션 -->
            <div class="col-md-12 review-section" id="reviewSection" style="display: none;">
                <!-- 리뷰 내용 -->
                <!-- 여기에 리뷰에 대한 내용을 추가하세요 -->
                리뷰 내용이 여기에 표시됩니다.
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

    <jsp:include page="../frame/footer.jsp" />
</body>
</html>

<script>
    function showDetailSection() {
        document.getElementById("detailSection").style.display = "block";
        document.getElementById("reviewSection").style.display = "none";
    }

    function showReviewSection() {
        document.getElementById("detailSection").style.display = "none";
        document.getElementById("reviewSection").style.display = "block";
    }
</script>
