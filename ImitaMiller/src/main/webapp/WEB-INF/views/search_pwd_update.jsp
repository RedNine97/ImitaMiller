<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
   	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
</head>
<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-11 col-lg-12 col-md-10">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                            <div class="col-lg-7">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 mb-4">비밀번호 변경하기</h1>
                                    </div>
                                    <form class="user" name="SearchPwdUpdate" method="post" action="search_pwd_updateproc.shop">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="hidden" name="id" id="memid" value="${id}">
                                        <!-- 비밀번호 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">새 비밀번호<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0">
                                                <input type="password" name="pwd" id="mem_passwd" class="register-input form-control form-control-user mt-3 rounded-start rounded-4">
                                            </div>
                                        </div>
                                        <!-- 비밀번호 확인 -->
                                        <div class="form-group row">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">새 비밀번호 확인<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0">
                                                <input type="password" id="mem_repasswd" class="register-input form-control form-control-user mt-3 rounded-start rounded-4">
                                            </div>
                                        </div>
                                        <div class="position-relative pt-1">
                                            <p class="text-center mb-0">공백없는 5~12자리의 영문/숫자 조합 <br><span class="highlight">영문, 숫자, 특수문자를 함께 사용하면<br>(4자 이상 20자 이하)보다 안전합니다.</span></p>
                                        </div>
                                        <hr>
                                        <button type="button" onclick="searchUpdateCheck()" class="btn btn-login btn-user btn-block mt-4 mb-4">
                                            다음
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
	<script src="js/search.js?ver=3.4"></script>
    <script src="js/scripts.js?ver=3.4"></script>
</body>
</html>