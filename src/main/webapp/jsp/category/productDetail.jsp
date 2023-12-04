<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.sql.DataSource"%>

<%@ include file="connect.jsp"%>

<%
String pidx = request.getParameter("pidx");
%>

<html>
<head>
<jsp:include page="../frame/header.jsp"></jsp:include>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="productDetail.css">
<!-- CSS 파일 포함 -->
<script type="text/javascript" src="productDetail.js"></script>
<!-- JavaScript 파일 포함 -->
<title>제품 상세정보</title>


<style>


   .header-text {
        color: black; /* 텍스트 색상을 검은색으로 설정 */
        text-align: left;
    }

/* styles.css */
.container {
   border-radius: 10px;
   margin-top: 20px;
}

.product-info {
   display: flex;
   align-items: center;
   justify-content: space-between;
   margin-bottom: 20px;
}

.left {
   margin-top: 10px;
   margin-left: 100px;
  
}

.right {
   margin-top: 10px;
   margin-left: 20px;
   padding: 10px 40px;
   background-color: white; /* 둥근 모서리를 가진 하얀색 배경 */
   border-radius: 10px; /* 둥근 모서리 반경 설정 */
}



.product-name{
 margin-top: 30px;

}

 .price-heading {
        margin-top: 30px; /* 여백 크기를 조절할 수 있습니다. */
        /* 다른 스타일을 추가할 수도 있습니다. */
        font-size: 1.5em;
        color: #333;
        /* 필요한 다른 스타일을 추가하세요. */
    }
    
   .option-head {
      margin-top: 20px; /* 여백 크기를 조절할 수 있습니다. */
      /* 다른 스타일을 추가할 수도 있습니다. */
      font-size: 1em;
      color: #333;
      /* 필요한 다른 스타일을 추가하세요. */
  }


.quantity-show{

margin-top :15px;}


.product-info img {
   max-width: 100%;
   max-height: 500px;
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
   margin-top: 20px;
}

.centered-buttons button {
   padding: 10px 20px;
   margin: 10px;
   font-size: 16px;
   background-color: #103E3F;
   color: #ffffff;
   border: none;
   border-radius: 5px;
   cursor: pointer;
}

.centered-buttons button:hover {
   background-color: #FF0000;
}

.description-text, .quantity-button {
   font-size: 16px;
}

.quantity-button {
   margin: 0 5px;
   border: none;
   cursor: pointer;
   border-radius: 5px;
}

.quantity-button:hover {
   background-color: #2980b9;
}

.quantity-button.minus {
   background-color: #2ecc71;
}

.quantity-button.minus:hover {
   background-color: #27ae60;
}

.quantity-button.plus {
   background-color: #e74c3c;
}

.quantity-button.plus:hover {
   background-color: #c0392b;
}

.quantity-show {
   font-size: 16px;
}



/* 장바구니와 주문하기 버튼 스타일 */
.cart-button, .checkout-button {
    padding: 10px 20px;
    margin: 10px;
    font-size: 16px;
    background-color: #ffffff; /* 흰색 배경색 */
    color: #000000; /* 흰색 텍스트 색상 */
    border: none;
    border-radius: 10px; /* 둥근 끝 설정 */
    cursor: pointer;
}

.cart-button:hover, .checkout-button:hover {
    background-color: #2ecc71; /* 진한 초록색 */
}


</style>




