<%@ page contentType="text/html; charset=utf-8" %>
<style>
  @font-face {
        font-family: 'JollyLodger-Regular'; /* 사용하고자 하는 글꼴 이름 */
        src: url('../../resources/font/JollyLodger-Regular.ttf') format('truetype'); /* 글꼴 파일 경로 및 형식 */
    }
  .footer {
    text-align: center;
    align-items: center;
    justify-content: center;
    position: relative;
    overflow: hidden;
    width: 100%;
    height: 0;
    padding-bottom: 60%;
    background-image: url('../../resources/images/footer.png');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    margin-top: 100px;
    display: flex;
    flex-wrap: wrap;
  }

  .footer-overlay {
    position: absolute;
    top: 0;
    left: 15%;
    bottom: 0;
    display: flex;
    align-items: center;
    justify-content: flex-end;
    color: white;
    font-size: 18px;
    flex-wrap: wrap;
    width: 80%;
    height: 80%;
  }

  .footer-column {
    flex: 1;
    text-align: right;
  }

  .footer-link {
    color: #E3D5C8;
    text-decoration: none;
    display: block;
    margin-bottom: 5px;
    text-align:right;
  }
  .title_footer {
    color: #E3D5C8;
    font-size: 30px;
    font-family: 'JollyLodger-Regular', sans-serif; 
  }
</style>

<div class="footer">
  <div class="footer-overlay">
    <div class="footer-column">
      <div class="title_footer"><%="Products"%></div>
      <a href="../category/categoryDetail.jsp?category=크리스마스&categoryDetail=트리" class="footer-link">크리스마스</a>
      <a href="../category/categoryDetail.jsp?category=파티용품&categoryDetail=코스튬" class="footer-link">파티용품</a>
      <a href="../category/categoryDetail.jsp?category=의류&categoryDetail=옷" class="footer-link">의류</a>
      <a href="../category/categoryDetail.jsp?category=기타&categoryDetail=포장" class="footer-link">기타</a>
    </div>
    <div class="footer-column">
      <div class="title_footer"><%="Help"%></div>
      <a href="../customerservice/writeQuestion.jsp" class="footer-link">문의하기</a>
      <a href="../customerservice/question.jsp" class="footer-link">문의게시판</a>
      <a href="../customerservice/serviceMain.jsp" class="footer-link">FAQ</a>
      <a href="../customerservice/terms.jsp" class="footer-link">이용약관</a>
    </div>
    <div class="footer-column">
      <div class="title_footer"><%="Mypage"%></div>
      <a href="../mypage/userInfo.jsp" class="footer-link">회원정보</a>
      <a href="../mypage/cart.jsp" class="footer-link">장바구니</a>
      <a href="../mypage/buyList.jsp" class="footer-link">주문목록</a>
    </div>
  </div>
</div>