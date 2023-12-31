<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>고품격 가구 브랜드 이미타밀러</title>
	<link rel="icon" type="img/x-icon" href="img/favicon.png" />
	<!-- 글꼴 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Sunflower:wght@500&display=swap"
		rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="css/styles.css" rel="stylesheet" />
	
	<!-- top.jsp -->
	<jsp:include page="header.jsp" flush="false" />
</head>
<body>
	<div class="container">
		<section class="py-6">
		<div class="p-4 m-2 text-sm-center">
           <p class="nanum fs-1">전체상품 정보</p>
        </div>
			<!-- 상품 -->
			<div class="container px-4 px-lg-5 mt-5" id="divReloadLayer">
				<div class="row">
                    <p class="col text-start">${pgList.count} 건의 결과가 있습니다.</p>
                    <p class="col text-end">[ 최신순 ]</p>
                </div>
				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">
					<c:forEach var="p" items="${productList}">
						<div class="col mb-5 ps-1">
							<a href="./product_detail.shop?pID=${p.pID}&pageNum=${pgList.currentPage}" class="d-block overflow-hidden position-relative my-custom-link-style">
								<div class="card h-100">
									<!-- 상품 이미지-->
									<img class="card-img-top" src="${p.imgpath}" />
									<!-- 상품 내용-->
									<div class="card-body p-4">
										<div class="text-start">
											<p class="fw-lighter text-muted mb-2">이미타밀러</p>
											<!-- 상품 이름-->
											<p class="fw-bolder">${p.pname}</p>
											<!-- 상품 가격-->
											<p class="text-end fs-5 text-gray-900 font-bold">
											<em class="price not-italic tracking-tighter">
								                <fmt:formatNumber value="${p.pprice}" pattern="###,###,###" />
								            </em>
		                      				</p>
										</div>
									</div>
								</div>
							</a>
							<div class="row m-0 pt-1">
								<button onclick="location.href='./product_admin_update.shop?pID=${p.pID}'"  class="col btn btn-primary ms-1">수정</button>
								<button onclick="location.href='./product_admin_delete.shop?pID=${p.pID}'" class="col btn btn-primary ms-1">삭제</button>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
			<div class="text-center">
                <button type="button" onclick="location.href='./product_admin_write.shop'" class="btn btn-primary p-4 py-3">
                    상품등록
                </button>
            </div>
		</section>
	</div>
	<!-- 페이징 처리 및 검색 파트-->
	<div class="d-flex justify-content-center p-2">
	<c:if test="${pgList.count > 0}">
		<ngb-pagination role="navigation">
            <ul class="pagination">            
	            <c:set var="pageCount" value="${pgList.count/pgList.pageSize+(pgList.count%pgList.pageSize==0?0:1)}" />
				<c:set var="startPage" value="${pgList.currentPage-((pgList.currentPage-1)%pgList.blockSize)}" />
				<c:set var="endPage" value="${pgList.startPage+pgList.blockSize-1}" />
				<c:if test="${pgList.endPage>pgList.pageCount}">
					<c:set var="endPage" value="${pgList.endPage=pgList.pageCount}" />
				</c:if>
				
			  <c:if test="${pgList.startPage>pgList.blockSize}">
              <li class="page-item">
              	<a aria-label="Previous" class="page-link" href="./product_admin_list.shop?pageNum=${pgList.startPage-pgList.blockSize}&search=${search}&searchtext=${searchtext}" 
              		tabindex="-1" aria-disabled="true"> 
              		<span aria-hidden="true">«</span></a>
			  </li>
              </c:if>
        	  
      	  	  <c:forEach var="i" begin="${pgList.startPage}" end="${pgList.endPage}"> 
              <li class="page-item">
              <c:choose>
              	<c:when test="${pgList.currentPage==i}">
              		<a href="./product_admin_list.shop?pageNum=${i}&search=${search}&searchtext=${searchtext}" class="page-link">
		                 ${i}
		             </a>
              	</c:when>
              	<c:otherwise>
		                <a
		                  href="./product_admin_list.shop?pageNum=${i}&search=${search}&searchtext=${searchtext}"
		                  class="page-link">
		                 ${i}
		                </a>
		        </c:otherwise>
                </c:choose>
              </li>        
              </c:forEach>  
        		
        	    <c:if test="${pgList.endPage<pgList.pageCount}">
        	    <li class="page-item">
	                <a href="./product_admin_list.shop?pageNum=${pgList.startPage+pgList.blockSize}&search=${search}&searchtext=${searchtext}"
	                  aria-label="Next" class="page-link">
	                	<span aria-hidden="true">»</span>
	                </a>
                </li>
              </c:if>
            </ul>
            </c:if>
		</ngb-pagination>
	</div>
	<!-- footer.jsp-->
	<jsp:include page="footer.jsp" flush="false" />

	<!-- Bootstrap core JS-->
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>