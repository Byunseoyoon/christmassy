<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>

<%@ include file="connect.jsp" %>

<%
String category = request.getParameter("category");
String categoryDetail = request.getParameter("categoryDetail");

%>

<html>
<head>
<jsp:include page="../frame/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>


<script type="text/javascript" src="categoryDetail.js"></script> <!-- Include the JavaScript file -->
<title><%=categoryDetail %></title>
    
    <style>
    
    
.product-container {
    width: 48%;
    margin: 1%;
    float: left;
    margin-bottom: 20px; /* Adjust the spacing as needed */ 
    margin-left : 40px;
      display: flex;
    flex-direction: column;
    align-items: center;
       cusor: pointer;
   
}

.product-container img {
    width: 200px;
    height: 200px;
  
}




    .header-text {
        color: black; /* 텍스트 색상을 검은색으로 설정 */
        text-align: left;
    }

 a {
    color: black;
    text-decoration: none;
  }

/* style.css 또는 해당 JSP 페이지의 <style> 태그 내에 추가 */
#categoryContainer {
    max-width: 150px; /* 최대 너비를 설정 (원하는 값으로 변경) */
    max-height: 150px;
    margin: 10px; /* 여백 설정 (원하는 값으로 변경) */
}


 .jumbo {
background-color: rgba(255, 255, 255, 0);
    	
    	border: none;
    	padding: 0px;
    	max-width: 1000px;
    	margin:0 auto;
    	
    	color: #115A5B;
    	   margin-top: 15px; /* Adjust the top margin as needed */
    margin-bottom: 5px; /* Adjust the bottom margin as needed */
	}
	
	.jumbo h1 {
    font-size: 3em; /* Adjust the font size as needed */
    
}

    .custom-hr1 {
        border-width: 2px; /* 굵기를 조절합니다. */
            border-color: rgba(0, 0, 0, 0.3); /* 검은색과 30% 투명도를 지정합니다. */
    }
    
    .product-name {
    margin-top: 10px;
    /* 다른 스타일을 추가하세요 */
}

.product-price {
    /* 다른 스타일을 추가하세요 */
}

.product-description {
    /* 다른 스타일을 추가하세요 */
}
    

</style>
    
    
</head>
<body>

    <jsp:include page="../frame/menu.jsp" />

       

  <div class="container">
        <div class="row">
            <div class="col-md-12 text-center jumbo">
                <h2 class="header-text">
                
                
                
                 <%
					            if (category != null) {
					                // 로그인된 상태라면 로그아웃 버튼 표시
					        %>
					               <%=category%> > <%=categoryDetail%>
					        <%
					            } else {
					                // 로그인되지 않은 상태라면 로그인 버튼 표시
					        %>
					               전체
					        <%
					            }
					        %>
                
                
                
                
                	
                </h2>
            </div>
        </div>
        
            <hr class="custom-hr1"> <!-- custom-hr1 클래스를 적용하여 가로선 추가 -->
         
        <div class="row">
<div class="col-md-2" style="padding-left: 5px; padding-right: 5px;">
    <div id="categoryContainer" style="max-width: 200px; margin: 10px;">
        <jsp:include page="category.jsp" />
    </div>
</div>


    <%
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet resultSet = null;
        String query = null;

        try {
            connection = getConnection();

            if(categoryDetail==null){
            	query = "SELECT pidx, pname, price, descriptor, image FROM products";
                pstmt = connection.prepareStatement(query);
                System.out.println("실행된 쿼리: " + pstmt.toString());
                resultSet = pstmt.executeQuery();
            }else{
	            // SQL 쿼리 동적 
	            query = "SELECT pidx, pname, price, descriptor, image FROM products WHERE categoryDetail = ?";
	            pstmt = connection.prepareStatement(query);
	            pstmt.setString(1,categoryDetail);
	            System.out.println("실행된 쿼리: " + pstmt.toString());
	            resultSet = pstmt.executeQuery();
            }
    %>


            <div class="col-md-10 ">
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

<div class="col-3 product-container" style="cursor:pointer;" onclick="redirectToProductDetail('<%=pidx%>')">
    <img src="../../resources/images/<%=image%>" class="product-image" />
    <h8 class="product-name"><%=pname%></h8>
    <p class="product-price">가격: <%=price%>원</p>

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
            </div>
        </div>
    </div>




    <div class="container">
        <hr>
    </div>
    <jsp:include page="../frame/footer.jsp" />
</body>
</html>
