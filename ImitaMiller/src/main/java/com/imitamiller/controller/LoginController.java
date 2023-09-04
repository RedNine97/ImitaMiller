package com.imitamiller.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.imitamiller.dto.LoginDTO;
import com.imitamiller.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@GetMapping("login.shop")
	public String login() {
		return "/login";
	}
	
	@GetMapping("logout.shop")
    public String logout(HttpSession session) {
        // 세션에서 사용자 정보 삭제
        session.removeAttribute("loginCheck");
        session.invalidate(); // 세션 무효화
        
        return "redirect:/login.shop"; // 로그아웃 후 리다이렉트할 페이지
    }
	
	/*
	 * public String hello() -> return "home"; (/home.jsp로 전환)
	 * 이동하면서 데이터도 전달 -> ModelAndView
	 * 메서드 -> 다른 컨트롤러 이용 -> redirect:/요청명령어를 이용 -> return "redirect:/요청명령어";
	*/
	@RequestMapping(value="login.shop", method=RequestMethod.POST)
	public String getLogin(@RequestParam("inputID") String id, 
									  @RequestParam("inputPassword") String pwd,
							           HttpSession session) throws Exception {	
		
		LoginDTO loginCheck = loginService.loginCheck(id, pwd);
		
		if (loginCheck == null) {
		System.out.println("getLogin loginCheck 결과 로그인 실패 다시 로그인");
		return "redirect:/login.shop";
		}
		
		
		// 로그인 성공 시 세션에 저장
	    session.setAttribute("loginCheck", loginCheck);

	    System.out.println("getLogin loginCheck 결과 로그인 성공 후 메인페이지");
	    return "redirect:/main.shop";
	}

}