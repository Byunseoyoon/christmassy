<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <style>
        .bg-dark {
            background-color: #F4EEEE !important; /* 상단바 배경색 */
        }
        .navbar-brand {
            color: white; /* 상단바 로고 글자색 */
        }
        .navbar-nav .nav-item .nav-link {
            color: #194F35; /* 메뉴 글자색 */
        }
        .navbar-nav .nav-item .nav-link:hover {
            color: #F4EEEE; /* 메뉴 호버 시 글자색 */
        }
        .navbar-nav .nav-item {
        	margin: 0 30px; /* 왼쪽과 오른쪽 여백을 설정할 값 */
    	}
    </style>
</head>
<body>
    <nav class="navbar navbar-expand navbar-dark bg-dark">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="../main/home.jsp">Home</a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#">상품</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">마이페이지</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">고객센터</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>
