package com.imitamiller.dao;

import java.util.Hashtable;
import java.util.List;

import javax.sql.DataSource;

import com.imitamiller.dto.ProductDTO;

public interface ProductDAO {
	
	//1.DB연결을 시켜주는 메서드(초기화) -> DataSource객체 -> DB연동
	public void setDs(DataSource ds);//getConnection()
	int getNewNum();
	int getProductSearchCount(String search, String searchtext);
	List<ProductDTO> getProductList(int start,int end,String search,String searchtext, String sort);
	List<ProductDTO> getRecommendProduct(int start,int end);
	ProductDTO getProductDetail(int pID);
	ProductDTO getProductUpdate(int pID);
	boolean productUpdateProc(ProductDTO product);
}
