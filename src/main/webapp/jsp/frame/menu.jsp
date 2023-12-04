<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String userId = (session != null) ? (String) session.getAttribute("userId") : null;
%>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
    	.navbar {
    		background-image: url('../../resources/images/bg.png');
		    background-size: 100% auto;
		    background-repeat: repeat-y;
		    height: 100px;
  		}
  		nav {
            display: flex;
            gap: 20px;
        }
        nav a {
        	width: 100%;
            color: #115A5B; 
            text-decoration: none;
            padding: 10px;
            cursor: pointer;
            display: flex;
            align-items: center;
            font-weight: bold;
            font-size: 18px;
        }
        /* 드롭다운 스타일링 */
        .dropdown {
            position: relative;
            display: inline-block;
            
        }
        .dropdown a {
            text-decoration: none;
        }
        .dropdown-content {
            display: none;
            text-decoration: none;
            position: absolute;
            background-color: white;
            min-width: 100px;
            box-shadow: 0 8px 14px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .dropdown-content a {
        	text-decoration: none;
            color: #115A5B;
            padding: 10px 12px;
            display: block;
            cursor: pointer;
            font-size: 15px;
            
        }
    </style>
</head>
<body>
    <div class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <!-- 왼쪽에 CHRISTMASSY 표시 -->
			<a class="navbar-brand" href="../main/home.jsp"> 
				<img src="../../resources/images/christmassy.png">
			</a>
			<nav>
				<div class="dropdown">
		        	<a href="../main/home.jsp">Home</a>
		        </div>
		        <div class="dropdown">
		            <a href="../category/categoryDetail.jsp">Products</a>
		            <div class="dropdown-content">
		                <a href="../category/categoryDetail.jsp?category=크리스마스&categoryDetail=트리">크리스마스</a>
		                <a href="../category/categoryDetail.jsp?category=파티용품&categoryDetail=코스튬">파티용품</a>
		                <a href="../category/categoryDetail.jsp?category=의류&categoryDetail=옷">의류</a>
		                <a href="../category/categoryDetail.jsp?category=기타&categoryDetail=포장">기타</a>
		            </div>
		        </div>
		        <div class="dropdown">
		            <a href="../customerservice/serviceMain.jsp">Help</a>
		            <div class="dropdown-content">
		            	<a href="../customerservice/writeQuestion.jsp">문의하기</a>
		            	<a href="../customerservice/question.jsp">문의목록</a>
		                <a href="../customerservice/serviceMain.jsp">FAQ</a>
		                <a href="../customerservice/terms.jsp">이용약관</a>
		            </div>
		        </div>
		        <div class="dropdown">
		            <a href="../mypage/userInfo.jsp">MyPage</a>
		            <div class="dropdown-content">
		                <a href="../mypage/userInfo.jsp">회원정보</a>
		                <a href="../mypage/cart.jsp">장바구니</a>
		                <a href="../mypage/buyList.jsp">주문목록</a>
		            </div>
		        </div>
		        <div class="dropdown">
		        	<a href="../mypage/cart.jsp">Cart</a>
		        </div>
		        <%
		            if (userId != null) {
		                // 로그인된 상태라면 로그아웃 버튼 표시
		        %>		<div class="dropdown">
		                	<a href="../main/logout.jsp">Logout</a>
		                </div>
		        <%
		            } else {
		                // 로그인되지 않은 상태라면 로그인 버튼 표시
		        %>		<div class="dropdown">
		                	<a href="../main/login.jsp">Log in</a>
		                </div>
		        <%
		            }
		        %>
		    </nav>
        </div>
    </div>
</body>
</html>