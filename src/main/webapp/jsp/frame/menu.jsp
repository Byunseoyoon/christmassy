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
  		.navbar-nav.ml-auto .nav-link {
        	color: #115A5B; 
        	font-size: 18px; /* 원하는 글자 크기 */
    		font-weight: bold; /* 원하는 글자 두께 (bold는 굵게, normal은 보통) */
    		margin-right: 20px;
    	}
    	.navbar-nav.ml-auto .nav-item:last-child {
		    margin-right: 0;
		}
    	.navbar-brand img {
		    max-width: 200px;
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

			<!-- 오른쪽에 네비게이션 메뉴들 표시 -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="../main/home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../category/categoryDetail.jsp">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../customerservice/serviceMain.jsp">Help</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../mypage/userInfo.jsp">MyPage</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../mypage/cart.jsp">Cart</a>
                    </li>
                    <li class="nav-item">
                        <%
					            if (userId != null) {
					                // 로그인된 상태라면 로그아웃 버튼 표시
					        %>
					                <a class="nav-link" href="../main/logout.jsp">Logout</a>
					        <%
					            } else {
					                // 로그인되지 않은 상태라면 로그인 버튼 표시
					        %>
					                <a class="nav-link" href="../main/login.jsp">Log in</a>
					        <%
					            }
					        %>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>

