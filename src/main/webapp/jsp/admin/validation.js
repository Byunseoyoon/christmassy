function CheckAddProduct() {
	
	var name = document.getElementById("pname");
	var unitPrice = document.getElementById("price");
	var unitsInStock = document.getElementById("stock");
	var category = document.getElementById("category");
	var categoryDetail = document.getElementById("categoryDetail");
	
	
	//상품명 체크
	if (name.value.length < 4 || name.value.length > 12) {
		alert("[상품명]\n최소 4자에서 최대 12자까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}
	//카테고리 체크
	if (category.value.length==0) {
		alert("[카테고리]\n카테고리명을 입력하세요");
		category.select();
		category.focus();
		return false;
	}
	//카테고리 명 체크
	if (categoryDetail.value.length==0) {
		alert("[상세카테고리]\n상세 카테고리 명을 입력하세요");
		categoryDetail.select();
		categoryDetail.focus();
		return false;
	}
	//상품 가격 체크
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	if (unitPrice.value < 0) {
		alert("[가격]\n음수는 입력할 수 없습니다");
		unitPrice.select();
		unitPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice,
	         "[가격]\n소수점 둘째 자리까지만 입력하세요"))
		return false;
		
	//재고 수 체크
	if (isNaN(unitsInStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
	function check(regExp, e, msg) {
		
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.newProduct.submit()
}