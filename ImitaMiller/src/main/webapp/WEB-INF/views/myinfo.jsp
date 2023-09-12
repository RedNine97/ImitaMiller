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
        <link rel="icon" type="image/x-icon" href="img/favicon.png"/>
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <!-- top.jsp -->
    	<jsp:include page="header.jsp" flush="false" />
    	
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
                                        <h1 class="h4 mb-4">회원정보 확인</h1>
                                    </div>
                                    <form class="user" name="memupdate" id="memupdate" method="POST" action="memupdate.shop">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <!-- 성명 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">성명<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0">
                                                <input type="text" value="${memberInfo.memname}" class="register-input form-control form-control-user mt-3 rounded-start rounded-4" id="Name2" name="memname">
                                            </div>
                                        </div>
                                        <!-- 생년월일 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">생년월일<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0 mt-4">
                                                <div class="input-birth input-group mb-3">
                                                <input type="hidden" name="hiddenBirthday" id="hiddenBirthday" value="${memberInfo.birthday}">
	                                                <input type="date" name="birthday" id="birthday2" 
	                                                	 class="form-control" >
                                                 </div>
                                            </div>
                                        </div>
                                        <!-- 아이디 -->
                                        <div class="form-group border-top row justify-content-start">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">아이디<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 row">
                                                <input type="text" name="id" id="mem_id2" value="${loginCheck.id}" class="col-sm-9 register-input form-control form-control-user mt-3 rounded-start rounded-4">
                                                <button class="col-sm-3 btn btn-outline-secondary ms-3 mt-3 btn-idcheck" type="button" id="checkDuplicate2">중복체크</button>
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
                                                <input type="password" name="pwd" id="mem_passwd2" class="register-input form-control form-control-user mt-3 rounded-start rounded-4">
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
                                                <input type="password" name="repwd" id="mem_repasswd2" class="register-input form-control form-control-user mt-3 rounded-start rounded-4">
                                            </div>
                                        </div>
                                        <!-- 이메일 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">이메일<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0">
                                                <input type="text" name="email" id="mem_email2" value="${memberInfo.email}"  class="register-input form-control form-control-user mt-3 rounded-start rounded-4">
                                            </div>
                                        </div>
                                        <!-- 휴대전화 -->
                                        <div class="form-group row border-top">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">휴대전화<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 ps-0">
                                                <input type="text" name="mphone" id="mphone2" value="${memberInfo.mphone}"  class="register-input form-control form-control-user mt-3 rounded-start rounded-4">
                                            </div>
                                        </div>
                                        <!-- 우편번호, 주소 -->
                                        <div class="form-group border-top row justify-content-start">
                                            <div class="col-sm-3 mb-3 mb-sm-0">
                                                <p class="pt-4 mt-2">주소<span class="highlight">*</span></p>
                                            </div>
                                            <div class="col-sm-9 row">
                                                <input type="text" name="zipcode" id="mem_zipcode2" class="col-sm-8 register-input form-control form-control-user mt-3 rounded-start rounded-4 input-zipcode" 
                                                   id="mem_zipcode" value="${memberInfo.zipcode}">
                                                <button class="col-sm-4 btn btn-outline-secondary ms-3 mt-3 btn-idcheck" type="button" id="zipCheckButton2">우편번호</button>

                                                <input type="text" name="addr" id="mem_address2" value="${memberInfo.addr}" class="register-input form-control form-control-user mt-3 mb-2 rounded-start rounded-4 input-address">
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="d-flex justify-content-center">
                                            <div class="col-sm-3 col-md-2 ps-2">
                                              <input type="button" id="myinputCheck" value="수정완료" class="btn btn-login btn-block" />
                                            </div>
                                            <div class="col-sm-3 col-md-2 ps-2">
                                              <input type="button" value="수정취소" class="btn btn-login btn-block" onClick="history.back()" />
                                            </div>
                                            <div class="col-sm-3 col-md-2 ps-2">
                                                <input type="button" value="초기화" class="btn btn-login btn-block" onclick="location.replace(location.href)" />
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
    <script>
		document.addEventListener("DOMContentLoaded", function() {
		    var hiddenBirthdayInput = document.getElementById("hiddenBirthday");
		    var birthdayInput = document.getElementById("birthday2");
		
		    // 숨겨진 입력 필드의 값을 가져옴
		    var hiddenValue = hiddenBirthdayInput.value;
		
		    // "yyyy-MM-dd" 형식으로 변환
		    var dateObj = new Date(hiddenValue);
		    var year = dateObj.getFullYear();
		    var month = (dateObj.getMonth() + 1).toString().padStart(2, "0"); // 월은 0부터 시작하므로 +1 해주고 2자리로 패딩
		    var day = dateObj.getDate().toString().padStart(2, "0"); // 일을 2자리로 패딩
		    var formattedDate = year + "-" + month + "-" + day;
		
		    // 변환된 값을 birthday2 input에 설정
		    birthdayInput.value = formattedDate;
		});
		$(document).ready(function () {
		    var memberUpdateCheck = ${memberUpdateCheck};
		    
		    if (!memberUpdateCheck) {
		        alert("회원 정보 업데이트에 실패했습니다. 다시 시도해 주세요.");
		        // 실패한 경우 현재 페이지에 머무르도록 리다이렉트 없이 처리합니다.
		    }
		});
	</script>
	<!-- footer.jsp-->
	<jsp:include page="footer.jsp" flush="false" />

	<script src="js/meminfo.js"></script>
</body>
</html>