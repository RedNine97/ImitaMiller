<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>우편번호 검색 </title>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
</head>
<body class="bg-gradient-primary">
    <div class="container justify-content-center">
        <div class="bg-white text-center py-5 my-5 border-0 shadow-lg">
            <h2 class="font-weight-bold">우편번호 찾기</h2>
            <form name="zipForm" action="zipcheck.shop" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <br>
                <div class="form-group row justify-content-center">
                    <label for="area3" class="col-sm-3 col-form-label text-right px-0">동이름 입력 :</label>
                    <div class="col-sm-5 py-2">
                        <input name="area3" type="text" class="form-control" id="area3" autofocus>
                    </div>
                    <div class="col-sm-3 py-3">
                        <input type="button" value="검색" onclick="dongCheck();" class="btn btn-primary">
                    </div>
                </div>
                <input type="hidden" name="check" value="n">
            </form>
            <div>
                <!-- 찾은 데이터를 보여주는 코딩(검색시작) -->
                <c:if test="${check eq 'n'}">
                    <c:if test="${zipcodeList.isEmpty()}">
                        <p class="text-center text-sm mt-1 -mb-2 pb-1 text-danger">
                            검색된 결과가 없습니다.
                        </p>
                    </c:if>
                    <c:if test="${!empty zipcodeList}">
                        <p class="text-center text-sm mt-1 -mb-2 pb-1 text-danger">
                            * 검색후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.
                        </p>
                    </c:if>
                    <!-- 실제 데이터를 출력하는 코딩 -->
                    <div>
                        <br>
                        <c:forEach var="zipcode" items="${zipcodeList}">
                            <c:set var="tempZipcode" value="${zipcode.getZipcode().trim()}"/>
                            <c:set var="tempArea1" value="${zipcode.getArea1().trim()}"/>
                            <c:set var="tempArea2" value="${zipcode.getArea2().trim()}"/>
                            <c:set var="tempArea3" value="${zipcode.getArea3().trim()}"/>
                            <c:set var="tempArea4" value="${zipcode.getArea4().trim()}"/>
                            <a href="JavaScript:sendAddress('${tempZipcode}','${tempArea1}','${tempArea2}','${tempArea3}','${tempArea4}')"
                                class="font-mono text-decoration-none text-dark">
                                ${tempZipcode}&nbsp;${tempArea1}&nbsp;${tempArea2}&nbsp;${tempArea3}&nbsp;${tempArea4}
                            </a><br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
            <div>
                <br>
                <a href="javascript:this.close();" onClick="self.close()">
                    <button class="btn btn-outline-primary">
                        닫기
                    </button>
                </a>
            </div>
        </div>
    </div>
    <script src="js/register.js"></script>
    <script src="js/bootstrap.min.js"></script>
 </body>
 </html>