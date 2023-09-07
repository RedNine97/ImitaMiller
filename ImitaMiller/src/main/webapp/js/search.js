/*
* search.js
*  검색기능에 관한 자바스크립트
*/

	//아이디 찾기페이지
	function IdSearchCheck() {
		var memname =document.getElementById("memname_search");
		var email=document.getElementById("email_search");
		var userkey=document.getElementById("userkey");
		var randomKey=document.getElementById("randomKey");
		
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		
		var searchnameError = document.getElementById("searchname_error");
		//이름
		if(memname.value==""){
			memname.focus();
			$('#searchname_error').show();
			return false;
		}else{//한글자라도 입력한 경우
			$('#searchname_error').hide();
		}
		
		//이메일
		if(email.value==""){
			email.focus();
			$('#searchemail_error').show();
			return false;
		}else{//한글자라도 입력한 경우
			$('#searchemail_error').hide();
		}
		if(!reg_email.test(email.value)) {
			$('#searchemail_error2').show();
			return false;
		}else{//한글자라도 입력한 경우
			$('#searchemail_error2').hide();
		}
		
		var engNum = /^[a-zA-Z0-9]*$/;//영어+숫자(정규식)
		//인증코드 유효성 검사
		if(userkey.value=="" || !engNum.test(userkey.value) || userkey.value.length <8){
			$('#key').show();
			return false;
		}else if(randomKey.value!==userkey.value && userkey.value.length >= 8){
			alert("이메일로 발송된 인증코드와 일치하지 않습니다.");
			return false;
		}else{
			$('#key').hide();
		}
		
		document.SearchId.submit();
		return true;//전송이 가능하게 설정
	}
	
	//id찾기 인증코드 버튼
	$("#shIdButton").on("click", function(){
		return SearchCheck();
	});
	
	//아이디&비밀번호 찾기 검사
	function SearchCheck(){//memname,email
		let email = $("#email_search").val();
		let memname = $("#memname_search").val();
		let reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		
		if(email !="" && reg_email.test(email)){
	   		$.ajax({
			url: "./emailSend.shop",
			type: "post",
			data: {"email" : email,"memname":memname},
			beforeSend: function(){
				$('#searchemail_error').hide();
				$('#searchname_error').hide();
				$('#searchemail').show();
			},
			success: function(key){
				$('#searchemail').hide();
				alert("인증번호를 발송했습니다.\n인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해주세요.");
	    		alert("response : "+key.replace(/\s/g,''));//전달받는 데이터 확인
				$("#randomKey").val(key.replace(/\s/g,''));
				},
				error: function(){
					$('#searchemail').hide();
					alert("메일발송 실패!");
				}
			});
		}else{
	   		alert("이메일을 정확히 기입해주세요.");
		}
		
		return true;
	}
	
	//비밀번호 찾기 - 아이디 유효성검사
	function searchpwdCheck() {
		var regmemid=/[ㄱ-힣~!@#$%^&*()_+|<>?:{}=,.`'";\-\/\[\]\\ ]/gi;
		var memid =document.getElementById("searchPwdId");
		
		//아이디
		if(memid.value=="" || regmemid.test(memid.value)){
			memid.focus();
			alert("아이디를 정확하게 입력해 주세요");
			return false;
		}
		
		document.SearchPwd1.submit();
		return true;//전송이 가능하게 설정
	}

	//비밀번호 찾기 - 이메일 보내기
	function searchpwd2Check() {
		var memname =document.getElementById("memname_search");
		var memnameDb =document.getElementById("memnameDb");
		var userkey=document.getElementById("userkey");
		var randomKey=document.getElementById("randomKey");
		
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		//이름
		if(memname.value === "" || memname.value !== memnameDb.value){
			memname.focus();
			$('#searchname_error').show();
			return false;
		}else{//한글자라도 입력한 경우
			$('#searchname_error').hide();
		}
		
		var engNum = /^[a-zA-Z0-9]*$/;//영어+숫자(정규식)
		//인증코드 유효성 검사
		if(userkey.value=="" || !engNum.test(userkey.value) || userkey.value.length <8){
			$('#key').show();
			return false;
		}else if(randomKey.value!==userkey.value && userkey.value.length >= 8){
			alert("이메일로 발송된 인증코드와 일치하지 않습니다.");
			return false;
		}else{
			$('#key').hide();
		}
		
		document.SearchPwd2.submit();
		return true;//전송이 가능하게 설정
	}
	
	//비밀번호 변경
	function searchUpdateCheck(){
		var pwd =document.getElementById("mem_passwd").value;
		var repwd =document.getElementById("mem_repasswd").value;
		
		// 비밀번호와 비밀번호 확인은 일치하고, 공백 없는 5~12자리의 영문/숫자 조합 (+특수문자 사용가능, 단 \, ', " 제외)
		var regpwd = /^(?!.*[\\\'\\"]).{5,12}$/; // \', ", \ 제외
		if (!regpwd.test(pwd)) {
		    alert("비밀번호는 공백 없는 5~12자리의 영문/숫자 조합이어야 하며, 특수문자 \\, ', \" 를 제외한 문자만 사용 가능합니다.");
		    return false;
		}
		// 비밀번호와 비밀번호 확인은 일치해야 합니다.
        if (pwd !== repwd) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return false;
        }
		
		document.SearchPwdUpdate.submit();
		return true;//전송이 가능하게 설정
	}


