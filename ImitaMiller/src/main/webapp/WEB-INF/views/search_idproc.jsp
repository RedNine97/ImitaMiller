<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>고품격 가구 브랜드 이미타밀러</title>
    <link rel="icon" type="image/x-icon" href="img/favicon.png" />

    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>

<body class="bg-gradient-primary">
    <div class="container">
        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-5 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-7">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 mb-4">아이디 찾기</h1>
                                    </div>
                                    <!-- 찾은 데이터를 보여주는 코딩(검색시작) -->
                                    <div>
										<c:if test="${empty searchId}">
											<p class="text-center text-lg mt-1 -mb-2 pb-1 text-red-500">
												${memname}님의 ${email} 이메일로 검색된 ID가 없습니다.</p>
											<br>
											<button type="button"
												class="btn btn-login btn-user btn-block"
												onclick="history.back()">다시쓰기</button>
										</c:if>

										<c:if test="${not empty searchId}">
											<p class="relative block text-lg mb-10 text-gray-900">${memname}
												회원 님의 ${email} 이메일 주소로 검색된 ID[${totalList}]입니다.</p>
											<br>
											<c:forEach var="si" items="${searchId}">
												<p class="ml-12 font-mono hover:bg-blue-200 border-gray-300 shadow">
													${si.id} &nbsp; &nbsp; &nbsp; 가입일 :
													<fmt:formatDate value="${si.enrolldate}" timeStyle="medium"
														pattern="yyyy.MM.dd" />
												</p>
												<br>
											</c:forEach>
											<div class="text-center pt-3">
												<a class="btn btn-login btn-user btn-block"
													href="./main.shop">로그인하러 가기</a>
											</div>
										</c:if>
									</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<script src="js/search.js?ver=3.5"></script>
    <script src="js/scripts.js?ver=3.5"></script>
</body>

</html>