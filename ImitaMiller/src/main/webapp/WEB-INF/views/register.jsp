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
        <link rel="icon" type="image/x-icon" href="img/favicon.PNG"/>
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        
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
                                    <form class="user">
                                        <!-- 성명 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">성명<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0">
                                                <input type="text" class="register-input form-control form-control-user mt-3 rounded-start rounded-4" id="Name">
                                            </div>
                                        </div>
                                        <!-- 출생년도 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">출생년도<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0 mt-4">
                                                <div class="input-birth input-group mb-3">
                                                    <select class="form-select" id="inputBirthSelect">
                                                      <option value="none">선택</option>
                                                      <option value="2005">2005</option>
                                                      <option value="2004">2004</option>
                                                      <option value="2003">2003</option>
                                                      <option value="2002">2002</option>
                                                      <option value="2001">2001</option>
                                                      <option value="2000">2000</option>
                                                      <option value="1999">1999</option>
                                                      <option value="1998">1998</option>
                                                      <option value="1997">1997</option>
                                                      <option value="1996">1996</option>
                                                      <option value="1995">1995</option>
                                                      <option value="1994">1994</option>
                                                      <option value="1993">1993</option>
                                                      <option value="1992">1992</option>
                                                      <option value="1991">1991</option>
                                                      <option value="1990">1990</option>
                                                      <option value="1989">1989</option>
                                                      <option value="1988">1988</option>
                                                      <option value="1987">1987</option>
                                                      <option value="1986">1986</option>
                                                      <option value="1985">1985</option>
                                                    </select>
                                                    <label class="input-group-text" for="inputBirthSelect">년</label>
                                                  </div>
                                            </div>
                                        </div>
                                        <!-- 아이디 -->
                                        <div class="form-group border-top row justify-content-start">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">아이디<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 row">
                                                <input type="text" class="col-sm-9 register-input form-control form-control-user mt-3 rounded-start rounded-4" id="mem_id">
                                                <button class="col-sm-3 btn btn-outline-secondary ms-3 mt-3 btn-idcheck" type="button" onclick="idCheck(regForm.memid.value)">중복체크</button>
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
                                                <input type="password" class="register-input form-control form-control-user mt-3 rounded-start rounded-4">
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
                                                <input type="password" class="register-input form-control form-control-user mt-3 rounded-start rounded-4">
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
                                                    <select class="form-select" id="number">
                                                        <option vlaue="none">선택</option>
                                                        <option vlaue="n1" selected>010</option>
                                                        <option vlaue="n2">011</option>
                                                        <option vlaue="n3">016</option>
                                                        <option vlaue="n4">017</option>
                                                        <option vlaue="n5">018</option>
                                                        <option vlaue="n6">019</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-7">
                                                <input type="text" name="number" id="mem_number"  class="register-input form-control form-control-user mt-3 rounded-start rounded-4">
                                            </div>
                                        </div>
                                        <!-- 우편번호, 주소 -->
                                        <div class="form-group border-top row justify-content-start">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">주소<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 row">
                                                <input type="number" class="col-sm-8 register-input form-control form-control-user mt-3 rounded-start rounded-4 input-zipcode" 
                                                   id="mem_zipcode">
                                                <button class="col-sm-4 btn btn-outline-secondary ms-3 mt-3 btn-idcheck" type="button" onclick="zipCheck()">우편번호</button>

                                                <input type="text" id="mem_address" class="register-input form-control form-control-user mt-3 mb-2 rounded-start rounded-4 input-address">

                                            </div>
                                            
                                        </div>
                                        <hr>
                                        <button type="button" onclick="document.location='./M_mainpage.shop'" class="btn btn-login btn-user btn-block mt-4 mb-4">
                                            회원가입
                                        </button>
                                    </form>
                                    <div class="text-center">
                                        <a class="small btn-login" href="#">로그인하러 가기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <script src="js/scripts.js"></script>
</body>
</html>