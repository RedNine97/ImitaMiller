package com.imitamiller.controller;

import java.util.Collections;
import java.util.Hashtable;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.imitamiller.dto.ProductDTO;
import com.imitamiller.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	//상품 리스트(메뉴 별로 출력)
	@RequestMapping(value="product_list.shop", method=RequestMethod.GET)
	public ModelAndView showProductList(@RequestParam(name = "pageNum", defaultValue = "1") String pageNum,
															@RequestParam(name = "search", defaultValue = "") String search,
															@RequestParam(name = "searchtext", defaultValue = "") String searchtext,
															@RequestParam(name = "sort", defaultValue = "PID DESC") String sort){// 정렬 파라미터 추가
		System.out.println("ProductList의 pageNum 확인 "+pageNum);
		System.out.println("ProductList의 search 확인 "+search);
		System.out.println("ProductList의 searchtext 확인 "+searchtext);
		System.out.println("ProductList의 sort 확인 " + sort); // 정렬 파라미터 확인
		
		int count=0;//총레코드수
		List productList=null;//화면에 출력할 레코드를 저장할 변수
		 
		count=productService.getProductSearchCount(search, searchtext);
		
		System.out.println("현재 레코드수(count)=>"+count);
		
		//1.화면에 출력할 페이지번호, 2.출력할 레코드 갯수
		Hashtable<String,Integer> pgList=productService.pageList(pageNum, count);
		 if (count > 0){
			 System.out.println(pgList.get("startRow")+","+pgList.get("endRow"));
			 productList=productService.getProductList(pgList.get("startRow"),pgList.get("pageSize"),search,searchtext,sort);
			 System.out.println("ProductController의 productList=>"+productList);
		 }else {
			 productList=Collections.EMPTY_LIST;
		 }
		 
		ModelAndView mav=new ModelAndView("product_list");
		mav.addObject("search",search);//검색분야
		mav.addObject("searchtext",searchtext);//검색어
		mav.addObject("pgList",pgList);//페이징처리 10개 정보저장
		mav.addObject("productList",productList);
		
	    return mav;
	}
	
	//상품 상세 페이지
		@RequestMapping(value="product_detail.shop", method=RequestMethod.GET)
		public ModelAndView showProductDetail(@RequestParam(name = "pID", defaultValue = "") int pID){// 정렬 파라미터 추가
			System.out.println("ProductDetail의 매개변수 확인 "+pID);
			
			//다른 상품 보기
			Random random = new Random();// 랜덤 객체 생성
			random.setSeed(System.currentTimeMillis());//규칙적인 랜덤을 방지하기 위함
			
			int a=random.nextInt(19);// 0 이상 19 미만의 무작위 정수 생성
			
			List differentProduct=productService.getRecommendProduct(a+1,a+20);//추천 상품
			System.out.println("a는 = "+a+"\n ProductDetail의 differentProduct() 확인 "+differentProduct);
			
			//상품 상세(pID로 검색한 결과)
			ProductDTO productList = productService.getProductDetail(pID);
			System.out.println("getProductDetail의 productList=>"+productList);
			
			ModelAndView mav=new ModelAndView("product_detail");
			//mav.addObject("productList",productList);
			mav.addObject("differentProduct",differentProduct);
			mav.addObject("productList",productList);
			
		    return mav;
		}

}