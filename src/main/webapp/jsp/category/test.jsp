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
<jsp:include page="../frame/header.jsp"></jsp:include>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="productDetail.css"> <!-- CSS 파일 포함 -->
    <script type="text/javascript" src="productDetail.js"></script> <!-- JavaScript 파일 포함 -->
    <title>제품 상세정보</title>
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

                    // 동적 SQL 쿼리
                    String query = "SELECT pidx, pname, price, descriptor, image FROM products WHERE pidx = ?";
                    pstmt = connection.prepareStatement(query);
                    pstmt.setString(1, pidx);
                    System.out.println("실행된 쿼리: " + pstmt.toString());
                    resultSet = pstmt.executeQuery();

                    // 하나의 제품을 예상하므로 루프는 필요하지 않음
                    if (resultSet.next()) {
                        int productId = resultSet.getInt("pidx");
                        String pname = resultSet.getString("pname");
                        int price = resultSet.getInt("price");
                        String descriptor = resultSet.getString("descriptor");
                        String image = resultSet.getString("image");
                        int quantity = 1; // 실제 수량 값으로 대체 가능
            %>



<div class="col-md-6">
    <img src="../../resources/images/<%=image%>" alt="<%=pname%>" class="img-fluid">
</div>

<div class="col-md-6">
    <h3><%=pname%></h3>
    <p>가격: <%=price%>원</p>
    
    <!-- Display the quantity and buttons horizontally -->
    <div class="quantity-section" style="display: flex; align-items: center;">
        <p style="margin-right: 10px;">수량: <span id="quantityDisplay"><%=quantity%></span></p> <!-- 수량 표시 -->
        <!-- 수량 조절을 위한 -와 + 버튼 -->
        <button onclick="updateQuantity('-')">-</button>
        <button onclick="updateQuantity('+')">+</button>
    </div>
    
    
    
   

    <!-- 상세보기와 리뷰 버튼 -->
    <button onclick="showDetailSection()">상세보기</button>
    <button onclick="showReviewSection()">리뷰</button>
</div>



            <!-- 상세보기 섹션 -->
            <div class="col-md-12 detail-section" id="detailSection">
                <!-- 상세보기 내용 -->
                <!-- 여기에 상세보기에 대한 내용을 추가하세요 -->
                 <p>설명: <%=descriptor%></p>
            </div>

            <!-- 리뷰 섹션 -->
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
    // 수량을 업데이트하는 함수
    function updateQuantity(operation) {
        var quantityElement = document.getElementById("quantityDisplay");
        var currentQuantity = parseInt(quantityElement.innerHTML);

        // +나 - 버튼에 따라 수량 업데이트
        if (operation === '+') {
            currentQuantity++;
        } else if (operation === '-' && currentQuantity > 1) {
            currentQuantity--;
        }

        // 화면에 표시된 수량 업데이트
        quantityElement.innerHTML = currentQuantity;
    }

    function showDetailSection() {
        document.getElementById("detailSection").style.display = "block";
        document.getElementById("reviewSection").style.display = "none";
    }

    function showReviewSection() {
        document.getElementById("detailSection").style.display = "none";
        document.getElementById("reviewSection").style.display = "block";
    }
</script>