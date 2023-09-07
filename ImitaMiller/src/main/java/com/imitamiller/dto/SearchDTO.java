package com.imitamiller.dto;

import java.sql.Timestamp;

public class SearchDTO {
	
	private String id; //회원로그인 테이블의 아이디
	private String memname; //회원 테이블의 이름
	private String email; //회원 테이블의 이메일
    private Timestamp enrolldate; //회원 테이블의 회원가입일
    
    //Getter Method
	public String getMemname() {
		return memname;
	}
	public Timestamp getEnrolldate() {
		return enrolldate;
	}
	public String getId() {
		return id;
	}
	public String getEmail() {
		return email;
	}
	
	//Setter Method
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public void setEnrolldate(Timestamp enrolldate) {
		this.enrolldate = enrolldate;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setEmail(String email) {
		this.email = email;
	}
    
    
}
