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
        <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
   		<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
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
                                    <form class="user" name="SearchPwd2" id="SearchPwd2" method="post" action="search_pwd_update.shop">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <!-- DB의 memid, email 값 저장 -->
							            <input type="hidden" name="memidDb" id="memidDb" value="${searchDto.id}">
							            <input type="hidden" name="memnameDb" id="memnameDb" value="${searchDto.memname}">
							            <input type="hidden" name="randomKey" id="randomKey" value="n">
                                        <!-- 성명 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">이름<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0">
                                                <input type="text" class="register-input form-control form-control-user mt-3 rounded-start rounded-4" name="memname" id="memname_search" placeholder="이름을 입력해주세요.">
                                            	<span class="invalid-feedback block col-span-6 text-justify text-sm mt-1 pb-1" id="searchname_error">이름을 정확히 입력해야 합니다.</span>
                                            </div>
                                        </div>
                                        <!-- 이메일 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">이메일주소<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0 mb-3">
                                                <input type="text" readonly class="form-control-plaintext register-input mt-3 rounded-start rounded-4" 
                                                    name="emailDb" id="email_search" value="${searchDto.email}">
                                            </div>
                                        </div>                                   
                                        <div class="input-group mb-4">
                                            <input type="text" id="userkey" name="userkey" maxlength="8" class="form-control rounded-end rounded-4" placeholder="인증번호 8자리 숫자 입력">
                                            <button class="btn btn-outline-secondary btn-login" type="button" onclick="SearchCheck();">인증번호 받기</button>
                                        	<span class="invalid-feedback block col-span-6 text-justify text-sm mt-1 pb-1" id="searchemail">인증번호를 발송중입니다.</span>
											<span class="invalid-feedback block col-span-6 text-justify text-sm mt-1 pb-1" id="key">인증번호를 확인해주세요.</span>
                                        </div>
                                        <hr>
                                        <div class="row d-flex justify-content-center">
                                            <div class="col-sm-3">
                                                <input type="button" value="취소" class="btn btn-login btn-user btn-block" onClick="location.href='./login.shop'" />
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="button" value="다음" class="btn btn-login btn-user btn-block" onclick="searchpwd2Check()" />
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
	<script src="js/search.js?ver=3.3"></script>
    <script src="js/scripts.js?ver=3.3"></script>
</body>
</html>