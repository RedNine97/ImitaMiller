package com.imitamiller.service;

import java.util.ArrayList;

import com.imitamiller.dto.LoginDTO;
import com.imitamiller.dto.ManagerDTO;
import com.imitamiller.dto.MemberDTO;
import com.imitamiller.dto.SearchDTO;
import com.imitamiller.dto.ZipcodeDTO;

public interface LoginService {
	
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
