package com.imitamiller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.imitamiller.dto.LoginDTO;
import com.imitamiller.dto.RegisterDTO;
import com.imitamiller.dto.ZipcodeDTO;

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
	
	//중복ID를 체크하는 메서드
	public boolean checkId(String id) {
	    boolean Check = false; // 테이블 중복 체크
	    System.out.println("id 값은 = "+id);
	    try {
	        // memlogin 테이블에서 중복 체크
	        con = ds.getConnection();
	        System.out.println("con=" + con);
	        String sql = "select id from memlogin where id = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();
	        Check = rs.next(); // true
	        
	        // manager 테이블에서 중복 체크
	        String managerSql = "select id from manager where id = ?";
	        pstmt = con.prepareStatement(managerSql);
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();
	        Check = rs.next(); // true
	        
	        System.out.println("중복ID를 체크 checkId => " + Check);
	    } catch (Exception ex) {
	        System.out.println("=checkId()에러=");
	        System.out.println("==에러라인 109==");
	        System.out.println(ex);
	    } finally { // DB객체를 해제
			close(con, pstmt, rs);
		}
	    
	    // 중복 ID가 member 또는 manager 테이블에서 발견된 경우 true를 반환
	    return Check;
	}

	
	//우편번호를 검색
	public ArrayList<ZipcodeDTO> zipcodeRead(String area3) {
		ArrayList<ZipcodeDTO> vecList = new ArrayList();// 담을객체

		try {
			// DB접속구문
			con = ds.getConnection();
			String sql = "select * from zipcode where area3 like '" + area3 + "%'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// 검색한 데이터를 찾아서 ArrayList에 담는코딩
			while (rs.next()) {// 찾은 데이터가 있다면
				ZipcodeDTO tempZipcode = new ZipcodeDTO();
				tempZipcode.setZipcode(rs.getString("zipcode"));
				tempZipcode.setArea1(rs.getString("area1"));
				tempZipcode.setArea2(rs.getString("area2"));
				tempZipcode.setArea3(rs.getString("area3"));
				tempZipcode.setArea4(rs.getString("area4"));
				// ArrayList에 담기->화면에 출력하기위해
				vecList.add(tempZipcode);
			}
		} catch (Exception ex) {
			System.out.println("=zipcodeRead()에러=");
			System.out.println("==에러라인 143==");
			System.out.println(ex);
		} finally { // DB객체를 해제
			close(con, pstmt, rs);
		}
		return vecList;
	}
	
	public boolean memberInsert(RegisterDTO registerDTO, LoginDTO loginDTO) {
	    boolean check = false; // 회원가입 성공 여부

	    try {
	        con = ds.getConnection();
	        con.setAutoCommit(false); // Auto Commit 모드를 비활성화

	        // 1. 먼저 최대 mem_id를 검색
	        String maxIdQuery = "SELECT MAX(mem_id) AS max_mem_id FROM member";
	        pstmt = con.prepareStatement(maxIdQuery);
	        ResultSet maxIdResult = pstmt.executeQuery();
	        int maxMemId = 0;

	        if (maxIdResult.next()) {
	            maxMemId = maxIdResult.getInt("max_mem_id");
	        }

	        // 2. 다음으로 최대 mem_id에서 +1 한 값을 사용하여 데이터를 삽입
	        String insertQuery = "INSERT INTO member (mem_id, memname, birthday, email, mphone, enrolldate, addr, zipcode) "
	                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	        pstmt = con.prepareStatement(insertQuery);
	        pstmt.setInt(1, maxMemId + 1);
	        pstmt.setString(2, registerDTO.getMemname());
	        pstmt.setString(3, registerDTO.getBirthday());
	        pstmt.setString(4, registerDTO.getEmail());
	        pstmt.setString(5, registerDTO.getMphone());
	        pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis())); // 현재 시간을 Timestamp로 변환
	        pstmt.setString(7, registerDTO.getAddr());
	        pstmt.setString(8, registerDTO.getZipcode());

	        int insertedRows = pstmt.executeUpdate();
	        System.out.println("member 테이블" + insertedRows);

	        if (insertedRows > 0) {
	            // 3. 회원 정보가 제대로 삽입되었다면 login_id에 mem_id를 삽입하는 쿼리 실행
	            String loginInsertSQL = "INSERT INTO memlogin (login_id, id, pwd) VALUES (?, ?, ?)";
	            pstmt = con.prepareStatement(loginInsertSQL);
	            pstmt.setInt(1, maxMemId + 1);// mem_id를 login_id에 사용
	            pstmt.setString(2, loginDTO.getId());
	            pstmt.setString(3, loginDTO.getPwd());

	            int loginInsertedRows = pstmt.executeUpdate();
	            System.out.println("memlogin 테이블" + loginInsertedRows);

	            if (loginInsertedRows > 0) {
	                check = true; // 회원가입 성공
	            }
	        }

	        // 모든 쿼리가 성공적으로 실행되면 커밋
	        con.commit();
	    } catch (Exception ex) {
	        // 에러 발생 시 롤백
	        try {
	            con.rollback();
	        } catch (SQLException se) {
	            se.printStackTrace();
	        }
	        System.out.println("=memberInsert()에러=");
	        System.out.println("==에러라인 242==");
	        ex.printStackTrace();
	    } finally { // DB 객체를 해제
	        try {
	            con.setAutoCommit(true); // Auto Commit 모드를 다시 활성화
	            close(con, pstmt);
	        } catch (SQLException se) {
	            se.printStackTrace();
	        }
	    }

	    return check;
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
