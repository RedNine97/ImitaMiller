//
// meminfo 에러방지 분리
// 회원정보 ---------------------------------------
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});
document.addEventListener("DOMContentLoaded", function () {
	var isDuplicateChecked = false; // 초기에 중복 체크를 수행하지 않은 상태로 설정
	var mem_idValue = ""; // 중복 체크를 통해 확인한 mem_id 값을 저장
    // 중복 체크 버튼 클릭 시
    document.getElementById("checkDuplicate2").addEventListener("click", function () {
		 // 사용자 아이디 입력값 가져오기
	    var mem_id = document.getElementById("mem_id2").value;// 전역 변수 mem_id 사용	
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
                    mem_idValue = mem_id; // 중복 체크가 완료된 mem_id 값을 저장
                }
            }
        });
    });
    
    var isZipChecked = false; // 초기에 우편번호를 수행하지 않은 상태로 설정
    // 우편번호 확인 버튼 클릭 시
    document.getElementById("zipCheckButton2").addEventListener("click", function () {
        zipCheck(); // zipCheck 함수 호출
        isZipChecked = true;
    });
    
	//회원정보 버튼 클릭 시 폼 제출
	document.getElementById("myinputCheck").addEventListener("click", function() {
		// mem_id와 mem_idValue 비교
		var mem_id = document.getElementById("mem_id2").value;
		if (mem_id !== mem_idValue) {
			// mem_id와 mem_idValue가 다른 경우 폼 제출을 막습니다.
			alert("입력한 아이디와 중복체크한 아이디가 일치하지 않습니다.");
			return;
		}

		// 유효성 검사를 수행
		if (validateForm2()) {
			alert("회원정보가 수정되었습니다. 다시 로그인 해주세요.");
			// 폼 제출
			document.getElementById("memupdate").submit();
		}
	});
	
    function validateForm2() {
        // 여기에서 회원가입 유효성 검사를 수행
        var memname = document.getElementById("Name2").value;
        var birthday = document.getElementById("birthday2").value;
        var mem_id = document.getElementById("mem_id2").value;
        var mem_passwd = document.getElementById("mem_passwd2").value;
        var mem_repasswd = document.getElementById("mem_repasswd2").value;
        var mem_email = document.getElementById("mem_email2").value;
        var mphone = document.getElementById("mphone2").value;
        var mem_zipcode = document.getElementById("mem_zipcode2").value;
        var mem_address = document.getElementById("mem_address2").value;

        // 여기에서 각 입력 필드의 유효성 검사를 수행
        // 유효성 검사에 실패하면 사용자에게 알림을 표시하고 false를 반환
		
		// 입력 필드가 비어있는지 체크합니다.
		var fieldNames = {
		    "Name2": "성명",
		    "birthday2": "생년월일",
		    "mem_id2": "아이디",
		    "mem_passwd2": "비밀번호",
		    "mem_repasswd2": "비밀번호 확인",
		    "mem_email2": "이메일",
		    "mphone2": "휴대전화 번호",
		    "mem_zipcode2": "우편번호",
		    "mem_address2": "주소"
		};
        var requiredFields = ["Name2", "birthday2", "mem_id2", "mem_passwd2", "mem_repasswd2", "mem_email2", "mphone2", "mem_zipcode2", "mem_address2"];
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
	    var regEx = /^[0-9]{11}$/; // 8자리 숫자만 허용하는 정규 표현식
	
	    if (!regEx.test(phoneNumber)) {
	        alert("올바른 휴대전화 번호 형식이 아닙니다.");
	        return false;
	    }
	    
	    // "-"를 제거한 값을 다시 mphone 입력란에 설정
	    document.getElementById("mphone2").value = phoneNumber;
	    	
        // 모든 유효성 검사를 통과한 경우 true를 반환합니다.
        return true;
    }

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
	opener.document.memupdate.zipcode.value = zipcode;
	opener.document.memupdate.addr.value = addr;
	self.close();
}

// 우편번호창을 열 수 있도록 함수호출 
function zipCheck() {
	url = "zipcheck.shop";
	window.open(url, "post", "toolbar=no,width=500,height=400,left=900,top=100,directories=no,status=yes,scrollbars=yes,menubar=no");
}

//이메일
// 현재 날짜 구하기 -> 미래는 선택 X
document.addEventListener("DOMContentLoaded", function () {
  var currentDate = new Date();
  var currentDateString = currentDate.toISOString().slice(0, 10);
  document.getElementById("birthday2").max = currentDateString;
});
