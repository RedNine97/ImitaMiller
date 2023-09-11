<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>고품격 가구 브랜드 이미타밀러</title>
        <link rel="icon" type="img/x-icon" href="img/favicon.png"/>

        <!-- 글꼴 -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Sunflower:wght@500&display=swap" rel="stylesheet">
        
        <!-- Core theme CSS (includes Bootstrap)-->
	<link href="css/styles.css" rel="stylesheet" />
	
	<!-- top.jsp -->
	<jsp:include page="header.jsp" flush="false" />
</head>
<body>
    <div class="container py-6">
        <div class="row d-flex flex-column flex-md-row">
            <!-- 상품 이미지 -->
            <div class="col col-lg-6">
                <img src="${productList.imgpath}" class="img-fluid" alt="img">
            </div>
            <!-- 상품 내용 -->
            <div class="col col-lg-6 ps-5">
                <!-- 상품 이름 -->
                <div class="border-bottom p-3"><h4>${productList.pname}</h4></div>
                <!-- 상품 사이즈, 소재, 종류 -->
                <div class="row border-bottom text-muted p-3">
                    <div class="col col-lg-4"><p>사이즈</p>
                        <p>소재</p>
                        <p>종류</p>
                        <p>배송비</p>
                    </div>
                    <div class="col col-lg-8"><p>${productList.psize}</p>
                        <p>${productList.pfinishing}</p>
                        <p>${productList.ptype}</p>
                        <p>무료배송</p>
                    </div>
                </div>
                <!-- 가격 -->
                <div class="row border-bottom p-3">
                    <div class="col col-lg-4"><h5>가격</h5></div>
                    <div class="col col-lg-8 text-end">
                    	<h5>
                    		<em class="price not-italic tracking-tighter">
			            		<fmt:formatNumber value="${productList.pprice}" pattern="###,###,###" />
			            	</em><span class="text-xs">원</span>
			            </h5>
                    </div>
                </div>
                <div class="card-footer p-3">
                    <div class="text-center"><a class="btn btn-outline-dark mt-auto w-50 p-3 py-2 fs-5" href="#">바로구매</a></div>
                </div>
            </div>
            
            <!-- 다른 제품보기 -->
            <div class="pb-4 pt-5">
                <h5 class="nanum fw-normal">다른제품보기</h5>
            </div>
			<div class="row gx-2 gx-lg-3 row-cols-4 row-cols-md-6 row-cols-xl-6 flex-nowrap overflow-auto" style="max-width: 100%;">
			    <c:forEach var="dp" items="${differentProduct}">
			        <div class="col mb-3">
			            <a href="./product_detail.shop?pID=${dp.pID}&pageNum=${pgList.currentPage}"
			               class="d-block overflow-hidden position-relative my-custom-link-style">
			                <div class="card h-100">
			                    <!-- 상품 이미지-->
			                    <img class="card-img-top img-fluid" src="${dp.imgpath}" style="object-fit: contain; height: 100%;" />
			                    <!-- 상품 내용-->
			                    <div class="card-body p-0">
			                        <div class="text-start ms-2 ps-0 d-flex flex-column justify-content-between" style="height: 100%;">
			                            <!-- 상품 이름-->
			                            <p class="text-muted fs-6 ms-1 small-text">${dp.pname}</p>
			                            <!-- 상품 가격-->
			                            <p class="fs-6">
			                                <em class="price not-italic tracking-tighter">
			                                    <fmt:formatNumber value="${dp.pprice}" pattern="###,###,###" />
			                                </em>
			                            </p>
			                        </div>
			                    </div>
			                </div>
			            </a>
			        </div>
			    </c:forEach>
			</div>
			<!-- 사이즈 이미지 -->
            <div class="text-center py-6">
                <h1 class="nanum display-6 border-top border-2 border-dark py-5 ">SIZE</h1>
                <img src="${productList.psizemgpath}" class="img-fluid" alt="img">
            </div>
            <!-- 교환/반품 안내 -->
            <div class="py-6">
                <h1 class="nanum display-6 pb-3">교환/반품 안내</h1>
                <div class="row border-top border-2 border-dark pt-5 d-flex flex-column flex-md-row">
                    <div class="col pb-4">
                        <p>교환/반품</p>
                        <h3 class="text-danger fw-normal">7일 이내 가능</h3>
                        <p>가구의 특성상 상품개봉 및 조립 후에는 반품 및 교환이 불가합니다.<br>
                            상품의 사이즈와 특성을 반드시 확인하고 주문하십시오.<br>
                            단, 상품하자시 7일내 교환이 가능합니다.</p>
                    </div>
                    <div class="col">
                        <ul>
                            <p class="fw-bolder">교환, 반품시 주의사항</p>
                            <li>고객변심에 의한 교환, 반품일 경우 왕복 배송비는 고객님 부담입니다.</li>
                            <li>왕복 배송비를 차감한 금액은 환불 됩니다.(상품 확인 후 환불)</li>
                            <li>반품비용은 각 상품별로 다릅니다.</li>
                            <li>반품비용을 확인하시고 반드시 두닷 콜센터에 문의하셔야 합니다.</li>
                            <li>상품 수령 후 7일 이내에 교환, 반품이 가능합니다. 7일 이후 반품불가</li>
                        </ul>
                        <ul>
                            <p class="fw-bolder text-danger">교환, 반품이 불가능한 경우</p>
                            <li>상품을 개봉하여 박스가 심히 훼손되었거나, 조립 및 설치 후에는 재판매가 불가능하므로 교환, 반품이 불가능합니다.(박스 개봉시 주의요망)</li>
                            <li>밀봉된 상품은 뜯으면 교환, 반품이 불가합니다. (예: 택배발송 상품류)</li>
                            <li>주문 제작 상품의 경우(소파 등 일부 상품) 결제 완료 후 단순 변심으로 인한 취소가 불가합니다. 부득이한 경우 취소시 위약금이 발생될 수 있습니다.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
      </div>
    <!-- footer.jsp-->
	<jsp:include page="footer.jsp" flush="false" />

	<!-- feedback.jsp-->
	<jsp:include page="feedback.jsp" flush="false" />
	<!-- Bootstrap core JS-->
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>