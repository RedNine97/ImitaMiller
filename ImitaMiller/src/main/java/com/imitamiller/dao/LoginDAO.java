package com.imitamiller.dao;

import java.util.ArrayList;

import javax.sql.DataSource;

import com.imitamiller.dto.LoginDTO;
import com.imitamiller.dto.ManagerDTO;
import com.imitamiller.dto.MemberDTO;
import com.imitamiller.dto.SearchDTO;
import com.imitamiller.dto.ZipcodeDTO;

public interface LoginDAO {
	
	//1.DB연결을 시켜주는 메서드(초기화) -> DataSource객체 -> DB연동
	public void setDs(DataSource ds);//getConnection()
	//로그인할 수 있는지 체크
	LoginDTO loginCheck(String id);
	boolean checkId(String id);
	ArrayList<ZipcodeDTO> zipcodeRead(String area3);
	boolean memberInsert(MemberDTO registerDTO, LoginDTO loginDTO);
	MemberDTO getMemberInfo(int login_id);
	boolean memberUpdate(int login_id, MemberDTO memberDTO, LoginDTO loginDTO);
	boolean deleteMember(int login_id);
	ArrayList<SearchDTO> getSearchId(String memname, String email);
	SearchDTO searchPwd(String id);
	boolean pwdSearchUpdate(String id, String pwd);
	ManagerDTO managerCheck(String id);
}
