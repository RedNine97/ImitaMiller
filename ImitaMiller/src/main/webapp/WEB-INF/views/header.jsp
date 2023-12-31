<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="javax.servlet.http.HttpSession"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<!--메인 네비바-->
	<div class="">
		<a href="#!"><img class="img-responsive mx-auto d-block img-fluid"
			src="img/banner/banner-top-md.png" id="bannertop" /></a>
	</div>
	<div class="container sticky-top">
		<nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
			<div class="container px-5">
				<a class="navbar-brand fw-bold" href="./main.shop"> <img
					src="img/logo.png" class="logo" alt="Logo">
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
					Menu <i class="bi-list"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto me-4 my-3 my-lg-0">
					<li class="nav-item">
						<!-- memlogin 정보가 없을 때 --> 
						<c:choose>
						    <c:when test="${not empty loginCheck}">
						        <a class="nav-link me-lg-3" href="javascript:void(0);" onclick="Logout();">로그아웃</a>
						    </c:when>
						    <c:when test="${empty loginCheck and not empty managerCheck}">
						        <!-- managerCheck에 값이 있을 때 -->
						        <a class="nav-link me-lg-3" href="javascript:void(0);" onclick="Logout();">로그아웃</a>
						    </c:when>
						    <c:when test="${empty loginCheck and empty managerCheck}">
						        <!-- 둘 다 값이 없을 때 -->
						        <a class="nav-link me-lg-" href="./login.shop">로그인</a>
						    </c:when>
						</c:choose>
					</li>
					<li class="nav-item">
						<c:if test="${not empty loginCheck}">
							<a class="nav-link me-lg-3" href="./mypage.shop">마이페이지</a>
						</c:if>
						<c:if test="${not empty managerCheck}">
							<a class="nav-link me-lg-3" href="./adminpage.shop">관리자페이지</a>
						</c:if>
					</li>
				</ul>
				</div>
			</div>
		</nav>
		<!--서브 네비바-->
		<nav class="navbar navbar-expand-lg navbar-light bg-white" id="subNav">
			<div class="container-fluid">
				<a class="navbar-brand text-danger" href="./main.shop#page-best">BEST</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarScroll"
					aria-controls="navbarScroll" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse fw-bold" id="navbarScroll">
					<ul class="category-menu navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
						style="-bs-scroll-height: 100px;">
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="./product_list.shop?search=의자">의자</a></li>
						<li class="nav-item"><a class="nav-link" 
							href="./product_list.shop?search=침실">침실</a></li>
						<li class="nav-item"><a class="nav-link" 
							href="./product_list.shop?search=거실">거실</a></li>
						<li class="nav-item"><a class="nav-link" 
							href="./product_list.shop?search=주방">주방</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarScrollingDropdown" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 서재 </a>
							<ul class="dropdown-menu"
								aria-labelledby="navbarScrollingDropdown">
								<li><a class="dropdown-item" href="./product_list.shop?search=서재">전체보기</a></li>
								<li><a class="dropdown-item" href="./product_list.shop?search=서재&searchtext=책장/선반장">책장/선반장</a></li>
								<li><a class="dropdown-item" href="./product_list.shop?search=서재&searchtext=책상/테이블">책상/테이블</a></li>
							</ul></li>
					</ul>
					<form class="d-flex" name="search" action="./product_list.shop">
						<input class="form-control me-2" name="search" id="searchtext" type="search" placeholder="검색">
						<button class="btn btn-outline-success" type="submit">
							<svg xmlns="http://www.w3.org/2000/svg" width="14" 
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                          <path
									d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                        </svg>
						</button>
					</form>
				</div>
			</div>
		</nav>
	</div>
