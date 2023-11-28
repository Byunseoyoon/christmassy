<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String userId = (session != null) ? (String) session.getAttribute("userId") : null;
%>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <!-- 왼쪽에 CHRISTMASSY 표시 -->
            <a class="navbar-brand" href="home.jsp">CHRISTMASSY</a>

            <!-- 오른쪽에 네비게이션 메뉴들 표시 -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../customerservice/serviceMain.jsp">Help</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">MyPage</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Cart</a>
                    </li>
                    <li class="nav-item">
                        <%
					            if (userId != null) {
					                // 로그인된 상태라면 로그아웃 버튼 표시
					        %>
					                <a class="nav-link" href="logout.jsp">Logout</a>
					        <%
					            } else {
					                // 로그인되지 않은 상태라면 로그인 버튼 표시
					        %>
					                <a class="nav-link" href="login.jsp">Log in</a>
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

