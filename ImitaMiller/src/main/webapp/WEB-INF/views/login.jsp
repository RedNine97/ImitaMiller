<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 mb-4">LOGIN</h1>
									</div>
									<!-- 로그인 폼 -->
									<form name="login" method="POST" class="user"
										action="login.shop">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="inputID" name="inputID" placeholder="아이디를 입력해주세요.">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												id="inputPassword" name="inputPassword"
												placeholder="비밀번호를 입력해주세요.">
										</div>
										<!-- 에러메세지 출력 -->
										<p id="error_message"></p>
										<input type="button" value="로그인" class="btn btn-login btn-user btn-block"
											onclick="loginCheck()" /> 
										<input type="button" value="회원가입" onclick="document.location='./register.shop'"
											class="btn btn-login btn-user btn-block" />
										<hr>
									</form>
									<div class="text-center">
										<a class="small btn-login" href="./search_id.shop">아이디 찾기</a>
									</div>
									<div class="text-center">
										<a class="small btn-login" href="./search_pwd1.shop">비밀번호 찾기</a>
									</div>
									<div class="text-center pt-3">
										<a class="text-dark no-underline" href="./main.shop">메인페이지 가기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/scripts.js?ver=1.0"></script>
</body>
</html>