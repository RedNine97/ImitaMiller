/*!
* Start Bootstrap - New Age v6.0.7 (https://startbootstrap.com/theme/new-age)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-new-age/blob/master/LICENSE)
*/
//
// Scripts
// 

//메인 페이지 슬라이드 쇼 
window.addEventListener('DOMContentLoaded', event => {

    // Activate Bootstrap scrollspy on the main nav element
    const mainNav = document.body.querySelector('#mainNav');
    if (mainNav) {
        new bootstrap.ScrollSpy(document.body, {
            target: '#mainNav',
            offset: 74,
        });
    };

    // Collapse responsive navbar when toggler is visible
    const navbarToggler = document.body.querySelector('.navbar-toggler');
    const responsiveNavItems = [].slice.call(
        document.querySelectorAll('#navbarResponsive .nav-link')
    );
    responsiveNavItems.map(function (responsiveNavItem) {
        responsiveNavItem.addEventListener('click', () => {
            if (window.getComputedStyle(navbarToggler).display !== 'none') {
                navbarToggler.click();
            }
        });
    });

});


/**
 *  상품 필터 검색
 */

var filter1=[];
var filter2="";
var filter3="";
var filter4="";
var sort="";
/*
	조건별 정렬
*/
function sortChange(){
    
    if($('#SortBy option:selected').val()=="PID DESC"){
		sort="PID DESC";
	} else if($('#SortBy option:selected').val()=="pprice DESC"){
		sort="pprice DESC";
	} else if($('#SortBy option:selected').val()=="pprice ASC"){
		sort="pprice ASC";
	}
    
    console.log(sort);
    $('#divReloadLayer').load(location.href + ' #divReloadLayer', "pcategory=" + filter1 + "&ptype=" + filter2 + "&pprice=" + filter3 + "&count=" + filter4 + "&sort=" + sort);
}

//로그인페이지 에러메세지(아이디, 비밀번호)
function loginCheck(){
	var inputID = document.getElementById("inputID");
    var inputPassword = document.getElementById("inputPassword");
    var errorElement = document.getElementById("error_message");
    
  if(inputID.value==""){
    errorElement.innerHTML = '<p class="text-justify text-sm text-red-500 mb-3">아이디를 입력해주세요.</p>'
  return;
  }
  if(inputPassword.value==""){
    errorElement.innerHTML = '<p class="text-justify text-sm text-red-500 mb-3">비밀번호를 입력해주세요.</p>'
  return;
  }
  document.login.submit();
  
}

// 로그아웃 전에 메시지를 가져와서 표시
function Logout() {
    var confirmLogout = window.confirm("로그아웃하시겠습니까?");
    if (confirmLogout) {
        // 확인을 클릭한 경우에만 로그아웃 페이지로 이동
        window.location.href = "logout.shop";
    }
}

function dongCheck() {
	if (document.zipForm.area3.value == "") {
		alert("동이름을 입력하세요");
		document.zipForm.area3.focus();
		return;
	}
	document.zipForm.submit();//U_ZipCheck.jsp  
}

function sendAddress(zipcode, area1, area2, area3, area4) {
	var addr = area1 + " " + area2 + " " + area3 + " " + area4;
	opener.document.register.zipcode.value = zipcode;
	opener.document.register.addr.value = addr;
	self.close();
}

// 우편번호창을 열 수 있도록 함수호출 
function zipCheck() {
	url = "zipcheck.shop";
	window.open(url, "post", "toolbar=no,width=500,height=400,left=900,top=100,directories=no,status=yes,scrollbars=yes,menubar=no");
}

//회원탈퇴 전 비밀번호 입력
function deleteCheck() {
	var pwd = document.getElementById("passwd").value;
    var repwd = document.getElementById("repasswd").value;
	
	if(pwd !== repwd) {
		alert("회원님의 비밀번호가 일치하지 않습니다.");
		return false;
	}
	alert("회원탈퇴가 완료되었습니다.");
	document.memdelete.submit();
}





