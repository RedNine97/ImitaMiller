package com.imitamiller.service;

import com.imitamiller.dto.LoginDTO;

public interface LoginService {
	
	LoginDTO loginCheck(String id, String pwd);
}
