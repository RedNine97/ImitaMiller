package com.imitamiller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.imitamiller.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	// DB객체 얻어오기
	@Autowired
	private DataSource ds;//service-context.xml에서 불러다 사용
	//접속후 sql실행 -> pstmt와 역할이 비슷한 클래스
	
	private Connection con=null;
	private PreparedStatement pstmt=null; 
	private ResultSet rs=null;
	private String sql="";
	
	@Override
	public void setDs(DataSource ds) {
		// TODO Auto-generated method stub
		this.ds=ds;
	}
	
	//상품 공통부분
	private ProductDTO makepdto() throws SQLException {		
		ProductDTO pdto=new ProductDTO();
		pdto.setpID(rs.getInt("pID"));//상품아이디
		pdto.setPname(rs.getString("pname"));//이름
		pdto.setPsize(rs.getString("psize"));//사이즈
		pdto.setPfinishing(rs.getString("pfinishing"));//이미지경로
		pdto.setPfinishing(rs.getString("pfinishing"));//마감
		pdto.setPprice(rs.getInt("pprice"));//가격
		pdto.setPtype(rs.getString("ptype"));//종류
		pdto.setPcategory(rs.getString("pcategory"));//유형
		pdto.setPsizemgpath(rs.getString("psizemgpath"));//도면경로
		pdto.setImgpath(rs.getString("imgpath"));//이미지경로
		pdto.setCount(rs.getInt("count"));//조회수
		
		return pdto;		
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
	
	// 페이징처리
	@Override
	public int getNewNum(){
		int newNum=1;//게시물번호 디폴트 1
		try {
			sql="select max(num) from product";
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery(sql);
			if(rs.next()) {//레코드가 한 개라도 존재한다면 최대값+1
				newNum=rs.getInt(1)+1;//게시물 번호 2,3,4~
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return newNum;
	}

		//1.검색어에 해당되는 총레코드수를 구하는 메서드(검색분야,검색어)
		public int getProductSearchCount(String search, String searchtext) {
			int x=0;//총레코드갯수를 저장
			
			try {
				con=ds.getConnection();
				if(search==null || search.equals("")) {
					sql="select count(*) from product";
				}else {
					if(searchtext==null || searchtext.equals("")) {
						sql = "select count(*) from product where pname like '%" + search + "%' or pcategory like '%" + search + "%' or ptype like '%" + search + "%'";
					}else {
						sql="select count(*) from product where pname like '%" + searchtext + "%' or pcategory like '%" + searchtext + "%' or ptype like '%" + searchtext + "%' ";
					}
				}
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					x=rs.getInt(1);
				}
			}catch(Exception e) {
				System.out.println("getProductSearchCount() 에러:");
		        System.out.println("에러 라인 107:");
		        System.out.println(e);
			}finally {
				close(con, pstmt, rs);
			}
			return x;
		}
		
		//2. 글 목록보기에 대한 메서드 구현 =>한페이지당10개씩 잘라서 보여주는 메서드가 필요함
		public List<ProductDTO> getProduct(int start,int end) {
			List<ProductDTO> productList=null;
			
			try {
				con=ds.getConnection();
				sql = "select * from (select rownum as rnum, pID, pname, psize, pfinishing, pprice , ptype, pcategory, psizemgpath, imgpath, count from (select * from product order by pID desc)) where rnum>=? and rnum<=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, start-1+end);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					productList=new ArrayList(end);
					do {
						ProductDTO pdto=new ProductDTO(); //회원리스트면 MemberDTO
						pdto=makepdto();
						//추가
						productList.add(pdto);//생략하면 데이터 저장X => for문X(Null)
					}while(	rs.next());//더 있으면 계속
				}
			}catch(Exception e) {
				System.out.println("getProduct() 에러:");
		        System.out.println("에러 라인 137:");
		        System.out.println(e);
			}finally {
				close(con, pstmt, rs);
			}
			return productList;
		}
		
		//2)검색어에 따른 레코드의 범위지정
		public List<ProductDTO> getProductList(int start,int end,String search,String searchtext, String sort) {
			List<ProductDTO> productList=null;
			try {
				con=ds.getConnection();
				if(search==null || search.equals("")) {
					sql = "select * from (select rownum as rnum, pID, pname, psize, pfinishing, pprice , ptype, pcategory, psizemgpath, imgpath, count from (select * from product order by "+sort+")) where rnum>=? and rnum<=?";
				}else {
					if(searchtext==null || searchtext.equals("")) {
						sql = "select * from (select rownum as rnum, pID, pname, psize, pfinishing, pprice , ptype, pcategory, psizemgpath, imgpath, count from (select * from product where pname like '%" + search + "%' or pcategory like '%" + search + "%' or ptype like '%" + search + "%'order by "+sort+")) where rnum>=? and rnum<=?";
					}else {
						sql = "select * from (select rownum as rnum, pID, pname, psize, pfinishing, pprice , ptype, pcategory, psizemgpath, imgpath, count from (select * from product where pcategory like '%" + searchtext + "%' or ptype like '%" + searchtext + "%'order by "+sort+")) where rnum>=? and rnum<=?";
					}
				}
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, start-1+end);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					productList=new ArrayList(end);
					do {
						ProductDTO pdto=new ProductDTO();
						pdto=makepdto();
						productList.add(pdto);
					}while(rs.next());
				}
			}catch(Exception e) {
				System.out.println("getProductList() 에러:");
		        System.out.println("에러 라인 173:");
		        System.out.println(e);
			}finally {
				close(con, pstmt, rs);
			}
			return productList;
		}
		
		//베스트 리스트, 상품 상세의 다른 제품 보기 리스트
		public List<ProductDTO> getRecommendProduct(int start,int end) {
			
			List<ProductDTO> productList=null;
			StringBuffer sb = new StringBuffer();
			
			try {
				con=ds.getConnection();
				sb.append("select * from (select rownum as rnum, ");
				sb.append("pID, pname, psize, pfinishing, pprice , ptype, pcategory, psizemgpath, imgpath, count ");
				sb.append("from (select * from product order by count desc)) where rnum>=? and rnum<=?");
				sql=sb.toString();
				
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end-1);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					productList=new ArrayList(end);
					do {
						ProductDTO pdto=new ProductDTO();
						pdto=makepdto();
						productList.add(pdto);
					}while(rs.next());
				}			
			}catch(Exception e) {
				System.out.println("getRecommendProduct() 에러:");
		        System.out.println("에러 라인 208:");
		        System.out.println(e);
			}finally {
				close(con, pstmt, rs);
			}
			return productList;
		}
		
		//상품 상세(count +1, 상품 상세 불러오기)
		public ProductDTO getProductDetail(int pID) {
			ProductDTO productList=null;
			
			try {
				con=ds.getConnection();
				sql="update product set count=count+1 where pID=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, pID);
				int update=pstmt.executeUpdate();
				
				sql="select * from product where pID=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, pID);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					productList=makepdto();
					
				}
			}catch(Exception e) {
				System.out.println("getRecommendProduct() 에러:");
		        System.out.println("에러 라인 237:");
		        System.out.println(e);
			}finally {
				close(con, pstmt, rs);
			}
			return productList;
		}
		
		//수정할 상품을 찾을 메서드
		public ProductDTO getProductUpdate(int pID) {
			
	      ProductDTO product=null;
			try {
				con=ds.getConnection();
				sql="select * from product where pID=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, pID);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					 product=makepdto();
				}
			}catch(Exception e) {
				System.out.println("getProductUpdate() 에러:");
		        System.out.println("에러 라인 260:");
		        System.out.println(e);
			}finally {
				close(con, pstmt, rs);
			}
			return product;
		}
		
		//상품수정
		public boolean productUpdateProc(ProductDTO product) {

			boolean check = false;  // 게시물의 수정성공유무

			try {// 기존 상품 정보 조회
				con = ds.getConnection();

				sql = "update product set pprice=?,psize=?,pfinishing=?,pcategory=?,ptype=?,psizemgpath=?,imgpath=?,pname=? where pID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, product.getPprice());
				pstmt.setString(2, product.getPsize());
				pstmt.setString(3, product.getPfinishing());
				pstmt.setString(4, product.getPcategory());
				pstmt.setString(5, product.getPtype());
				pstmt.setString(6, product.getPsizemgpath());
				pstmt.setString(7, product.getImgpath());
				pstmt.setString(8, product.getPname());
				pstmt.setInt(9, product.getpID());
				int update = pstmt.executeUpdate();
				if (update > 0) {
					check = true;
				}
				
			} catch (Exception e) {
				System.out.println("productUpdateProc() 에러:");
		        System.out.println("에러 라인 294:");
		        System.out.println(e);
			} finally {
				close(con, pstmt, rs);
			}
			return check;
		}
		
		// 상품등록
		public boolean ProductInsert(ProductDTO product) {
			boolean check = false; //상품등록 성공 여부
			
			try {//기존 상품 pID MAX값을 조회
		        con = ds.getConnection();
		        con.setAutoCommit(false); // Auto Commit 모드를 비활성화

		        // 1. 먼저 최대 pID를 검색
		        String maxIdQuery = "SELECT MAX(pID) AS max_pid FROM product";
		        pstmt = con.prepareStatement(maxIdQuery);
		        rs=pstmt.executeQuery();
		        int maxPId = 0;
		        
		        if (rs.next()) {
		        	maxPId = rs.getInt("max_pid");
		        
					// 2. 다음으로 최대 pID에서 +1 한 값을 사용하여 데이터를 삽입
					String insertQuery = "INSERT INTO product (pID, pname, psize, pfinishing, pprice, ptype, pcategory, psizemgpath, imgpath, count) "
													+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
					pstmt = con.prepareStatement(insertQuery);
					pstmt.setInt(1, maxPId + 1);
					pstmt.setString(2, product.getPname());
					pstmt.setString(3, product.getPsize());
					pstmt.setString(4, product.getPfinishing());
					pstmt.setInt(5, product.getPprice());
					pstmt.setString(6, product.getPtype());
					pstmt.setString(7, product.getPcategory());
					pstmt.setString(8, product.getPsizemgpath());
					pstmt.setString(9, product.getImgpath());
					pstmt.setInt(10, product.getCount());
	
					int insert = pstmt.executeUpdate();
	
					if (insert > 0) {
						check = true; // 상품등록 성공
					}
		        }
				con.commit(); //커밋
			} catch (Exception e) {
				System.out.println("ProductInsert() 에러:");
		        System.out.println("에러 라인 343:");
		        System.out.println(e);
			}  finally {// DB 객체를 해제
		        try {
		            con.setAutoCommit(true); // Auto Commit 모드를 다시 활성화
		            close(con, pstmt);
		        } catch (SQLException se) {
		            se.printStackTrace();
		        }
		    }
			return check;
		}
		
		//상품삭제
		public boolean getProductDelete(int pID) {
			boolean check = false;// 상품 삭제유무
			try {
				// DB접속구문
				con = ds.getConnection();
				con.setAutoCommit(false);// 시작점

				String sql = "delete from product where pID = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, pID);
				// 1->delete 했다. ,0 -> delete실패
				int delete = pstmt.executeUpdate();
				
				con.commit();// 오라클의 경우
				if (delete == 1) {
					check = true;// 데이터수정 성공
				}
			} catch (Exception e) {
				System.out.println("getProductDelete() 에러:");
		        System.out.println("에러 라인 376:");
		        System.out.println(e);
			} finally { // DB객체를 해제
				try {
					con.setAutoCommit(true); 
					close(con, pstmt);
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			return check;
		}
}
