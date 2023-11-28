
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
    
    
  <style>
        /* Add any additional styles for the layout */
        .product-info {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .product-info img {
            max-width: 100%;
            max-height: 500px; /* Adjust the max-height as needed */
            margin-right: 20px;
        }

        .quantity-section {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .quantity-section button {
            margin-left: 10px;
        }
    </style>   
    
    
    
    
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



            <!-- Product Information Section -->
            <div class="col-md-12 product-info">
                <div class="col-md-6">
                    <img src="../../resources/images/<%=image%>" alt="<%=pname%>" class="img-fluid">
                </div>

                <div class="col-md-6">
                    <h3><%=pname%></h3>
                    <p>가격: <%=price%>원</p>

                    <!-- Display the quantity and buttons horizontally -->
                    <div class="quantity-section">
                        <p>수량: <span id="quantityDisplay" data-quantity="<%=quantity%>"><%=quantity%></span></p>
                        <!-- Quantity adjustment buttons -->
                        <button onclick="updateQuantity('-', <%=price%>)">-</button>
                        <button onclick="updateQuantity('+', <%=price%>)">+</button>
                    </div>

                    <!-- Display the order amount -->
                    <div class="order-amount-section">
                        <p>주문금액: <span id="orderAmount"><%=price * quantity%>원</span></p>
                    </div>

                    <!-- Cart and Order buttons -->
                    <button onclick="addToCart(<%=productId%>, '<%=pname%>', <%=price%>, <%=quantity%>)">장바구니 담기</button>
                    <button onclick="redirectToCheckout(<%=productId%>, <%=quantity%>)">주문하기</button>
                </div>
            
                  
                
            </div>
            
            <div class="col-md-12">
             <!-- 상세보기와 리뷰 버튼 -->
    <button onclick="showDetailSection()">상세보기</button>
    <button onclick="showReviewSection()">리뷰</button>
            
            
            </div>







            <!-- 상세보기 섹션 -->
            <div class="col-md-12 detail-section" id="detailSection">
                <!-- 상세보기 내용 -->
                <p>설명: <%=descriptor%></p>
            </div>

            <!-- 리뷰 섹션 -->
            <div class="col-md-12 review-section" id="reviewSection" style="display: none;">
                <!-- 리뷰 내용 -->
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


//장바구니에 상품 추가하는 함수
function addToCart(productId, productName, unitPrice) {
    // 현재 수량 가져오기
    var quantity = parseInt(document.getElementById("quantityDisplay").getAttribute("data-quantity"));
    
    // 장바구니에 추가된 상품 정보 출력
    var message = productName + " 상품이 장바구니에 " + quantity + "개 담겼습니다.";
    alert(message);
}


//주문 버튼 클릭 시 처리하는 함수
function redirectToCheckout(productId) {
    // 현재 수량 가져오기
    var quantity = parseInt(document.getElementById("quantityDisplay").getAttribute("data-quantity"));
    
    // 주문 페이지로 이동하면서 상품 pidx와 수량 정보를 전달
    window.location.href = "testcart.jsp?pidx=" + productId + "&quantity=" + quantity;
}



//수량을 업데이트하고 주문금액을 업데이트하는 함수
function updateQuantity(operation, unitPrice) {
    var quantityElement = document.getElementById("quantityDisplay");
    var currentQuantity = parseInt(quantityElement.getAttribute("data-quantity"));

    // +나 - 버튼에 따라 수량 업데이트
    if (operation === '+' && currentQuantity < 999) {
        currentQuantity++;
    } else if (operation === '-' && currentQuantity > 1) {
        currentQuantity--;
    }

    // 화면에 표시된 수량 및 데이터 속성 업데이트
    quantityElement.innerHTML = currentQuantity;
    quantityElement.setAttribute("data-quantity", currentQuantity);

    // 주문금액 계산 및 화면에 표시된 주문금액 업데이트
    var orderAmount = unitPrice * currentQuantity;
    document.getElementById("orderAmount").innerHTML = orderAmount + "원";
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