</head>
<body>

   <jsp:include page="../frame/menu.jsp" />

  
         <%
         Connection connection = null;
         PreparedStatement pstmt = null;
         ResultSet resultSet = null;

         try {
            connection = getConnection();

            // 동적 SQL 쿼리
            String query = "SELECT pidx, pname, price, descriptor,  category,categoryDetail, image ,flag FROM products WHERE pidx = ?";
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
               String category = resultSet.getString("category");
               String categoryDetail = resultSet.getString("categoryDetail");
               
               String image = resultSet.getString("image");
               int flag = resultSet.getInt("flag");
               int quantity = 1; // 실제 수량 값으로 대체 가능

               String flag1 = null;
               String flag2 = null;
               String flag3 = null;

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


<div class="container">
        <div class="row">
            <div class="col-md-12 text-center jumbo">
                <h2 class="header-text">
           
					               <%=category%> > <%=categoryDetail%>
			
                	
                </h2>
            </div>
        </div>
        </div>
        
            <hr class="custom-hr1"> <!-- custom-hr1 클래스를 적용하여 가로선 추가 -->
         


 
  <div class="container">
      <div class="row">
 
         <!-- Product Information Section -->
         <div class="col-md-5 left">



            <img src="../../resources/images/<%=image%>" alt="<%=pname%>"
               class="img-fluid">



         </div>



         <div class="col-md-4 right"
            style="display: flex; flex-direction: column; align-items: center; text-align: center;">

            <h2 class="product-name"><%=pname%></h2>
            <h3 class="price-heading">
    		가격:
   			 <%=price%>원
			</h3>


            <!-- Display options only if flag values are available -->
            <%
            if (flag1 != null && flag2 != null && flag3 != null) {
            %>
            <div class="options-section">
               <p class="option-head">옵션</p>
               <label> <input type="radio" name="option"
                  value="<%=flag1%>" checked> <span><%=flag1%></span>
               </label> <label> <input type="radio" name="option"
                  value="<%=flag2%>"> <span><%=flag2%></span>
               </label> <label> <input type="radio" name="option"
                  value="<%=flag3%>"> <span><%=flag3%></span>
               </label>
            </div>
            <%
            }
            %>






            <!-- Display the quantity and buttons horizontally -->
            <div class="quantity-section">
               <p class="quantity-show">
                  수량: <span id="quantityDisplay" data-quantity="<%=quantity%>"><%=quantity%></span>
               </p>
               <!-- Quantity adjustment buttons -->
               <button class="quantity-button minus"
                  onclick="updateQuantity('-', <%=price%>)">-</button>
               <button class="quantity-button plus"
                  onclick="updateQuantity('+', <%=price%>)">+</button>
            </div>

            <!-- Display the order amount -->
            <div class="order-amount-section">
               <p>
                  주문금액: <span id="orderAmount"><%=price * quantity%>원</span>
               </p>
            </div>

            <div="row">
               <!-- Cart and Order buttons -->
				<% String loggedInUserId = (String) session.getAttribute("userMidx");
					if(loggedInUserId!=null){ %>
               <button class="cart-button"
                  onclick="addToCart(<%=productId%>, '<%=pname%>', <%=price%>, <%=quantity%>)">장바구니
                  담기</button>
				<%}else{ %>
					<button class="cart-button" onClick="javascript:alert('로그인이 필요합니다.')" >장바구니 담기</button>
				<%} %>
               <button class="checkout-button"
                  onclick="redirectToCheckout(<%=productId%>,'<%=pname%>', <%=price%>, <%=quantity%>)">주문하기</button>

            </div>


         </div>


         <div class="col-md-12 product-info centered-buttons">
            <!-- 상세보기와 리뷰 버튼 -->
            <button onclick="showDetailSection()">상세보기</button>
            <button onclick="showReviewSection(<%=pidx%>)">리뷰</button>


         </div>


      </div>









      <!-- 상세보기 섹션 -->

      <div class="col-md-12 detail-section text-center" id="detailSection">
         <!-- 상세보기 내용 -->
         <p class="description-text">
            🎁<%=descriptor%>🎁
         </p>
      </div>

      <!-- 리뷰 섹션 -->
      <div class="col-md-12 review-section text-center" id="reviewSection"
         style="display: none; max-width: 1000px; margin: 0 auto;">
         <!-- 리뷰 내용 -->
      </div>


   </div>



   <%
   }
   } catch (SQLException e) {
   e.printStackTrace();
   } finally {
   // 리소스 해제
   if (resultSet != null)
   resultSet.close();
   if (pstmt != null)
   pstmt.close();
   if (connection != null)
   connection.close();
   }
   %>




   <jsp:include page="../frame/footer.jsp" />
</body>
</html>
<script>


// 장바구니에 상품 추가하는 함수
function addToCart(productId, productName, unitPrice) {
	


    // 현재 수량 가져오기
    var quantity = parseInt(document.getElementById("quantityDisplay").getAttribute("data-quantity"));

 
    // 선택된 옵션 가져오기
    var optionElement = document.querySelector('input[name="option"]:checked');
  var option = optionElement ? optionElement.value : null;


    // 상품 정보 및 선택된 옵션을 alert로 표시
    var message =  productName + " 상품이 장바구니에 " + quantity + "개 담겼습니다.";
    alert(message);
    
    
    
    
 // 데이터를 전송할 값을 설정
    var productId2 = productId;
    var quantity2 = quantity;
    var option2 = option;

    // 동적으로 form 엘리먼트 생성
    var form = document.createElement('form');
    form.action = 'addToCart.jsp';
    form.method = 'post';

    // hidden input 엘리먼트 생성 후 form에 추가
    var productIdInput = document.createElement('input');
    productIdInput.type = 'hidden';
    productIdInput.name = 'productId';
    productIdInput.value = productId2;
    form.appendChild(productIdInput);

    var quantityInput = document.createElement('input');
    quantityInput.type = 'hidden';
    quantityInput.name = 'quantity';
    quantityInput.value = quantity2;
    form.appendChild(quantityInput);

    var optionInput = document.createElement('input');
    optionInput.type = 'hidden';
    optionInput.name = 'option';
    optionInput.value = option2;
    form.appendChild(optionInput);

    // form을 body에 추가하고 submit
    document.body.appendChild(form);
    form.submit();

    
    
  
}
    
    
    
    
    
    
    


// 주문 버튼 클릭 시 처리하는 함수
function redirectToCheckout(productId, productName, unitPrice) {



    // 현재 수량 가져오기
    var quantity = parseInt(document.getElementById("quantityDisplay").getAttribute("data-quantity"));

 
    // 선택된 옵션 가져오기
    var optionElement = document.querySelector('input[name="option"]:checked');
  var option = optionElement ? optionElement.value : null;


   
    
    
    
    
 // 데이터를 전송할 값을 설정
    var productId2 = productId;
    var quantity2 = quantity;
    var option2 = option;

    // 동적으로 form 엘리먼트 생성
    var form = document.createElement('form');
    form.action = 'order.jsp';
    form.method = 'post';

    // hidden input 엘리먼트 생성 후 form에 추가
    var productIdInput = document.createElement('input');
    productIdInput.type = 'hidden';
    productIdInput.name = 'productId';
    productIdInput.value = productId2;
    form.appendChild(productIdInput);

    var quantityInput = document.createElement('input');
    quantityInput.type = 'hidden';
    quantityInput.name = 'quantity';
    quantityInput.value = quantity2;
    form.appendChild(quantityInput);

    var optionInput = document.createElement('input');
    optionInput.type = 'hidden';
    optionInput.name = 'option';
    optionInput.value = option2;
    form.appendChild(optionInput);

    // form을 body에 추가하고 submit
    document.body.appendChild(form);
    form.submit();

    
    
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






