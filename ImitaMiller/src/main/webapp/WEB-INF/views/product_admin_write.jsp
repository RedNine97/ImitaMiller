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
            <h1 class="h4 mb-4 pb-5">새로운 상품 등록</h1>
          </div>
          <form name="ProductAdminWrite" method="post" action="product_admin_write.shop?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
            <div class="card pb-4">
              <div class="card-body">
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">상품명</h6>
                  </div>
                  <div class="col-sm-9 ps-0">
                    <input type="text" placeholder="ex) 콰트로 에어 0808 데스크" name="pname"
                      class="col-sm-9 register-input form-control form-control-user mt-3 rounded-start rounded-4">
                  </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">가격</h6>
                  </div>
                  <div class="col-sm-9 ps-0">
                    <input type="text" placeholder="ex) 157000" name="pprice"
                      class="col-sm-9 register-input form-control form-control-user mt-3 rounded-start rounded-4">
                    </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">사이즈</h6>
                  </div>
                  <div class="col-sm-9 ps-0">
                    <input type="text" placeholder="ex) 800 x 800 x 740 mm" name="psize"
                      class="col-sm-9 register-input form-control form-control-user mt-3 rounded-start rounded-4">
                  </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">마감</h6>
                  </div>
                  <div class="col-sm-9 ps-0">
                    <input type="text" placeholder="ex) 스틸프레임, 분체도장 마감" name="pfinishing"
                      class="col-sm-9 register-input form-control form-control-user mt-3 rounded-start rounded-4">
                  </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">유형</h6>
                  </div>
                  <div class="col-sm-4 ps-0 pt-3">
                    <select class="form-select" id="pcategory_write" name="pcategory">
                      <option value="서재" selected>서재</option>
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
                    <select class="form-select" id="ptype_write" name="ptype">
                      <optgroup label="서재">
                        <option value="책상/테이블" selected>책상/테이블</option>
                        <option value="책장/선반장">책장/선반장</option>
                      </optgroup>
                      <optgroup label="침실">
                        <option value="거울/화장대">거울/화장대</option>
                      </optgroup>
                      <optgroup label="거실">
                        <option value="소파">소파</option>
                      </optgroup>
                      <optgroup label="주방">
                        <option value="식탁">식탁</option>
                      </optgroup>
                      <optgroup label="의자">
                        <option value="오피스의자">오피스의자</option>
                      </optgroup>
                    </select>
                  </div>
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">도면 경로</h6>
                  </div>
                  <!-- 업로드 폼 1 -->
					<div class="col-sm-9 ps-0 py-4">
					    <label for="fileInput">권장 사진 크기 : 800 X 700</label>
					    <input type="file" id="fileInputWrite1" name="psizemgpathFile"
					        class="col-sm-9 register-input form-control form-control-user mt-3 rounded-start rounded-4">
					</div>
					<img id="imagePreviewWrite1" alt="이미지 미리보기" class="mt-3">
                </div>
                <div class="form-group row m-0">
                  <div class="col-sm-3 mb-sm-0">
                    <h6 class="pt-4 mt-2 font-weight-bold">이미지 경로</h6>
                  </div>
                  <!-- 업로드 폼 2 -->
					<div class="col-sm-9 ps-0 py-4">
					    <label for="fileInput">권장 사진 크기 : 600 X 600</label>
					    <input type="file" id="fileInputWrite2" name="imgpathFile"
					        class="col-sm-9 register-input form-control form-control-user mt-3 rounded-start rounded-4">
					</div>
					<img id="imagePreviewWrite2" alt="이미지 미리보기" class="mt-3">
                </div>
              </div>
              <div class="row d-flex justify-content-center">
                <div class="col-sm-3">
                    <input type="button" value="등록취소" class="btn btn-login btn-user btn-block" onClick="history.back()"/>
                </div>
                <div class="col-sm-3">
                    <input type="submit" value="상품등록" class="btn btn-login btn-user btn-block"/>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  </div>
  <script>
    setupImagePreview('fileInputWrite1', 'imagePreviewWrite1');
 	setupImagePreview('fileInputWrite2', 'imagePreviewWrite2');
  </script>
  <script src="js/product.js"></script>
</body>

</html>