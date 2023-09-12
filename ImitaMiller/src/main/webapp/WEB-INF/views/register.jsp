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

            <div class="col-xl-11 col-lg-12 col-md-10">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                            <div class="col-lg-7">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 mb-4">REGISTER</h1>
                                    </div>
                                    <!-- 회원가입 폼 -->
                                    <form class="user" name="register" id="register" method="POST" action="register.shop">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <!-- 성명 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">성명<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0">
                                                <input type="text" class="register-input form-control form-control-user mt-3 rounded-start rounded-4" id="Name" name="memname">
                                            </div>
                                        </div>
                                        <!-- 생년월일 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">생년월일<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0 mt-4">
                                                <div class="input-birth input-group mb-3">
	                                                <input type="date" name="birthday" id="birthday" 
	                                                	 class="form-control">
                                                 </div>
                                            </div>
                                        </div>
                                        <!-- 아이디 -->
                                        <div class="form-group border-top row justify-content-start">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">아이디<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 row">
                                                <input type="text" name="id" id="mem_id" class="col-sm-9 register-input form-control form-control-user mt-3 rounded-start rounded-4">
                                                <button class="col-sm-3 btn btn-outline-secondary ms-3 mt-3 btn-idcheck" type="button" id="checkDuplicate">중복체크</button>
                                            </div>
                                            <div class="position-relative pt-2">
                                                <p class="text-center mb-0">공백없는 5~12자리의 영문/숫자 조합</p>
                                            </div>
                                        </div>
                                        <!-- 비밀번호 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">비밀번호<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0">
                                                <input type="password" name="pwd" id="mem_passwd" class="register-input form-control form-control-user mt-3 rounded-start rounded-4">
                                            </div>
                                            <div class="position-relative pt-2">
                                                <p class="text-center mb-0">공백없는 5~12자리의 영문/숫자 조합 <br><span class="highlight">(+특수문자 사용가능, 단 \, ', " 제외)</span></p>
                                            </div>
                                        </div>
                                        <!-- 비밀번호 확인 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">비밀번호 확인<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0">
                                                <input type="password" name="repwd" id="mem_repasswd" class="register-input form-control form-control-user mt-3 rounded-start rounded-4">
                                            </div>
                                        </div>
                                        <!-- 이메일 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">이메일<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0">
                                                <input type="text" name="email" id="mem_email"  class="register-input form-control form-control-user mt-3 rounded-start rounded-4">
                                            </div>
                                        </div>
                                        <!-- 휴대전화 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">휴대전화<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-2 ps-0 mt-4">
                                                <div class="input-group mb-3">
                                                    <select class="form-select" id="number" name="number">
                                                        <option value="none">선택</option>
                                                        <option value="010" selected>010</option>
                                                        <option value="011">011</option>
                                                        <option value="016">016</option>
                                                        <option value="017">017</option>
                                                        <option value="018">018</option>
                                                        <option value="019">019</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-7">
                                                <input type="text" name="mphone" id="mphone"  class="register-input form-control form-control-user mt-3 rounded-start rounded-4">
                                            </div>
                                        </div>
                                        <!-- 우편번호, 주소 -->
                                        <div class="form-group border-top row justify-content-start">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">주소<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 row">
                                                <input type="text" name="zipcode" id="mem_zipcode" class="col-sm-8 register-input form-control form-control-user mt-3 rounded-start rounded-4 input-zipcode" 
                                                   id="mem_zipcode">
                                                <button class="col-sm-4 btn btn-outline-secondary ms-3 mt-3 btn-idcheck" type="button" id="zipCheckButton">우편번호</button>

                                                <input type="text" name="addr" id="mem_address" class="register-input form-control form-control-user mt-3 mb-2 rounded-start rounded-4 input-address">
                                            </div>
                                        </div>
                                        <hr>
                                        <button type="button" id="inputCheck" class="btn btn-login btn-user btn-block mt-4 mb-4">
                                            회원가입
                                        </button>
                                    </form>
                                    <div class="text-center">
                                        <a class="small btn-login no-underline" href="./main.shop">로그인하러 가기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
	<script src="js/register.js"></script>
</body>
</html>