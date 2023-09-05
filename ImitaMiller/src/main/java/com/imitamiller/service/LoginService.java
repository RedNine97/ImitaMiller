package com.imitamiller.service;

import java.util.ArrayList;

import com.imitamiller.dto.LoginDTO;
import com.imitamiller.dto.RegisterDTO;
import com.imitamiller.dto.ZipcodeDTO;

public interface LoginService {
	
	LoginDTO loginCheck(String id, String pwd);
	boolean checkId(String id);
	ArrayList<ZipcodeDTO> zipcodeRead(String area3);
	boolean memberInsert(RegisterDTO registerDTO, LoginDTO loginDTO);
}
