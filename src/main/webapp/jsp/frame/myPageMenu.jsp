<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <style>
        /* 노멀라이즈 시작 */
		body, ul, li {
		  margin: 0;
		  padding: 0;
		  list-style: none;   	    /* 해당 태그의 list-style을 none으로 하는 것으로 ●을 제거한다 */
		}
		
		a {
		  color: black;   	    /* 부모 엘리먼트의 값을 물려받는다 */
		  text-decoration: none;    /* 해당 태그의 text-decoration 속성을 none 값으로 하는 것으로 밑줄을 제거한다 */
		  text-align: center;
		}
		/* 노멀라이즈 끝 */
		/* 2차 이상의 메뉴를 숨기기 */
		.side-bar > ul ul {
		  display: none;
		}
		
		/* 사이트의 높이를 5000px로 만들어 스크롤 생성 */
		body {
		  height: 5000px;
		}
		
		/* 사이드바의 너비와 높이를 변수를 통해 통제 */
		:root {
		  --side-bar-width: 200px;
		  --side-bar-height: 90vh;
		}
		
		.side-bar {
		  position: fixed;    /* 스크롤을 따라오도록 지정 */
		  background-color: inherit;
		  border-style: solid;
  		  border-color: #194F35;
		  width: var(--side-bar-width);		  
		  margin-top: calc((100vh - var(--side-bar-height)) / 2);    /* 사이드바 위와 아래의 마진을 동일하게 지정 */
		  margin-left: calc((100vh - var(--side-bar-height)) / 2); 
		  border-radius: 0px 0px 20px 20px;	
		  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
		}
		
		
		/* 모든 메뉴의 a에 속성값 부여 */
		.side-bar ul > li > a {
		  display: block;
		  color:#194F35;
		  text-decoration: none; 
		  font-size: 1rem;
		  font-weight: bold;
		  padding-top: 20px;
		  padding-bottom: 20px;
		  padding-left: 50px;
		  text-align: center;
		}
		
		/* 자식의 position이 absolute일 때 자식을 영역 안에 가두어 준다 */
		.side-bar > ul > li {
		  position: relative;
		  text-align: center;
		}
		
		/* 모든 메뉴가 마우스 인식 시 반응 */
		.side-bar ul > li:hover > a {
		  background-color: rgba(25, 79, 53, 0.32);
		  border-bottom: 1px solid #999;
		  color:white;
		} 
		

    </style>
</head>
<body>
	<aside class="side-bar">
	  	<section class="side-bar__icon-box">
		    <section class="side-bar__icon-1">
		      	
		    </section>
	  	</section>
	  	
	  	<ul>
		    <li>
		      <a href="#" style=" background-color: #194F35; color:white;"> 마이페이지</a>
		    </li>
		    <li>
		      <a href="../mypage/userInfo.jsp">회원정보</a>
		    </li>
		    <li>
		      <a href="../mypage/cart.jsp">장바구니</a>
		    </li>
		    <li>
		      <a href="../mypage/shippingInfo.jsp">구매목록</a>
		    </li>
		</ul>
	</aside>
</body>
</html>
