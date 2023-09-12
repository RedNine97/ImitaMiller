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
            <h1 class="h4 mb-4 pb-5">에러페이지</h1>
          </div>
          <form name="ProductAdminUpdate">
            <div class="card pb-4">
              <div class="card-body text-center">
                <a>에러가 발생했습니다. 다시 시도해 주세요.</a><br>
                <c:if test="${not empty errormessage}">
                  <a>${errormessage}</a>
                </c:if>
              </div>
              ${exception}
              <div class="row d-flex justify-content-center">
                <div class="col-sm-3">
                    <input type="button" value="돌아가기" class="btn btn-login btn-user btn-block" onClick="history.back()"/>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  </div>
  <script src="js/scripts.js"></script>
</body>

</html>