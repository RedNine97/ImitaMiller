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
            <h1 class="h4 mb-4 pb-5">상품 수정하기</h1>
          </div>
          <form name="ProductAdminUpdate" method="POST" action="product_admin_update.shop">
          	<input type="hidden" name="pID" id="pIdUpdate" value="${productDto.pID}">
          	<input type="hidden" name="repsizemgpath" value="${productDto.psizemgpath}">
          	<input type="hidden" name="reimgpath" value="${productDto.imgpath}">
            <div class="card pb-4">
              <div class="card-body">
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">상품명</h6>
                  </div>
                  <div class="col-sm-9 ps-0">
                    <input type="text" value="${productDto.pname}" name="pname"
                      class="col-sm-9 register-input form-control form-control-user mt-3 rounded-start rounded-4">
                  </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">가격</h6>
                  </div>
                  <div class="col-sm-9 ps-0">
                    <input type="text" value="${productDto.pprice}" name="pprice"
                      class="col-sm-9 register-input form-control form-control-user mt-3 rounded-start rounded-4">
                    </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">사이즈</h6>
                  </div>
                  <div class="col-sm-9 ps-0">
                    <input type="text" value="${productDto.psize}" name="psize"
                      class="col-sm-9 register-input form-control form-control-user mt-3 rounded-start rounded-4">
                  </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">마감</h6>
                  </div>
                  <div class="col-sm-9 ps-0">
                    <input type="text" value="${productDto.pfinishing}" name="pfinishing"
                      class="col-sm-9 register-input form-control form-control-user mt-3 rounded-start rounded-4">
                  </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">유형</h6>
                  </div>
                  <div class="col-sm-4 ps-0 pt-3">
                    <select class="form-select" id="pcategory" name="pcategory">
                      <option value="${productDto.pcategory}" selected>${productDto.pcategory} (선택)</option>
                      <option value="서재">서재</option>
                      <option value="침실">침실</option>
                      <option value="거실">거실</option>
                      <option value="주방">주방</option>
                      <option value="의자">의자</option>
                  </select>
                  </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">종류</h6>
                  </div>
                  <div class="col-sm-4 ps-0 pt-3">
                    <select class="form-select" id="ptype" name="ptype">
                      	<option value="${productDto.ptype}" selected>${productDto.ptype} (선택)</option>
                        <option value="책상/테이블">책상/테이블</option>
                        <option value="책장/선반장">책장/선반장</option>
                        <option value="거울/화장대">거울/화장대</option>
                        <option value="소파">소파</option>
                        <option value="식탁">식탁</option>
                        <option value="오피스의자">오피스의자</option>
                    </select>
                  </div>
                </div>
                <div class="form-group row m-0 pb-3">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">도면 경로</h6>
                  </div>
                  <div class="col-sm-9 ps-0 py-4">
                    <label for="fileInput">확장자를 .png를 사용하세요.</label>
                    <input type="file" id="fileInputUpdate1" name="psizemgpath"
                      class="col-sm-9 register-input form-control form-control-user mt-3 rounded-start rounded-4">
                  </div>
                  <img src="${productDto.psizemgpath}.png" id="imagePreviewUpdate1" alt="이미지 미리보기" class="mt-3">
                </div>
                <div class="form-group row m-0 pt-5 border-top">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">이미지 경로</h6>
                  </div>
                  <div class="col-sm-9 ps-0 py-3">
                    <label for="fileInput">확장자를 .jpg를 사용하세요.</label>
                    <input type="file" id="fileInputUpdate2" name="imgpath"
                      class="col-sm-9 register-input form-control form-control-user mt-3 rounded-start rounded-4">
                  </div>
                  <img src="${productDto.imgpath}.jpg" id="imagePreviewUpdate2" alt="이미지 미리보기" class="mt-3">
                </div>
              </div>
              <div class="row d-flex justify-content-center">
                <div class="col-sm-3">
                    <input type="button" value="수정취소" class="btn btn-login btn-user btn-block" onClick="history.back()"/>
                </div>
                <div class="col-sm-3">
                    <input type="submit" value="상품수정" class="btn btn-login btn-user btn-block"/>
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