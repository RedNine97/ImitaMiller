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
public class HomeController {
	
	private ProductService productService;
	
	@Autowired
    public HomeController(ProductService productService) {
        this.productService = productService;
    }
	
	//메인 페이지
	@RequestMapping(value="main.shop", method=RequestMethod.GET)
	public ModelAndView index(){
		System.out.println("main() 호출됨!!!");
		
		//베스트 상품
		List<ProductDTO> differentProduct=productService.getRecommendProduct(1, 9);//추천 상품
		System.out.println("main의 베스트 상품 "+differentProduct);
		
		//메인 상품
		//ptype="오피스의자"
		List chair=productService.getProductList(1,4,"의자","오피스의자","PID DESC");
		//ptype="식탁"
		List kitchen=productService.getProductList(1,4,"주방","식탁","PID DESC");
		//ptype="소파"
		List living=productService.getProductList(1,4,"거실","소파","PID DESC");
		//ptype="거울/화장대"
		List bedroom=productService.getProductList(1,4,"침실","거울/화장대","PID DESC");
		//ptype="책상/테이블"
		List library1=productService.getProductList(1,4,"서재","책상/테이블","PID DESC");
		//ptype="책장/선반장"
		List library2=productService.getProductList(1,4,"서재","책장/선반장","PID DESC");
		
		ModelAndView mav=new ModelAndView("main");
		mav.addObject("best",differentProduct);
		mav.addObject("list1",chair);
		mav.addObject("list2",kitchen);
		mav.addObject("list3",living);
		mav.addObject("list4",bedroom);
		mav.addObject("list5",library1);
		mav.addObject("list6",library2);
		return mav;
	}
	
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
	
	
	/*
	 * public String hello() -> return "home"; (/home.jsp로 전환)
	 * 이동하면서 데이터도 전달 -> ModelAndView
	 * 메서드 -> 다른 컨트롤러 이용 -> redirect:/요청명령어를 이용 -> return "redirect:/요청명령어";
	 
	@RequestMapping(value="ProductList.shop", method=RequestMethod.GET)
	public ModelAndView getProductList() throws Exception {		
		
		List<ProductDTO> ProductDtoList = productService.getProductList(1,8);
		System.out.println("Product의 매개변수 확인");
		
		ModelAndView mav=new ModelAndView("ProductList");
		mav.setViewName("ProductList");
		mav.addObject("ProductDtoList",ProductDtoList);
		if (!ProductDtoList.isEmpty()) {
	        ProductDTO firstProduct = ProductDtoList.get(0); // 첫 번째 제품 정보를 가져옴
	        mav.addObject("firstProduct", firstProduct); // 단일 ProductDTO 객체를 뷰에 전달
	    }

		return mav;
	}
*/
}