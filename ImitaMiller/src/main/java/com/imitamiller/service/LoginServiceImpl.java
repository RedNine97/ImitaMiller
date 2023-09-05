package com.imitamiller.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imitamiller.dao.LoginDAO;
import com.imitamiller.dto.LoginDTO;
import com.imitamiller.dto.RegisterDTO;
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
	public boolean memberInsert(RegisterDTO registerDTO, LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		return loginDAO.memberInsert(registerDTO, loginDTO);
	}
	
	
	

}
