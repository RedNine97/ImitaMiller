package com.imitamiller.service;

import java.util.Hashtable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imitamiller.dao.ProductDAO;
import com.imitamiller.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {
	
	private ProductDAO productDAO;	
	
	@Autowired
    public ProductServiceImpl(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }
	
	// 페이징처리 계산
	@Override
	public int getNewNum() {
		// TODO Auto-generated method stub
		return productDAO.getNewNum();
	}

	// Hashtable객체를 반환값으로=>페이징 처리에 관련된 처리결과를 저장할 변수들을 하나의 객체에 담아서
	// 반환(key,value)->${키명}사용하기위해
	@Override
	public Hashtable pageList(String pageNum, int count) {
		// 0.페이징 처리결과를 저장할 Hashtable객체를 선언
		Hashtable<String, Integer> pageList = new Hashtable<String, Integer>();

		int pageSize = 9;// numPerPage 페이지당 보여주는 게시물 수(=레코드 수)(default:10)
		int blockSize = 3;// pagePerBlock 블럭 당 보여주는 페이지 수(default:10)

		// 처음 실행하면 무조건 1페이지부터 출력한다. 가장 최근의 글이 나오게 설정해줬기 때문
		if (pageNum == null) {// 처음에 1페이지는 내가 누를 수 없기 때문에 parameter값이 null
			pageNum = "1";// 무조건 default로 1페이지 설정
		}
		// nowPage(현재페이지(클릭해서 보고 있는 페이지))
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;// 시작 레코드 번호
		int endRow = currentPage * pageSize;// ex) 1*10=10, 2*10=20, 3*10=30

		System.out.println("currentPage : " + currentPage);
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);

		int number = 0;// beginPerPage 페이지별로 시작하는 맨 처음에 나오는 게시물 번호

		System.out.println("현재 레코드수(count)=>" + count);
		number = count - (currentPage - 1) * pageSize;
		System.out.println("페이지별 number=>" + number);

		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		// 2.시작페이지
		int startPage = 0;

		if (currentPage % blockSize != 0) {// ex) 1~9페이지(10)11~19(20)21~29(경계선)
			startPage = currentPage / blockSize * blockSize + 1;
		} else {// 10%10=0(10의 배수)
			// ex) (10/10-1 )*10=0+1=1, 20=>11
			startPage = ((currentPage / blockSize) - 1) * blockSize + 1;
		}
		// 종료페이지
		int endPage = startPage + blockSize - 1;// ex) 1+10-1=10,11+10
		System.out.println("startPage=" + startPage + ",endPage=" + endPage);
		// 블럭별로 구분해서 링크걸어서 출력
		if (endPage > pageCount)
			endPage = pageCount;
		/*
		 * ex) 페이징 처리에 대한 계산결과=>Hashtable에 저장->ListAction전달 메모리에 저장->공유->list.jsp에서 불러다
		 * 사용
		 */
		pageList.put("pageSize", pageSize); // pageList.get(키명)
		pageList.put("blockSize", blockSize);
		pageList.put("currentPage", currentPage);
		pageList.put("startRow", startRow);
		pageList.put("endRow", endRow);
		pageList.put("count", count);
		pageList.put("number", number);
		pageList.put("startPage", startPage);
		pageList.put("endPage", endPage);
		pageList.put("pageCount", pageCount);

		return pageList;
	}

	@Override
	public int getProductSearchCount(String search, String searchtext) {
		// TODO Auto-generated method stub
		return productDAO.getProductSearchCount(search, searchtext);
	}

	@Override
	public List<ProductDTO> getProductList(int start, int end, String search, String searchtext, String sort) {
		// TODO Auto-generated method stub
		return productDAO.getProductList(start, end, search, searchtext, sort);
	}

	//상품 상세
	@Override
	public List<ProductDTO> getRecommendProduct(int start, int end) {
		// TODO Auto-generated method stub
		return productDAO.getRecommendProduct(start, end);
	}

	@Override
	public ProductDTO getProductDetail(int pID) {
		// TODO Auto-generated method stub
		return productDAO.getProductDetail(pID);
	}

	@Override
	public ProductDTO getProductUpdate(int pID) {
		// TODO Auto-generated method stub
		return productDAO.getProductUpdate(pID);
	}

	@Override
	public boolean productUpdateProc(ProductDTO product) {
		// TODO Auto-generated method stub
		return productDAO.productUpdateProc(product);
	}

	@Override
	public boolean ProductInsert(ProductDTO product) {
		// TODO Auto-generated method stub
		return productDAO.ProductInsert(product);
	}

	@Override
	public boolean getProductDelete(int pID) {
		// TODO Auto-generated method stub
		return productDAO.getProductDelete(pID);
	}
	
}
