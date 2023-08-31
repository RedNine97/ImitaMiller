<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>고품격 가구 브랜드 이미타밀러</title>
        <link rel="icon" type="image/x-icon" href="img/favicon.png"/>
        
        <!-- 글꼴 -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        
    	<!-- top.jsp -->
    	<jsp:include page="header.jsp" flush="false" />
    </head>
     <body id="page-top">
        
        <!-- slide -->
        <div class="container">
            <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                  <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                  <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="3" aria-label="Slide 4"></button>
                </div>
                <div class="carousel-inner">
                  <div class="carousel-item active" data-bs-interval="5000">
                  	<a class="" href="#page-best">
                    	<img src="img/slide/slide1.png" class="d-block w-100" alt="...">
                    </a>
                  </div>
                  <div class="carousel-item" data-bs-interval="4000">
                  	<a class="" href="#product_page">
                    	<img src="img/slide/slide2.png" class="d-block w-100" alt="...">
                    </a>
                  </div>
                  <div class="carousel-item" data-bs-interval="4000">
                  	<a class="" href="./ProductList.shop?search=서재&searchtext=책상/테이블">
                    	<img src="img/slide/slide3.png" class="d-block w-100" alt="...">
                    </a>
                  </div>
                  <div class="carousel-item" data-bs-interval="4000">
                  	<a class="" href="./ProductList.shop?search=거실&searchtext=소파">
                    	<img src="img/slide/slide4.png" class="d-block w-100" alt="...">
                    </a>
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
        </div>
        <!-- 베스트 상품 -->
        <div class="container" id="page-best">
            <section class="py-5">
                <div class="text-center">
                    <h1 class="sunflower pt-5">베스트 상품</h1>
                </div>
                <div class="container px-4 px-lg-5 mt-5">
                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    	<c:forEach var="b" items="${best}">
	                        <div class="col mb-5">
	                            <div class="card h-100">
	                                <!-- 배지 -->
	                                <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Best</div>
	                                <!-- 상품 이미지-->
	                                <img class="card-img-top" src="${b.imgpath}.jpg" alt="..." />
	                                <!-- 상품 내용-->
	                                <div class="card-body p-4">
	                                    <div class="text-center">
	                                        <!-- 상품 이름-->
	                                        <p class="fw-bolder">${b.pname}</p>
	                                        <!-- 상품 가격-->
	                                        <em class="price not-italic tracking-tighter">
							            		<fmt:formatNumber value="${b.pprice}" pattern="###,###,###" /> </em><span class="text-xs">원</span>
	                                    </div>
	                                </div>
	                                <!-- 상품 링크-->
	                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="./ProductDetail.shop?pID=${b.pID}">자세히 보기</a></div>
	                                </div>
	                            </div>
	                        </div>
                    	</c:forEach>  
                    </div>
                </div>
            </section>
        </div>
        
        <!-- 오피스의자, 식탁, 소파 -->
        <div class="container py-5" id="product_page">
          <ul class="nav nav-pills nav-justified flex-column flex-sm-row border rounded">
            <li class="nav-item">
              <a class="flex-sm-fill text-sm-center nav-link active" data-bs-toggle="tab" data-bs-target="#chair" type="button" role="tab" aria-controls="chair" aria-selected="true">오피스의자</a>
            </li>
            <li class="nav-item">
              <a class="flex-sm-fill text-sm-center nav-link" data-bs-toggle="tab" data-bs-target="#kitchen" type="button" role="tab" aria-controls="kitchen" aria-selected="false">식탁</a>
            </li>
            <li class="nav-item">
              <a class="flex-sm-fill text-sm-center nav-link" data-bs-toggle="tab" data-bs-target="#living" type="button" role="tab" aria-controls="living" aria-selected="false">소파</a>
            </li>
          </ul>
          <!-- 의자(오피스의자) -->
          <div class="tab-content">
              <div class="tab-pane container fade show active" id="chair">
                <div class="row">
                    <div class="col mb-7 p-0 pt-5">
                        <div class="card h-10">
                            <!-- 상품 이미지-->
                            <img class="card-img-top vh-25" src="img/pimg/co.jpg" alt="..." />
                            <!-- 상품 내용-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 상품 설명-->
                                    <h5 class="fw-bolder text-muted">의자</h5>
                                </div>
                            </div>
                            <!-- 상품 링크-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" 
                                											href="./ProductList.shop?search=의자&searchtext=오피스의자">관련상품 전체보기</a></div>
                            </div>
                        </div>
                    </div>
                    <!-- 상품 나열 -->
                    <div class="col-md-5 ps-4 pt-5">
                        <div class="row row-cols-2">
                        	<c:forEach var="l1" items="${list1}">
	                            <div class="col card">
	                                <!-- 상품 이미지-->
	                                <a class="" href="./ProductDetail.shop?pID=${l1.pID}"><img class="card-img-top" src="${l1.imgpath}.jpg" alt="..." /></a>
	                                <!-- 상품 내용-->
	                                <div class="card-body p-2">
	                                    <div class="text-left">
	                                        <!-- 상품 이름-->
	                                        <h5 class="fw-bolder">${l1.pname}</h5>
	                                        <!-- 상품 가격-->
	                                        <em class="price not-italic tracking-tighter">
							            		<fmt:formatNumber value="${l1.pprice}" pattern="###,###,###" /> </em><span class="text-xs">원</span>
	                                    </div>
	                                </div>
	                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 주방(식탁) -->
            <div class="tab-pane container fade" id="kitchen">
				<div class="row">
					<div class="col mb-7 p-0 pt-5">
						<div class="card h-10">
							<!-- 상품 이미지-->
							<img class="card-img-top vh-25" src="img/pimg/kq.jpg" alt="..." />
							<!-- 상품 내용-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- 상품 설명-->
									<h5 class="fw-bolder text-muted">주방</h5>
								</div>
							</div>
							<!-- 상품 링크-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="./ProductList.shop?search=주방&searchtext=식탁">관련상품
										전체보기</a>
								</div>
							</div>
						</div>
					</div>
					<!-- 상품 나열 -->
					<div class="col-md-5 ps-4 pt-5">
						<div class="row row-cols-2">
							<c:forEach var="l2" items="${list2}">
								<div class="col card">
									<!-- 상품 이미지-->
									<a class="" href="./ProductDetail.shop?pID=${l2.pID}"><img
										class="card-img-top" src="${l2.imgpath}.jpg" alt="..." /></a>
									<!-- 상품 내용-->
									<div class="card-body p-2">
										<div class="text-left">
											<!-- 상품 이름-->
											<h5 class="fw-bolder">${l2.pname}</h5>
											<!-- 상품 가격-->
											<em class="price not-italic tracking-tighter"> <fmt:formatNumber
													value="${l2.pprice}" pattern="###,###,###" />
											</em><span class="text-xs">원</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
				<!-- 거실(소파) -->
            <div class="tab-pane container fade" id="living">
					<div class="row">
						<div class="col mb-7 p-0 pt-5">
							<div class="card h-10">
								<!-- 상품 이미지-->
								<img class="card-img-top vh-25" src="img/pimg/sb.jpg" alt="..." />
								<!-- 상품 내용-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- 상품 설명-->
										<h5 class="fw-bolder text-muted">거실</h5>
									</div>
								</div>
								<!-- 상품 링크-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="btn btn-outline-dark mt-auto"
											href="./ProductList.shop?search=거실&searchtext=소파">관련상품
											전체보기</a>
									</div>
								</div>
							</div>
						</div>
						<!-- 상품 나열 -->
						<div class="col-md-5 ps-4 pt-5">
							<div class="row row-cols-2">
								<c:forEach var="l3" items="${list3}">
									<div class="col card">
										<!-- 상품 이미지-->
										<a class="" href="./ProductDetail.shop?pID=${l3.pID}"><img
											class="card-img-top" src="${l3.imgpath}.jpg" alt="..." /></a>
										<!-- 상품 내용-->
										<div class="card-body p-2">
											<div class="text-left">
												<!-- 상품 이름-->
												<h5 class="fw-bolder">${l3.pname}</h5>
												<!-- 상품 가격-->
												<em class="price not-italic tracking-tighter"> <fmt:formatNumber
														value="${l3.pprice}" pattern="###,###,###" />
												</em><span class="text-xs">원</span>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
        </div>

        <!-- 거울/화장대, 책상/테이블, 책장/선반장 -->
        <div class="container py-5">
            <ul class="nav nav-pills nav-justified flex-column flex-sm-row border rounded">
              <li class="nav-item">
                <a class="flex-sm-fill text-sm-center nav-link active" data-bs-toggle="tab" data-bs-target="#bedroom" type="button" role="tab" aria-controls="bedroom" aria-selected="true">거울/화장대</a>
              </li>
              <li class="nav-item">
                <a class="flex-sm-fill text-sm-center nav-link" data-bs-toggle="tab" data-bs-target="#library1" type="button" role="tab" aria-controls="library1" aria-selected="false">책상/테이블</a>
              </li>
              <li class="nav-item">
                <a class="flex-sm-fill text-sm-center nav-link" data-bs-toggle="tab" data-bs-target="#library2" type="button" role="tab" aria-controls="library2" aria-selected="false">책장/선반장</a>
              </li>
            </ul>
            <!-- 침실(거울/화장대) -->
            <div class="tab-content">
                <div class="tab-pane container fade show active" id="bedroom">
                  <div class="row">
					<div class="col mb-7 p-0 pt-5">
						<div class="card h-10">
							<!-- 상품 이미지-->
							<img class="card-img-top vh-25" src="img/pimg/b.jpg" alt="..." />
							<!-- 상품 내용-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- 상품 설명-->
									<h5 class="fw-bolder text-muted">침실</h5>
								</div>
							</div>
							<!-- 상품 링크-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="./ProductList.shop?search=침실&searchtext=거울/화장대">관련상품
										전체보기</a>
								</div>
							</div>
						</div>
					</div>
					<!-- 상품 나열 -->
					<div class="col-md-5 ps-4 pt-5">
						<div class="row row-cols-2">
							<c:forEach var="l4" items="${list4}">
								<div class="col card">
									<!-- 상품 이미지-->
									<a class="" href="./ProductDetail.shop?pID=${l4.pID}"><img
										class="card-img-top" src="${l4.imgpath}.jpg" alt="..." /></a>
									<!-- 상품 내용-->
									<div class="card-body p-2">
										<div class="text-left">
											<!-- 상품 이름-->
											<h5 class="fw-bolder">${l4.pname}</h5>
											<!-- 상품 가격-->
											<em class="price not-italic tracking-tighter"> <fmt:formatNumber
													value="${l4.pprice}" pattern="###,###,###" />
											</em><span class="text-xs">원</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
              </div>
              <!-- 서재(책상/테이블) -->
              <div class="tab-pane container fade" id="library1">
                  <div class="row">
					<div class="col mb-7 p-0 pt-5">
						<div class="card h-10">
							<!-- 상품 이미지-->
							<img class="card-img-top vh-25" src="img/pimg/q.jpg" alt="..." />
							<!-- 상품 내용-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- 상품 설명-->
									<h5 class="fw-bolder text-muted">서재</h5>
								</div>
							</div>
							<!-- 상품 링크-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="./ProductList.shop?search=서재&searchtext=책상/테이블">관련상품
										전체보기</a>
								</div>
							</div>
						</div>
					</div>
					<!-- 상품 나열 -->
					<div class="col-md-5 ps-4 pt-5">
						<div class="row row-cols-2">
							<c:forEach var="l5" items="${list5}">
								<div class="col card">
									<!-- 상품 이미지-->
									<a class="" href="./ProductDetail.shop?pID=${l5.pID}"><img
										class="card-img-top" src="${l5.imgpath}.jpg" alt="..." /></a>
									<!-- 상품 내용-->
									<div class="card-body p-2">
										<div class="text-left">
											<!-- 상품 이름-->
											<h5 class="fw-bolder">${l5.pname}</h5>
											<!-- 상품 가격-->
											<em class="price not-italic tracking-tighter"> <fmt:formatNumber
													value="${l5.pprice}" pattern="###,###,###" />
											</em><span class="text-xs">원</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
              </div>
              <!-- 서재(책장/선반장) -->
              <div class="tab-pane container fade" id="library2">
                <div class="row">
					<div class="col mb-7 p-0 pt-5">
						<div class="card h-10">
							<!-- 상품 이미지-->
							<img class="card-img-top vh-25" src="img/pimg/qs.jpg" alt="..." />
							<!-- 상품 내용-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- 상품 설명-->
									<h5 class="fw-bolder text-muted">서재</h5>
								</div>
							</div>
							<!-- 상품 링크-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="./ProductList.shop?search=서재&searchtext=책장/선반장">관련상품
										전체보기</a>
								</div>
							</div>
						</div>
					</div>
					<!-- 상품 나열 -->
					<div class="col-md-5 ps-4 pt-5">
						<div class="row row-cols-2">
							<c:forEach var="l6" items="${list6}">
								<div class="col card">
									<!-- 상품 이미지-->
									<a class="" href="./ProductDetail.shop?pID=${l6.pID}"><img
										class="card-img-top" src="${l6.imgpath}.jpg" alt="..." /></a>
									<!-- 상품 내용-->
									<div class="card-body p-2">
										<div class="text-left">
											<!-- 상품 이름-->
											<h5 class="fw-bolder">${l6.pname}</h5>
											<!-- 상품 가격-->
											<em class="price not-italic tracking-tighter"> <fmt:formatNumber
													value="${l6.pprice}" pattern="###,###,###" />
											</em><span class="text-xs">원</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
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
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

    </body>
</html>
