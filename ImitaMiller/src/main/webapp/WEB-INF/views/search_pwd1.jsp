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
        <link rel="icon" type="image/x-icon" href="img/favicon.png"/>
        
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
                                        <h1 class="h4 mb-4">비밀번호 찾기</h1>
                                    </div>
                                    <form class="user" name="SearchPwd1" id="SearchPwd1" method="post" action="search_pwd2.shop">
                                        <!-- 아이디 -->
                                        <div class="form-group row mt-5 mb-5">
                                            <hr>
                                            <div class="col-sm-3 mb-sm-0">
                                                <p class="pt-4 mt-2">아이디<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0 mb-4">
                                                <input type="text" class="register-input form-control form-control-user mt-3 rounded-start rounded-4" name="id" id="searchPwdId" placeholder="아이디를 입력해주세요.">
                                            </div>
                                            <p class="text-center">비밀번호를 찾고자 하는 아이디를 입력해주세요.</p>
                                        </div>                                 
                                        <hr>
                                        <div class="row d-flex justify-content-center">
                                            <div class="col-sm-3">
                                                <input type="button" value="취소" class="btn btn-login btn-user btn-block" onClick="location.href='./login.shop'" />
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="button" value="다음" class="btn btn-login btn-user btn-block" onclick="searchpwdCheck()" />
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

	<script src="js/search.js?ver=3.2"></script>
    <script src="js/scripts.js?ver=3.2"></script>
</body>
</html>