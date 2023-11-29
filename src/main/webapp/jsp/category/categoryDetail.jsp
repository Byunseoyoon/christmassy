
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>

<%@ include file="connect.jsp" %>

<%
String categoryDetail = request.getParameter("categoryDetail");
%>

<html>
<head>
<jsp:include page="../frame/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="categoryDetail.css"> <!-- Include the CSS file -->
<script type="text/javascript" src="categoryDetail.js"></script> <!-- Include the JavaScript file -->
<title><%=categoryDetail %></title>
    
</head>
<body>

    <jsp:include page="../frame/menu.jsp" />

       

  <div class="container">
        <div class="row">
            <div class="col-md-12 text-center jumbo">
                <h1><%=categoryDetail%></h1>
            </div>
        </div>
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

        try {
            connection = getConnection();

            // SQL 쿼리 동적 
            String query = "SELECT pidx, pname, price, descriptor, image FROM products WHERE categoryDetail = ?";
            pstmt = connection.prepareStatement(query);
            pstmt.setString(1,categoryDetail);
            System.out.println("실행된 쿼리: " + pstmt.toString());
            resultSet = pstmt.executeQuery();
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

   <div class="col-5 ml-4 mr-4 mb-3 product-container" onclick="redirectToProductDetail('<%=pidx%>')"
     style="display: flex; flex-direction: column; align-items: center;">
    <img src="../../resources/images/<%=image%>" style="width: 350px; height: 350px;" />
    <h4 style="margin-top: 10px;"><%=pname%></h4>
    <p>가격: <%=price%>원</p>
    <p>설명: <%=descriptor%></p>
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
