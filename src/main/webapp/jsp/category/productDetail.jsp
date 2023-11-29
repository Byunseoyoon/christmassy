
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
        
        
        
         .left
         {
        margin-top: 100px; /* 적절한 여백 값으로 조절하세요 */
         background-color: white;
        
    }
         
    .right {
        margin-top: 170px; /* 적절한 여백 값으로 조절하세요 */
         background-color: green;
          padding: 10px 40px; /* 위아래 10px, 좌우 20px의 패딩을 가진 버튼 
        
       
        
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
        
         .centered-buttons {
         display: flex;
        justify-content: center;
        margin-top: 20px; /* 상단 여백 조절 */
    }
        
          .centered-buttons button {
        padding: 10px 20px; /* 원하는 패딩 값으로 조절하세요 */
        margin: 10px;
        font-size: 16px; /* 원하는 폰트 크기로 조절하세요 */
        background-color: #103E3F; /* 원하는 배경색으로 조절하세요 */
        color: #ffffff; /* 원하는 텍스트 색상으로 조절하세요 */
        border: none; /* 테두리 제거 */
        border-radius: 5px; /* 버튼 둥글게 만들기 위한 속성 */
        cursor: pointer; /* 커서 모양 변경 */
    }

    .centered-buttons button:hover {
        background-color: #FF0000; /* 마우스 호버 시 배경색 변경 */
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
                    String query = "SELECT pidx, pname, price, descriptor, image ,flag FROM products WHERE pidx = ?";
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
                        int flag = resultSet.getInt("flag");
                        int quantity = 1; // 실제 수량 값으로 대체 가능
                        
                        String flag1=null;
                        String flag2=null;
                        String flag3=null;
                        
                        
                        
                        
                     // flag 값이 0이 아닌 경우에만 flag1, flag2, flag3 값을 가져오기
                        if (flag != 0) {
                        	
                            String flagQuery = "SELECT flag1, flag2, flag3 FROM flag WHERE pidx = ?";
                            try (PreparedStatement flagPstmt = connection.prepareStatement(flagQuery)) {
                                flagPstmt.setInt(1, productId);
                                ResultSet flagResultSet = flagPstmt.executeQuery();

                                if (flagResultSet.next()) {
                                   flag1 = flagResultSet.getString("flag1");
                                     flag2 = flagResultSet.getString("flag2");
                                    flag3 = flagResultSet.getString("flag3");

                                    // flag1, flag2, flag3 값을 사용하여 화면에 출력하거나 다른 작업 수행
                                   
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        
                        
                        
                        
                        
                        
            %>



            <!-- Product Information Section -->
           <div class="col-md-7 left">
           	
               
                
                    <img src="../../resources/images/<%=image%>" alt="<%=pname%>" class="img-fluid">
                
                
               
                </div>
                
                
                
<div class="col-md-4 right"style="display: flex; flex-direction: column; align-items: center; text-align: center;">
				
						<h3><%=pname%></h3>
						<p>
							가격:	<%=price%>원
						</p>
						
						
<!-- Display options only if flag values are available -->
<%
if (flag1 != null && flag2 != null && flag3 != null) {
%>
    <div class="options-section">
        <p>옵션:</p>
        <label>
            <input type="radio" name="option" value="<%=flag1%>" checked>
            <span><%=flag1%></span>
        </label>
        <label>
            <input type="radio" name="option" value="<%=flag2%>">
            <span><%=flag2%></span>
        </label>
        <label>
            <input type="radio" name="option" value="<%=flag3%>">
            <span><%=flag3%></span>
        </label>
    </div>
<%
}
%>

						
						
						
						

						<!-- Display the quantity and buttons horizontally -->
						<div class="quantity-section">
							<p>
								수량: <span id="quantityDisplay" data-quantity="<%=quantity%>"><%=quantity%></span>
							</p>
							<!-- Quantity adjustment buttons -->
							<button onclick="updateQuantity('-', <%=price%>)">-</button>
							<button onclick="updateQuantity('+', <%=price%>)">+</button>
						</div>

						<!-- Display the order amount -->
						<div class="order-amount-section">
							<p>
								주문금액: <span id="orderAmount"><%=price * quantity%>원</span>
							</p>
						</div>

<div ="row">
						<!-- Cart and Order buttons -->
						<button
							onclick="addToCart(<%=productId%>, '<%=pname%>', <%=price%>, <%=quantity%>)">장바구니
							담기</button>
			
			
			
						<button
							onclick="redirectToCheckout(<%=productId%>, <%=quantity%>)">주문하기</button>
</div>
				
			     
           </div>     
            
         
            <div class="col-md-12 product-info centered-buttons">
             <!-- 상세보기와 리뷰 버튼 -->
    <button onclick="showDetailSection()">상세보기</button>
    <button onclick="showReviewSection(<%=pidx%>)">리뷰</button>
            
            
            </div>
           

</div>







             <!-- 상세보기 섹션 -->
    <div class="col-md-12 detail-section" id="detailSection">
        <!-- 상세보기 내용 -->
        <p>설명: <%=descriptor%></p>
    </div>

             <!-- 리뷰 섹션 -->
    <div class="col-md-12 review-section" id="reviewSection" style="display: none;">
        <!-- 리뷰 내용 -->
       
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


// 장바구니에 상품 추가하는 함수
function addToCart(productId, productName, unitPrice) {
    // 현재 수량 가져오기
    var quantity = parseInt(document.getElementById("quantityDisplay").getAttribute("data-quantity"));

    // 선택된 옵션 가져오기
    var selectedOption = document.querySelector('input[name="option"]:checked').value;

    // 상품 정보 및 선택된 옵션을 alert로 표시
    var message = productName + " 상품이 장바구니에 " + quantity + "개 담겼습니다.\n선택된 옵션: " + selectedOption;
    alert(message);
}

// 주문 버튼 클릭 시 처리하는 함수
function redirectToCheckout(productId) {
    // 현재 수량 가져오기
    var quantity = parseInt(document.getElementById("quantityDisplay").getAttribute("data-quantity"));

    // 선택된 옵션 가져오기
    var selectedOption = document.querySelector('input[name="option"]:checked').value;

    // 주문 페이지로 이동하면서 상품 pidx, 수량, 옵션 정보를 전달
    window.location.href = "testcart.jsp?pidx=" + productId + "&quantity=" + quantity + "&option=" + selectedOption;
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



// 옵션 토글을 위한 함수
function toggleOptions() {
    var optionsSection = document.querySelector('.options-section');
    optionsSection.classList.toggle('show-options');
}

// 페이지 로드 시 옵션 토글 함수 호출
window.onload = function() {
    toggleOptions();
};

   
    
    
    
    function showDetailSection() {
        document.getElementById("detailSection").style.display = "block";
        document.getElementById("reviewSection").style.display = "none";
    }

    function showReviewSection(productId) {
        // 리뷰 섹션을 업데이트
        document.getElementById("detailSection").style.display = "none";
        document.getElementById("reviewSection").style.display = "block";

        // review.jsp의 내용을 가져와서 리뷰 섹션에 표시
        fetch('review.jsp?pidx=' + productId) // pidx 값을 추가하여 review.jsp 파일의 경로에 맞게 수정
            .then(response => response.text())
            .then(data => {
                console.log('Review content:', data); // 콘솔에 데이터 출력
                document.getElementById("reviewSection").innerHTML = data;
            })
            .catch(error => {
                console.error('Error fetching review content:', error);
            });
    }

 
</script>



