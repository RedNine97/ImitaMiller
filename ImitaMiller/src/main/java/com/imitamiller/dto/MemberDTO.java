package com.imitamiller.dto;

import java.sql.Timestamp;

public class MemberDTO {
	//member 테이블
	private int mem_id;//회원번호
	private String memname;//회원이름
	private String birthday;//생년월일 -> Date
	private String email;//이메일
	private String mphone;//휴대전화
	private Timestamp enrolldate;//회원가입일 -> Date
	private String addr;//주소
	private String zipcode;//우편번호
	
	//Getter Method
	public int getMem_id() {
		return mem_id;
	}
	public String getMemname() {
		return memname;
	}
	public String getBirthday() {
		return birthday;
	}
	public String getEmail() {
		return email;
	}
	public String getMphone() {
		return mphone;
	}
	public Timestamp getEnrolldate() {
		return enrolldate;
	}
	public String getAddr() {
		return addr;
	}
	public String getZipcode() {
		return zipcode;
	}
	
	//Setter Method
	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public void setEnrolldate(Timestamp enrolldate) {
		this.enrolldate = enrolldate;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	
	
}
