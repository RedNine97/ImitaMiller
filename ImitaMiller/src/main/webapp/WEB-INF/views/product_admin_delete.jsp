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
            <h1 class="h4 mb-4 pb-5">이 상품을 삭제하시겠습니까?</h1>
          </div>
          <form name="product_delete"  method="post"  action="product_admin_delete.shop">
          	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div class="card pb-4">
              <div class="card-body">
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">상품명</h6>
                  </div>
                  <div class="col-sm-9 ps-0">
                    <input type="text" readonly value="${productDto.pname}" name="pname" readonly 
                      class="col-sm-9 register-input form-control border-0">
                  </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">가격</h6>
                  </div>
                  <div class="col-sm-9 ps-0">
                    <input type="text" readonly value="${productDto.pprice}" name="pprice" readonly
                    class="col-sm-9 register-input form-control border-0">
                    </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">사이즈</h6>
                  </div>
                  <div class="col-sm-9 ps-0">
                    <input type="text" readonly value="${productDto.psize}" name="psize" readonly
                    class="col-sm-9 register-input form-control border-0">
                  </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">마감</h6>
                  </div>
                  <div class="col-sm-9 ps-0">
                    <input type="text" readonly value="${productDto.pfinishing}" name="pfinishing" readonly
                    class="col-sm-9 register-input form-control border-0">
                  </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">유형</h6>
                  </div>
                  <div class="col-sm-9 ps-0">
                    <input type="text" readonly value="${productDto.pcategory}" name="pcategory" readonly
                    class="col-sm-9 register-input form-control border-0">
                  </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">종류</h6>
                  </div>
                  <div class="col-sm-9 ps-0">
                    <input type="text" readonly value="${productDto.ptype}" name="ptype" readonly
                    class="col-sm-9 register-input form-control border-0">
                  </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">도면 경로</h6>
                  </div>
                  <div class="col-sm-9 ps-0 py-4">
                    <img class="card-img-top" src="${productDto.psizemgpath}" />
                    <input type="hidden" value="${productDto.psizemgpath}" name="psizemgpath" readonly>
                  </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">이미지 경로</h6>
                  </div>
                  <div class="col-sm-9 ps-0 py-3">
                    <img class="card-img-top" src="${productDto.imgpath}"/>
                    <input type="hidden" value="${productDto.imgpath}" name="imgpath" readonly>
                  </div>
                </div>
              </div>
              <div class="row d-flex justify-content-center">
                <div class="col-sm-3">
                    <input type="button" value="삭제취소" class="btn btn-login btn-user btn-block" onClick="history.back()"/>
                </div>
                <div class="col-sm-3">
	                <input type="hidden" name="pID" value="${productDto.pID}" readonly>
	                <input type="button" value="상품삭제" class="btn btn-login btn-user btn-block" onclick="ProductDelete()" />
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  </div>
  <script src="js/product.js"></script>
</body>

</html>