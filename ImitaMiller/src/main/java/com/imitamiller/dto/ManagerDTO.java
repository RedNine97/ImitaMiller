package com.imitamiller.dto;

public class ManagerDTO {
	
	private int man_id;//관리자 번호
	private String id;//관리자 아이디
	private String pwd;//관리자 비밀번호
	private String name;//관리자 이름
	private String email;//관리자 이메일
	private String admin_key = "FwlQ7r2uJbI6gNo";
	
	//Getter Method
	public int getMan_id() {
		return man_id;
	}
	public String getId() {
		return id;
	}
	public String getPwd() {
		return pwd;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getAdmin_key() {
		return admin_key;
	}
	
	//Setter Method
	public void setMan_id(int man_id) {
		this.man_id = man_id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setAdmin_key(String admin_key) {
		this.admin_key = admin_key;
	}
	
}
