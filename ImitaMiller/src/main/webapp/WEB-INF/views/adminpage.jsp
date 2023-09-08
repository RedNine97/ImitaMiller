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

</head>

<body class="bg-gradient-primary">

    <div class="container">
        <!-- Outer Row -->
        <div class="justify-content-center">
            <!-- Nested Row within Card Body -->
            <div class="py-5 my-5">
                <div class="p-5 border-0 shadow-lg">
                    <div class="text-center">
                        <h1 class="h4 mb-4 pb-5">ADMIN PAGE</h1>
                    </div>
                    <form name="adminpage">
                        <div class="row">
                            <div class="col-sm-6">
                              <div class="card pb-4">
                                <div class="card-body">
                                  <h5 class="card-title">관리자 정보</h5>
                                  <div class="form-group row border-top m-0">
                                    <div class="col-sm-3 mb-sm-0">
                                        <h6 class="pt-4 mt-2 font-weight-bold">관리자 번호</h6>
                                    </div>
                                    <div class="col-sm-9 ps-0">
                                        <input type="text" readonly class="form-control-plaintext register-input mt-3 rounded-start rounded-4" 
                                            id="staticEmail" value="${managerCheck.man_id}">
                                    </div>
                                  </div>
                                  <div class="form-group row m-0">
                                    <div class="col-sm-3 mb-sm-0">
                                        <h6 class="pt-4 mt-2 font-weight-bold">아이디</h6>
                                    </div>
                                    <div class="col-sm-9 ps-0">
                                        <input type="text" readonly class="form-control-plaintext register-input mt-3 rounded-start rounded-4" 
                                            id="staticEmail" value="${managerCheck.id}">
                                    </div>
                                  </div>
                                  <div class="form-group row m-0">
                                    <div class="col-sm-3 mb-sm-0">
                                        <h6 class="pt-4 mt-2 font-weight-bold">이름</h6>
                                    </div>
                                    <div class="col-sm-9 ps-0">
                                        <input type="text" readonly class="form-control-plaintext register-input mt-3 rounded-start rounded-4" 
                                            id="staticEmail" value="${managerCheck.name}">
                                    </div>
                                  </div>
                                  <div class="form-group row m-0">
                                    <div class="col-sm-3 mb-sm-0">
                                        <h6 class="pt-4 mt-2 font-weight-bold">이메일</h6>
                                    </div>
                                    <div class="col-sm-9 ps-0">
                                        <input type="text" readonly class="form-control-plaintext register-input mt-3 rounded-start rounded-4" 
                                            id="staticEmail" value="${managerCheck.email}">
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-sm-6">
                              <div class="card">
                                <div class="card-body">
                                  <h5 class="card-title">제품 정보</h5>
                                  <p class="card-text border-top pt-3">새로운 상품 추가하기, 상품 수정하기, 상품 삭제하기</p>
                                  <a href="./product_admin_list.shop" class="btn btn-primary">더보기</a>
                                </div>
                              </div>
                              <div class="card mt-3">
                                <div class="card-body">
                                  <h5 class="card-title">배송 정보</h5>
                                  <p class="card-text border-top pt-3">배송상태 보기</p>
                                  <a href="./error.shop" class="btn btn-primary">준비중</a>
                                </div>
                              </div>
                          </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="js/scripts.js"></script>
</body>

</html>