package com.imitamiller.controller;

import java.util.Collections;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.imitamiller.dto.ManagerDTO;
import com.imitamiller.dto.MemberDTO;
import com.imitamiller.dto.ProductDTO;
import com.imitamiller.service.LoginService;
import com.imitamiller.service.ProductService;

@Controller
public class ManagerController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private LoginService loginService;
	
	@GetMapping("/adminpage.shop")
    public String checkAdminKey(HttpSession session, 
    											Model model) {
		// AdminKeyCheck() 메서드 호출
		// 관리자인지 확인할 인증키
        String admin_key_check = AdminKeyCheck(); 
        
        //ManagerDTO 정보
        //DTO객체 안에 있는 인증키와 AdminKeyCheck() 안에 인증키로 구분한다.
        ManagerDTO managerCheck = (ManagerDTO) session.getAttribute("managerCheck");
        
        model.addAttribute("admin_key_check", admin_key_check); // 모델에 adminKey 추가
        model.addAttribute("managerCheck", managerCheck);
        
        //로직을 이렇게 구성했지만 url로 접근하면 인증키가 노출되기 때문에
        //Spring Security를 사용하는 것이 바람직 한 것 같다..
        if (managerCheck == null || admin_key_check == null 
        		|| !admin_key_check.equals(managerCheck.getAdmin_key())) {
        	return "redirect:/error.shop";
        }
        
        return "/adminpage"; // adminpage.jsp로 이동
    }

    private String AdminKeyCheck() {
        String admin_key_check = "FwlQ7r2uJbI6gNo";
        return admin_key_check;
    }
    
    //상품정보 페이지 - 관리자
  	@RequestMapping(value="product_admin_list.shop", method=RequestMethod.GET)
  	public ModelAndView getProduct_admin_list(@RequestParam(name = "pageNum", defaultValue = "1") String pageNum,
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
  		 
  		ModelAndView mav=new ModelAndView("product_admin_list");
  		mav.addObject("search",search);//검색분야
  		mav.addObject("searchtext",searchtext);//검색어
  		mav.addObject("pgList",pgList);//페이징처리 10개 정보저장
  		mav.addObject("productList",productList);
  		
  	    return mav;
  	}
  	
  	//상품 수정하기 pID 정보
  	@RequestMapping(value="product_admin_update.shop", method=RequestMethod.GET)
	public String getProduct_admin_update(@RequestParam("pID") int pID, Model model) {
  		ProductDTO productDto = productService.getProductUpdate(pID);
  		model.addAttribute("productDto", productDto);
  		
		return "/product_admin_update";
	}
  	
  //상품 수정하기 
  	@RequestMapping(value="product_admin_update.shop", method=RequestMethod.POST)
	public String getProduct_admin_updateproc(@ModelAttribute("ProductDTO") ProductDTO productDto,
																	@RequestParam("repsizemgpath") String repsizemgpath,
																	@RequestParam("reimgpath") String reimgpath, Model model) {
	  	// 이미지가 수정 사항이 없을 시
		if (productDto.getPsizemgpath() == null || productDto.getPsizemgpath() =="") {
			productDto.setPsizemgpath(repsizemgpath);
		}
		if (productDto.getImgpath() == null || productDto.getImgpath() =="") {
			productDto.setImgpath(reimgpath);
		}


  		System.out.println("도면경로"+productDto.getPsizemgpath());
  		System.out.println("이미지경로"+productDto.getImgpath());
  		System.out.println("도면경로 repsizemgpath"+repsizemgpath);
  		System.out.println("이미지경로 reimgpath"+reimgpath);
  		
  		boolean productUpdateCheck = productService.productUpdateProc(productDto);
  		
  		System.out.println("productUpdateCheck => "+productUpdateCheck);
  		
  		if(!productUpdateCheck) {// 수정이 실패하거나 null인 경우
  			String errormessage ="상품 수정하기를 실패했습니다.";
  			model.addAttribute("errormessage", errormessage);
  			return "redirect:/error.shop";
  		}
  		
		return "redirect:/product_admin_list.shop";
	}
  	
}