package com.imitamiller.dao;

import java.util.ArrayList;

import javax.sql.DataSource;

import com.imitamiller.dto.LoginDTO;
import com.imitamiller.dto.RegisterDTO;
import com.imitamiller.dto.ZipcodeDTO;

public interface LoginDAO {
	
	//1.DB연결을 시켜주는 메서드(초기화) -> DataSource객체 -> DB연동
	public void setDs(DataSource ds);//getConnection()
	//로그인할 수 있는지 체크
	LoginDTO loginCheck(String id, String pwd);
	boolean checkId(String id);
	ArrayList<ZipcodeDTO> zipcodeRead(String area3);
	boolean memberInsert(RegisterDTO registerDTO, LoginDTO loginDTO);
}
