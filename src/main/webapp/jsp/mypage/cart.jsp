<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<jsp:include page="../frame/header.jsp"></jsp:include>
<%
	String cartId = session.getId();
	//변수 선언
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	// 데이터베이스 연결 정보 설정 (MySQL 연결 정보)
   String url = "jdbc:mysql://localhost:3306/christmassyDB?useSSL=false&serverTimezone=UTC";
   String user = "root";
   String password = "980426";
%>
</head>
<style>
  :root {
		  --main-box-height: 90vh;
	}
  div{ 
  	color: #194F35;
  }
  .mypage-container{
  	border-style: solid;
  	border-width : 1.5px;
  	border-color: #194F35;
  	border-radius: 5px;
  	width: var(--main-box-width);		  
	margin-top: calc((100vh - var(--main-box-height)) / 2);    /* 사이드바 위와 아래의 마진을 동일하게 지정 */
  	margin-left : 260px;
  	margin-right : 40px;
  	padding: 50px;
  }
  
  .box{
  	border-bottom-width : 1px;
  	border-bottom-style: solid;
  	margin: 20px;
  }
  .box-item{
  	margin-left:35%;
  }
  .item{
  	display: inline-block;
  	margin-left:5%;
  }
   
  .box-title{
  	font-size: 1rem;
  	text-align: center;
  	font-weight:bold;
  }
  
</style>
	<jsp:include page="../frame/menu.jsp" />
	<jsp:include page="../frame/myPageMenu.jsp" />
	
	<body>
	<%
	   try {
	      // JDBC 드라이버 로딩 (MySQL 드라이버)
	      Class.forName("com.mysql.cj.jdbc.Driver");
	      
	      // 데이터베이스 연결
	      conn = DriverManager.getConnection(url, user, password);
	
	      // SQL 쿼리 (MySQL 쿼리)  //세션에 사용자 정보 저장하고 where 값 받아오기
	      String sql = "SELECT * FROM members WHERE midx = '1'";
	      
	      // 쿼리 실행
	      stmt = conn.createStatement();
	      rs = stmt.executeQuery(sql);
	      
	      if (rs.next()) {
	    	    
	    	} else {
	    	    out.println("데이터가 없습니다.");
	    	}
	%>
	<div class="main-box">
		<div class="mypage-container">
			<div class="box-title">장바구니</div>

		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%= cartId %>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%				
					int sum = 0;
					ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Product>();

					for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
						Product product = cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity();
						sum = sum + total;
				%>
				<tr>
					<td><%=product.getProductId()%> - <%=product.getPname()%></td>
					<td><%=product.getUnitPrice()%></td>
					<td><%=product.getQuantity()%></td>
					<td><%=total%></td>
					<td><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
					<th></th>
				</tr>
			</table>
			<a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
	

<%
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      // 자원 해제
      if (rs != null) try { rs.close(); } catch(Exception e) {}
      if (stmt != null) try { stmt.close(); } catch(Exception e) {}
      if (conn != null) try { conn.close(); } catch(Exception e) {}
   }
%>
	</div>
</div>
	
	<jsp:include page="../frame/footer.jsp" />
</body>
</html>