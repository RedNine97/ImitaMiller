package com.imitamiller.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imitamiller.dao.LoginDAO;
import com.imitamiller.dto.LoginDTO;
import com.imitamiller.dto.MemberDTO;
import com.imitamiller.dto.SearchDTO;
import com.imitamiller.dto.ZipcodeDTO;

@Service
public class LoginServiceImpl implements LoginService {
	
	private LoginDAO loginDAO;	
	
	@Autowired
    public LoginServiceImpl(LoginDAO loginDAO) {
        this.loginDAO = loginDAO;
    }

	@Override
	public LoginDTO loginCheck(String id, String pwd) {
		// TODO Auto-generated method stub
		return loginDAO.loginCheck(id, pwd);
	}
	
	@Override
	public boolean checkId(String id) {
		// TODO Auto-generated method stub
		return loginDAO.checkId(id);
	}

	@Override
	public ArrayList<ZipcodeDTO> zipcodeRead(String area3) {
		// TODO Auto-generated method stub
		return loginDAO.zipcodeRead(area3);
	}

	@Override
	public boolean memberInsert(MemberDTO registerDTO, LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		return loginDAO.memberInsert(registerDTO, loginDTO);
	}

	@Override
	public MemberDTO getMemberInfo(int login_id) {
		// TODO Auto-generated method stub
		return loginDAO.getMemberInfo(login_id);
	}

	@Override
	public boolean memberUpdate(int login_id, MemberDTO memberDTO, LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		return loginDAO.memberUpdate(login_id, memberDTO, loginDTO);
	}

	@Override
	public boolean deleteMember(int login_id) {
		// TODO Auto-generated method stub
		return loginDAO.deleteMember(login_id);
	}

	@Override
	public ArrayList<SearchDTO> getSearchId(String memname, String email) {
		// TODO Auto-generated method stub
		return loginDAO.getSearchId(memname, email);
	}

	@Override
	public SearchDTO searchPwd(String id) {
		// TODO Auto-generated method stub
		return loginDAO.searchPwd(id);
	}

	@Override
	public boolean pwdSearchUpdate(String id, String pwd) {
		// TODO Auto-generated method stub
		return loginDAO.pwdSearchUpdate(id, pwd);
	}
	
}
