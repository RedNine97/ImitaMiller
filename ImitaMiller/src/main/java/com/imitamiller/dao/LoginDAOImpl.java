package com.imitamiller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.imitamiller.dto.LoginDTO;
import com.imitamiller.dto.ProductDTO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	// DB객체 얻어오기
	@Autowired
	private DataSource ds;//service-context.xml에서 불러다 사용
	
	private Connection con=null;
	private PreparedStatement pstmt=null; 
	private ResultSet rs=null;
	private String sql="";
	
	@Override
	public void setDs(DataSource ds) {
		this.ds=ds;
		System.out.println("ds => "+ds);
		System.out.println("setDs()호출되서 DB연결됨(ds)");
	}
	
	private void close(AutoCloseable ... objs) {
        try {
            for(AutoCloseable obj : objs) {
                obj.close();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
 }
	
	// 회원로그인 공통부분
	private LoginDTO logindto() throws SQLException {
		LoginDTO ldto = new LoginDTO();
		ldto.setLogin_id(rs.getInt("login_id"));// 상품아이디
		ldto.setId(rs.getString("id"));// 이름
		ldto.setPwd(rs.getString("pwd"));// 사이즈

		return ldto;
	}
	
	//비지니스메서드 구현
	//1.회원인지를 체크해주는 메서드(인증)
	public LoginDTO loginCheck(String id, String pwd){
		LoginDTO loginDto=null;
		
		try {
			//DB접속구문
			con = ds.getConnection();
			//con.setAutoCommit(false);//시작점

			String sql = "select * from memlogin " + 
							  "where id = ? and pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				//사용자가 일치하는 데이터를 찾았으므로 로그인 성공
				loginDto=logindto();
			}
		} catch (SQLException ex) {
			System.out.println("=loginCheck()에러=");
			System.out.println("==에러라인 78==");
			ex.printStackTrace(); 
		} finally { // DB객체를 해제
			close(con, pstmt, rs);
		}
		return loginDto;
	}

}
