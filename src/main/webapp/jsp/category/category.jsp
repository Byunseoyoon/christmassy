<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../frame/header.jsp"></jsp:include>
<meta charset="UTF-8">
<title>카테고리</title>


</head>
<body>
<style>
    .category-container {
        
        border-radius: 10px; /* 적절한 값으로 조절하세요 */
        padding: 0px; /* 내용과의 간격을 조절하세요 */
        text-align: left; /* 전체 텍스트를 왼쪽 정렬로 설정 */
    }


    ul {
        text-align: left; /* 리스트 텍스트를 왼쪽 정렬로 설정 */
    }

    ul li {
    padding: 0px;
        list-style: none; /* 리스트 마커를 제거하여 왼쪽 정렬을 유지 */
         text-align: left;
    }

    ul li a {
        color: green; /* 원하는 색상으로 조절하세요 */
        font-size: 16px; /* 원하는 크기로 조절하세요 */
    }
</style>

<div class="category-container">
    

    <ul>
        <li>
            🔻크리스마스
            <ul>
                <li><a href="categoryDetail.jsp?category=크리스마스&categoryDetail=트리">트리</a></li>
                <li><a href="categoryDetail.jsp?categoryDetail=오너먼트">오너먼트</a></li>
            </ul>
        </li>
        <li>
            🔻파티용품
            <ul>
                <li><a href="categoryDetail.jsp?categoryDetail=코스튬">코스튬</a></li>
                <li><a href="categoryDetail.jsp?categoryDetail=파티용품">파티용품</a></li>
            </ul>
        </li>
        <li>
            🔻의류
            <ul>
                <li><a href="categoryDetail.jsp?categoryDetail=옷">옷</a></li>
                <li><a href="categoryDetail.jsp?categoryDetail=잡화">잡화</a></li>
            </ul>
        </li>
        <li>
            🔻기타
            <ul>
                <li><a href="categoryDetail.jsp?categoryDetail=포장">포장</a></li>
                <li><a href="categoryDetail.jsp?categoryDetail=소품">소품</a></li>
            </ul>
        </li>
    </ul>
</div>


</body>
</html>