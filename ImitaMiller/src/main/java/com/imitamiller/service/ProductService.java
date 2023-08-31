package com.imitamiller.service;

import java.util.Hashtable;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.stereotype.Service;

import com.imitamiller.dto.ProductDTO;

public interface ProductService {
	
	int getNewNum();
	Hashtable pageList(String pageNum, int count);
	int getProductSearchCount(String search, String searchtext);
	List<ProductDTO> getProductList(int start,int end,String search,String searchtext, String sort);
	List<ProductDTO> getRecommendProduct(int start,int end);
	ProductDTO getProductDetail(int pID);
}
