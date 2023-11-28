<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<title>고객 센터</title>
<style>
  a {
    color: black;
    text-decoration: none;
  }
  body {
      background-image: url('bg.png');
      background-size: 100% auto;
      background-repeat: repeat-y;
      min-height: 100vh;
  }
  .jumbo {
    	background-color: rgba(255, 255, 255, 0);
    	border: none;
    	padding: 50px;
    	max-width: 1000px;
    	margin:0 auto;
    	text-align: center;
    	color: #115A5B;
	}
  .FAQ {
    	background-color: rgba(255, 255, 255, 0);
    	border: none;
    	padding: 50px;
    	max-width: 1000px;
    	margin:0 auto;
	}
	.QAA {
		color: inherit;
    	text-decoration: none;
    	background-color: rgba(255, 255, 255, 0);
    	border: none;
    	padding: 50px;
    	max-width: 1000px;
    	margin:0 auto;
	}
	.term {
		color: inherit;
    	text-decoration: none;
    	background-color: rgba(255, 255, 255, 0);
    	border: none;
    	padding: 50px;
    	max-width: 1000px;
    	margin:0 auto;
    	margin-bottom: 50px;
	}
	.adminQuestion {
		color: inherit;
    	text-decoration: none;
    	background-color: rgba(255, 255, 255, 0);
    	border: none;
    	padding: 50px;
    	max-width: 1000px;
    	margin:0 auto;
    	margin-bottom: 50px;
	}
</style>
</head>
<body>
	<jsp:include page="../frame/menu.jsp" />
	<div class="jumbo">
		<h1>고객 센터</h1>
	</div>
	<div class="FAQ">
		<h3>FAQ</h3>
		<details>
			<summary>Q. 배송은 언제 되나요?</summary>
			영업일 기준 오후 1시 이전 결제 완료 주문건 :  당일 출고됩니다. (일부 상품 제외)<br>
			공휴일의 경우 다음 영업일에 출고됩니다.<br>
			<p>※ 주문 상품이 재고 부족일 경우 부득이하게 배송 시간은 달라질 수 있는 점 양해 부탁드립니다.
		</details>
		<details>
			<summary>Q. 교환/반품 신청은 어떻게 하나요?</summary>
			수령일 기준 7일 이내에 교환/반품에 대한 청약철회 의사를 밝혀주시면 처리가 가능합니다.<br>
			교환/반품 절차 : 마이페이지 → 주문내역 → 교환/반품 신청 → 수거기사님 방문예정<br>
			구매하신 쇼핑몰에서 신청해주시거나, 고객센터로 신청 부탁드립니다.<br>
			<p>구매하신 제품의 AS를 원하는 경우에도 고객센터로 연락 부탁드립니다.
		</details>
		<details>
			<summary>Q. 교환/반품시 배송비는 어떻게 되나요?</summary>
			단순 변심으로 인한 교환/환불 시 왕복 배송비 발생 됩니다.<br>
			제품 불량으로 인한 교환/환불 시 배송비는 발생되지 않습니다.<br>
			<p>교환으로 인한 차액 발생시 구매하신 쇼핑몰로 문의주시면 도와드리겠습니다.
		</details>
	</div>
	<div class="QAA">
		<a href="question.jsp"><h3>Q&A</h3></a>
	</div>
	<div class="term">
		<a href="terms.jsp"><h3>이용 약관</h3></a>
	</div>
	<div class="adminQuestion">
		<a href="adminQuestion.jsp"><h3>관리자 기능 임시 페이지</h3></a>
	</div>
	<jsp:include page="../frame/footer.jsp" />
</body>
</html> 