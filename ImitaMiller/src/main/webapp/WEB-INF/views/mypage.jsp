<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<!-- top.jsp -->
    <jsp:include page="header.jsp" flush="false" />
</head>

<body class="bg-gradient-primary">

    <div class="container">
        <!-- Outer Row -->
        <div class="justify-content-center">
            <!-- Nested Row within Card Body -->
            <div class="py-5 my-5">
                <div class="p-5 border-0 shadow-lg">
                    <div class="text-center">
                        <h1 class="h4 mb-4 pb-5">MY PAGE</h1>
                    </div>
                    <form name="mypage" class="user">
                        <div class="row">
                            <div class="col-sm-6">
                              <div class="card">
                                <div class="card-body">
                                  <h5 class="card-title">회원 정보</h5>
                                  <p class="card-text">회원 정보를 조회 및 수정할 수 있습니다.<br>
                                    회원님의 정보는 개인정보보호정책에 의해 보호를 받습니다.</p>
                                  <a href="./myinfo.shop" class="btn btn-primary">조회 및 수정하기</a>
                                </div>
                              </div>
                            </div>
                            <div class="col-sm-6">
                              <div class="card">
                                <div class="card-body">
                                  <h5 class="card-title">회원 탈퇴</h5>
                                  <p class="card-text">회원님의 서비스의 모든 사용이 중단됩니다.<br>
                                    탈퇴한 뒤에는 아이디 및 데이터를 복구할 수 없으니 신중히 진행하세요.</p>
                                  <a href="./memdelete.shop" class="btn btn-primary">회원 탈퇴하기</a>
                                </div>
                              </div>
                            </div>
                          </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
	<!-- footer.jsp-->
	<jsp:include page="footer.jsp" flush="false" />

	<!-- feedback.jsp-->
	<jsp:include page="feedback.jsp" flush="false" />
	<script src="js/scripts.js"></script>
</body>

</html>