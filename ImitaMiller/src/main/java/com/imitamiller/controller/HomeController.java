package com.imitamiller.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.imitamiller.dto.LoginDTO;
import com.imitamiller.dto.ProductDTO;
import com.imitamiller.service.ProductService;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
		//메인 페이지
		@RequestMapping(value="main.shop", method=RequestMethod.GET)
		public ModelAndView index(HttpSession session){

		// 로그인 상태
		LoginDTO loginCheck = (LoginDTO) session.getAttribute("loginCheck");
		System.out.println("loginCheck => "+loginCheck);
		session.setAttribute("loginCheck", loginCheck);
		
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
		
		ModelAndView mav = new ModelAndView("main");
		int login_id=0;
		
		if (loginCheck != null) {
		    // LoginDTO 객체가 null이 아닌 경우에만 메서드를 호출하여 값을 가져옵니다.
			login_id = loginCheck.getLogin_id(); // 회원로그인의 회원번호
		    String id = loginCheck.getId(); // 회원로그인의 회원아이디
		    String pwd = loginCheck.getPwd(); // 회원로그인의 비밀번호
		    mav.addObject("check", login_id);
		    mav.addObject("loginCheck",loginCheck);
		} 
		mav.addObject("best",differentProduct);
		mav.addObject("list1",chair);
		mav.addObject("list2",kitchen);
		mav.addObject("list3",living);
		mav.addObject("list4",bedroom);
		mav.addObject("list5",library1);
		mav.addObject("list6",library2);
		
		System.out.println("main의 loginCheck "+loginCheck);
		System.out.println("main의 check "+login_id);
		
		return mav;
	}

}