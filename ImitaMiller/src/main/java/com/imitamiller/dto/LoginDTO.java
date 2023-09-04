package com.imitamiller.dto;

public class LoginDTO {
	
	private int login_id;//회원로그인의 회원번호
	private String id;//회원로그인의 회원아이디
	private String pwd;//회원로그인의 비밀번호
	
	//Setter Method
	public void setLogin_id(int login_id) {
		this.login_id = login_id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	//Getter Method
	public int getLogin_id() {
		return login_id;
	}
	public String getId() {
		return id;
	}
	public String getPwd() {
		return pwd;
	}
	
}
