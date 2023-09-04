package com.imitamiller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imitamiller.dao.LoginDAO;
import com.imitamiller.dto.LoginDTO;

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
	
	
	

}
