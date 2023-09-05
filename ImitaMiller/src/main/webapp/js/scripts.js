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

//회원가입 ---------------------------------------
// scripts.js 파일 내용
document.addEventListener("DOMContentLoaded", function () {
	var isDuplicateChecked = false; // 초기에 중복 체크를 수행하지 않은 상태로 설정
    // 중복 체크 버튼 클릭 시
    document.getElementById("checkDuplicate").addEventListener("click", function () {
        // 사용자 아이디 입력값 가져오기
        var mem_id = document.getElementById("mem_id").value;
       	//AJAX를 사용해 비동기 방식으로 서버에 중복 ID 확인 요청 보내기
        $.post("./checkId.shop", { mem_id: mem_id }, function(response) {
            if (response) {
                alert("사용자 아이디가 중복됩니다. 다른 아이디를 입력하세요.");
                isDuplicateChecked = false; // 중복이므로 false로 설정
            } else {
                // 아이디 형식 검사
                var regId = /^[a-zA-Z0-9]{5,12}$/;
                if (!regId.test(mem_id)) {
                    alert("아이디는 최소 5자 이상, 12자 이하, 알파벳 대문자, 소문자, 숫자로만 이루어져야 합니다.");
                    isDuplicateChecked = false;
                } else {
                    alert("사용자 아이디를 사용할 수 있습니다.");
                    isDuplicateChecked = true; // 중복이 아니므로 true로 설정
                }
            }
        });
    });
    
    var isZipChecked = false; // 초기에 우편번호를 수행하지 않은 상태로 설정
    // 우편번호 확인 버튼 클릭 시
    document.getElementById("zipCheckButton").addEventListener("click", function () {
        zipCheck(); // zipCheck 함수 호출
        isZipChecked = true;
    });
    
    // 버튼 클릭 시 폼 제출
    document.getElementById("inputCheck").addEventListener("click", function () {
        // 중복 체크를 수행
	    if (!isDuplicateChecked) {
	        // 중복 체크가 실패한 경우 폼 제출을 막습니다.
	        alert("중복 체크를 먼저 수행하세요.");
	        return;
	    }
	    
	    // 우편번호 체크를 수행
	    if (!isZipChecked) {
	        // 우편번호 체크가 실패한 경우 폼 제출을 막습니다.
	        alert("우편번호 찾기를 먼저 수행하세요.");
	        return;
	    }
	
	    // 유효성 검사를 수행
	    if (validateForm()) {
	        // 폼 제출
	        document.getElementById("register").submit();
	    }
    });

    function validateForm() {
        // 여기에서 회원가입 유효성 검사를 수행
        var memname = document.getElementById("Name").value;
        var birthday = document.getElementById("birthday").value;
        var mem_id = document.getElementById("mem_id").value;
        var mem_passwd = document.getElementById("mem_passwd").value;
        var mem_repasswd = document.getElementById("mem_repasswd").value;
        var mem_email = document.getElementById("mem_email").value;
        var number = document.getElementById("number").value;
        var mphone = document.getElementById("mphone").value;
        var mem_zipcode = document.getElementById("mem_zipcode").value;
        var mem_address = document.getElementById("mem_address").value;

        // 여기에서 각 입력 필드의 유효성 검사를 수행
        // 유효성 검사에 실패하면 사용자에게 알림을 표시하고 false를 반환
		
		// 입력 필드가 비어있는지 체크합니다.
		var fieldNames = {
		    "Name": "성명",
		    "birthday": "생년월일",
		    "mem_id": "아이디",
		    "mem_passwd": "비밀번호",
		    "mem_repasswd": "비밀번호 확인",
		    "mem_email": "이메일",
		    "number": "휴대전화 식별번호",
		    "mphone": "휴대전화 번호",
		    "mem_zipcode": "우편번호",
		    "mem_address": "주소"
		};
        var requiredFields = ["Name", "birthday", "mem_id", "mem_passwd", "mem_repasswd", "mem_email", "number", "mphone", "mem_zipcode", "mem_address"];
        for (var i = 0; i < requiredFields.length; i++) {
            var fieldName = requiredFields[i];
            var fieldValue = document.getElementById(fieldName).value;
            if (fieldValue.trim() === "") {
                alert(fieldNames[fieldName] + "을(를) 입력해 주세요.");
                return false;
            }
        }
		
        // 아이디는 최소 5자 이상, 12자 이하, 알파벳 대문자, 소문자, 숫자
        var regId = /^[a-zA-Z0-9]{5,12}$/;
        if (!regId.test(mem_id)) {
            alert("아이디는 최소 5자 이상, 12자 이하, 알파벳 대문자, 소문자, 숫자로만 이루어져야 합니다.");
            return false;
        }
		
		// 비밀번호와 비밀번호 확인은 일치하고, 공백 없는 5~12자리의 영문/숫자 조합 (+특수문자 사용가능, 단 \, ', " 제외)
		var regPassword = /^(?!.*[\\\'\\"]).{5,12}$/; // \', ", \ 제외
		if (!regPassword.test(mem_passwd)) {
		    alert("비밀번호는 공백 없는 5~12자리의 영문/숫자 조합이어야 하며, 특수문자 \\, ', \" 를 제외한 문자만 사용 가능합니다.");
		    return false;
		}
		// 비밀번호와 비밀번호 확인은 일치해야 합니다.
        if (mem_passwd !== mem_repasswd) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return false;
        }
        
        //이메일(사용자 이름, '@' 문자, 도메인 이름, 그리고 최상위 도메인 및 옵션의 하위 도메인으로 구성)
        var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        if (!reg_email.test(mem_email)) {
		    alert("유효한 이메일 주소를 입력하세요.\n예시 : abcd1234@gmail.com");
		    return false;
		}

        // 여기에서 휴대전화 번호 유효성 검사를 수행
	    var phoneNumber = mphone.replace(/-/g, ''); // 입력된 번호에서 '-' 제거
	    var regEx = /^[0-9]{8}$/; // 8자리 숫자만 허용하는 정규 표현식
	
	    if (!regEx.test(phoneNumber)) {
	        alert("올바른 휴대전화 번호 형식이 아닙니다.");
	        return false;
	    }
	    
	    // "-"를 제거한 값을 다시 mphone 입력란에 설정
	    document.getElementById("mphone").value = phoneNumber;
	    	
        // 모든 유효성 검사를 통과한 경우 true를 반환합니다.
        return true;
    }

});

//이메일
// 현재 날짜 구하기 -> 미래는 선택 X
document.addEventListener("DOMContentLoaded", function () {
  var currentDate = new Date();
  var currentDateString = currentDate.toISOString().slice(0, 10);
  document.getElementById("birthday").max = currentDateString;
});

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
