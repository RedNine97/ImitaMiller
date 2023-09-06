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
                        <h1 class="h4 mb-4 pb-5">회원 탈퇴</h1>
                    </div>
                    <form name="memdelete" method="POST" action="memberdelete.shop">
                      <div class="m-5 p-2">
                        <div class="row">
                            <div class="col-sm-12">
                              <div class="alert alert-danger" role="alert">
                                <p>회원탈퇴 시 모든 정보가 삭제되며, 복구되지 않습니다.</p>
                                <p>그래도 계정을 삭제하시려면 "회원탈퇴"를 클릭하세요.</p>
                                <hr>
                                <p class="mb-0">계정을 영구적으로 삭제하기 전에 비밀번호를 입력하세요.</p>
                              </div>
                            </div>
                            <div class="col-sm-12 pb-5 py-3">
                            	<input type="hidden" name="repwd" id="repasswd" value="${loginCheck.pwd}">
                              <label for="inputPassword4" class="form-label">비밀번호 입력</label>
                              <input type="password" class="form-control" name="pwd" id="passwd">
                            </div>
                          </div>
                          <div class="d-flex justify-content-center">
                            <div class="col-sm-2 col-md-2 ps-2">
                              <input type="button" value="회원탈퇴" class="btn btn-login btn-user btn-block" onclick="deleteCheck()" />
                            </div>
                            <div class="col-sm-2 col-md-2 ps-2">
                              <input type="button" value="탈퇴취소" class="btn btn-login btn-user btn-block" onClick="history.back()" />
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