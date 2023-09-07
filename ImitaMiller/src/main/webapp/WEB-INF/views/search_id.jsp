<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
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
                                        <h1 class="h4 mb-4">아이디 찾기</h1>
                                    </div>
                                    <form class="user" name="SearchId" method="post" action="search_idproc.shop">
                                        <!-- 성명 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">이름<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0">
                                                <input type="text" name="memname" class="register-input form-control form-control-user mt-3 rounded-start rounded-4" id="memname_search" placeholder="이름을 입력해주세요.">
                                        		<span class="invalid-feedback block col-span-6 text-justify text-sm mt-1 pb-1" id="searchname_error">이름을 입력해야 합니다.</span>
                                            </div>
                                        </div>
                                        <!-- 이메일 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">이메일주소<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0 mb-3">
                                                <input type="text" class="register-input form-control form-control-user mt-3 rounded-start rounded-4" name="email" id="email_search" placeholder="email@example.com">
	                                            <span class="invalid-feedback block col-span-6 text-justify text-sm mt-1 pb-1" id="searchemail_error">이메일을 입력해야 합니다.</span>
												<span class="invalid-feedback block col-span-6 text-justify text-sm mt-1 pb-1" id="searchemail_error2">이메일 양식을 정확히 입력해주세요.</span>
                                            </div>
                                        </div>                                   
                                        <div class="input-group mb-4">
                                            <input type="text" id="userkey" name="userkey" maxlength="8" class="form-control rounded-end rounded-4" placeholder="인증번호 8자리 숫자 입력">
                                            <button class="btn btn-outline-secondary btn-login" type="button" id="shIdButton">인증번호 받기</button>
	                                        <span class="invalid-feedback block col-span-6 text-justify text-sm mt-1 pb-1" id="searchemail">인증번호를 발송중입니다.</span>
											<span class="invalid-feedback block col-span-6 text-justify text-sm mt-1 pb-1" id="key">인증번호를 확인해주세요.</span>
                                        </div>
										<input type="hidden" name="randomKey" id="randomKey" value="n">
                                        <hr>
                                        <div class="row d-flex justify-content-center">
                                            <div class="col-sm-3">
                                                <input type="button" value="취소" class="btn btn-login btn-user btn-block" onClick="location.href='./login.shop'" />
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="button" value="다음" id="scic" class="btn btn-login btn-user btn-block" onClick="IdSearchCheck()" />
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
    <script src="js/search.js"></script>
</body>
</html>