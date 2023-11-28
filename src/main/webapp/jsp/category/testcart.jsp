<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
    <title>장바구니 페이지</title>
</head>
<body>

    <h1>장바구니</h1>

    <%
        // URL 파라미터에서 pidx와 quantity 값을 읽어옴
        String pidx = request.getParameter("pidx");
        String quantity = request.getParameter("quantity");

        // pidx와 quantity 값을 Map에 저장
        Map<String, String> productInfo = new HashMap<>();
        productInfo.put("pidx", pidx);
        productInfo.put("quantity", quantity);
    %>

    <div>
        <p>상품 pidx: <%= productInfo.get("pidx") %></p>
        <p>수량: <%= productInfo.get("quantity") %></p>
    </div>

</body>
</html>

