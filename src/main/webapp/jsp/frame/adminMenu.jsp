<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
    	a {
    		color: #115A5B;
    		text-decoration: none;
  		}
    </style>
</head>
<body>
    <div class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <!-- 왼쪽에 CHRISTMASSY 표시 -->
            <a class="navbar-brand" href="../main/home.jsp">CHRISTMASSY</a>

            <!-- 오른쪽에 네비게이션 메뉴들 표시 -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="../admin/adminQuestion.jsp">Q&A</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../admin/adminMembers.jsp">customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../admin/adminProducts.jsp">products</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
