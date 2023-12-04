
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>

<%@ include file="connect.jsp" %>

<%
String pidx = request.getParameter("pidx");
%>

<html>
<head>

<title>Review</title>
    
    <style>
    .product-container {
    display: flex;
    flex-direction: row; /* 요소들을 가로로 배열하도록 설정 */
    margin-bottom: 10px; /* 필요에 따라 조절하세요 */
}

.rating, .id, .comment {
    margin-right: 10px; /* 요소들 사이의 간격 조절 */
}
    
    
     table {
    width: 100%;
    border-spacing: 0;
    border-radius: 10px; /* 둥글게 만들기 */
    overflow: hidden;
    border: 1px solid #d3d3d3;
    margin-top: 20px; /* 상단 여백 추가 */
    background-color: white;
}
     	
  th, td {
    border-bottom: 1px solid #d3d3d3;
    padding: 15px;
    text-align: center;
    color: #115A5B;
}

th {
    background-color: #115A5B;
    color: white;
}
    
    
.rating {
    min-width: 200px; /* 최소 너비를 원하는 값으로 조절하세요 */
    text-align: center; /* 별표시를 중앙 정렬합니다 */
}

.rating span {
    display: inline-block; /* 별표시를 가로로 나열합니다 */
}
    
    
    </style>
    
    
</head>
<body>

<table>
 <tr>
      <th>별점</th>
      <th>아이디</th>
      <th>코멘트</th>
     
    </tr>


   
   
    <%
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();

            // SQL 쿼리 동적 
            String query = "SELECT star, comment ,id FROM review WHERE pidx = ?";
            pstmt = connection.prepareStatement(query);
            pstmt.setString(1, pidx);
            System.out.println("실행된 쿼리: " + pstmt.toString());
            resultSet = pstmt.executeQuery();
    %>


   
        <%
            while (resultSet.next()) {
                int star = resultSet.getInt("star");
                String comment = resultSet.getString("comment");
                String id = resultSet.getString("id");
                
        %>
<tr>
   
<td class="rating">
    <span>
        <% 
        switch (star) {
            case 1:
                out.print("🎅🏻");
                break;
            case 2:
                out.print("🎅🏻🎅🏻");
                break;
            case 3:
                out.print("🎅🏻🎅🏻🎅🏻");
                break;
            case 4:
                out.print("🎅🏻🎅🏻🎅🏻🎅🏻");
                break;
            case 5:
                out.print("🎅🏻🎅🏻🎅🏻🎅🏻🎅🏻");
                break;
            default:
                // 예외 처리 등을 원하는 대로 추가할 수 있습니다.
                break;
        }
        %>
    </span>
</td>

        
        
        <td class="id"> <%=id%></td>
        
            <td class="comment"> <%=comment%></td>
    </tr>  

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
    

</table>


</body>
</html>
