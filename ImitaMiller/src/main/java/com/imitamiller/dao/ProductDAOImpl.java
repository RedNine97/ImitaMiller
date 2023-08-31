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
	private JdbcTemplate jt;//->query()(select), update()(insert, update, delete)
	
	private Connection con=null;
	private PreparedStatement pstmt=null; 
	private ResultSet rs=null;
	private String sql="";
	
	@Override
	public void setDs(DataSource ds) {
		// TODO Auto-generated method stub
		this.ds=ds;
		System.out.println("ds => "+ds);
		this.jt=new JdbcTemplate(ds);//JdbcTemplate(DB정보 객체)
		System.out.println("setDs()호출되서 DB연결됨(ds)");
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
			System.out.println("getNewNum() 에러유발=>"+e);
		}
		return newNum;
	}

		//1.검색어에 해당되는 총레코드수를 구하는 메서드(검색분야,검색어)
		public int getProductSearchCount(String search, String searchtext) {
			int x=0;//총레코드갯수를 저장
			
			try {
				con=ds.getConnection();
				System.out.println("con=>"+con);
				if(search==null || search.equals("")) {
					sql="select count(*) from product";
				}else {
					if(searchtext==null || searchtext.equals("")) {
						sql = "select count(*) from product where pname like '%" + search + "%' or pcategory like '%" + search + "%' or ptype like '%" + search + "%'";
					}else {
						sql="select count(*) from product where pname like '%" + searchtext + "%' or pcategory like '%" + searchtext + "%' or ptype like '%" + searchtext + "%' ";
					}
				}
				System.out.println("getProductSearchCount 검색sql=>"+sql);
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					x=rs.getInt(1);
				}
			}catch(Exception e) {
				System.out.println("getProductSearchCount() 에러발생=>"+e);
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
				System.out.println("getArticles() 에러발생=>"+e);
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
				System.out.println("getProductList()의 sql=>"+sql);
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, start-1+end);
				System.out.println("start="+start+"start-1+end="+(start-1+end));
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
				System.out.println("getProductList() 에러발생=>"+e);
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
				System.out.println("getProduct() 에러유발=>"+e);
			}finally {
				close(con, pstmt, rs);
			}
			return productList;
		}
		
		//상품 상세
		public ProductDTO getProductDetail(int pID) {
			ProductDTO productList=null;
			
			try {
				con=ds.getConnection();
				sql="update product set count=count+1 where pID=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, pID);
				int update=pstmt.executeUpdate();
				System.out.println("조회수 증가(sql)=>"+sql);
				System.out.println("조회수 증가유무(update)=>"+update);
				
				sql="select * from product where pID=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, pID);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					productList=makepdto();
					
				}
			}catch(Exception e) {
				System.out.println("getArticle() 에러발생=>"+e);
			}finally {
				close(con, pstmt, rs);
			}
			return productList;
		}
}
