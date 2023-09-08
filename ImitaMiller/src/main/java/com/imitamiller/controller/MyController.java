package com.imitamiller.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.imitamiller.dto.LoginDTO;
import com.imitamiller.dto.MemberDTO;
import com.imitamiller.service.LoginService;
import com.imitamiller.service.ProductService;

@Controller
public class MyController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private LoginService loginService;
	
	// 마이페이지 --------------------------------------------------------------------------
	@GetMapping("/mypage.shop")
	public String getMypage() {
		return "/mypage";
	}

    @GetMapping("/adminPage")
    public String adminPage() {
        return "adminPage";
    }
    
	@GetMapping("/myinfo.shop")
	public ModelAndView getMyinfo(HttpSession session) {
		LoginDTO loginCheck = (LoginDTO) session.getAttribute("loginCheck");
		// 회원 로그인의 로그인번호로 회원의 회원번호를 활용한 MemberDTO 검색
		// 로그인번호 equal 회원번호
		MemberDTO memberInfo = loginService.getMemberInfo(loginCheck.getLogin_id());

		ModelAndView mav = new ModelAndView("myinfo");
		mav.addObject("memberInfo", memberInfo);

		return mav;
	}

	@PostMapping(value = "memupdate.shop")
	public String postMyinfo(@ModelAttribute("MemberDTO") MemberDTO memberDTO,
										@ModelAttribute("LoginDTO") LoginDTO loginDTO, HttpSession session) {
		// 세션에 저장된 회원번호
		int login_id = (int) session.getAttribute("login_id");

		boolean memberUpdateCheck = loginService.memberUpdate(login_id, memberDTO, loginDTO);

		System.out.println("memberUpdateCheck => " + memberUpdateCheck);

		if (!memberUpdateCheck) {
			return "redirect:/myinfo.shop";
		}

		// 세션에서 사용자 정보 삭제
		session.removeAttribute("loginCheck");
		session.removeAttribute("login_id");
		session.invalidate(); // 세션 무효화

		return "redirect:/login.shop";
	}

	// 회원탈퇴 페이지
	@GetMapping("memdelete.shop")
	public ModelAndView getMemdelete(HttpSession session) {

		LoginDTO loginCheck = (LoginDTO) session.getAttribute("loginCheck");
		ModelAndView mav = new ModelAndView("memdelete");

		// 사용자가 입력한 비밀번호와 DB에서 꺼내온 비밀번호로 유효성검사
		mav.addObject("loginCheck", loginCheck);

		return mav;
	}

	// 회원정보 삭제
	@PostMapping(value = "memberdelete.shop")
	public String postMemberDelete(HttpSession session) {
		// 세션에 저장된 회원번호
		int login_id = (int) session.getAttribute("login_id");

		boolean memberDeleteCheck = loginService.deleteMember(login_id);
		System.out.println("memberDelete => " + memberDeleteCheck);

		// 세션에서 사용자 정보 삭제
		session.removeAttribute("loginCheck");
		session.removeAttribute("login_id");
		session.invalidate(); // 세션 무효화

		return "redirect:/main.shop";
	}
		
}