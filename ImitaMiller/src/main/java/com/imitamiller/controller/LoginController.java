package com.imitamiller.controller;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.imitamiller.dto.LoginDTO;
import com.imitamiller.dto.RegisterDTO;
import com.imitamiller.dto.ZipcodeDTO;
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
        
        return "redirect:/main.shop"; // 로그아웃 후 리다이렉트할 페이지
    }
	
	@GetMapping("register.shop")
	public String register() {
		return "/register";
	}
	
	@GetMapping("zipcheck.shop")
	public String zipcheck() {
		return "/zipcheck";
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
	
	//회원가입
	@RequestMapping(value="register.shop", method=RequestMethod.POST)
	public String registerMember(@ModelAttribute("RegisterDTO") RegisterDTO registerDTO,
												@ModelAttribute("LoginDTO") LoginDTO loginDTO,
												@RequestParam("number") String number) throws Exception {	
		
		// 여기에서 memberDTO와 loginDTO 객체를 사용하여 회원 가입 로직을 수행한다.
	    // memberDTO에는 요청 파라미터에서 자동으로 필드에 매핑된 데이터가 들어 있다.
	    // loginDTO에도 요청 파라미터에서 자동으로 필드에 매핑된 데이터가 들어 있다.
		String mphone = number+registerDTO.getMphone();
		
		// 핸드폰 번호 number + mphone 값 저장
		registerDTO.setMphone(mphone);
		
		boolean memberInsertCheck = loginService.memberInsert(registerDTO, loginDTO);
		//회원가입 성공은 true
	    System.out.println("registerMember() memberInsertCheck 결과 로그인 성공 후 메인페이지 "+memberInsertCheck);
	    
	    return "redirect:/main.shop";
	}
	
	//중복아이디 체크
	@PostMapping("checkId.shop")
    public ResponseEntity<Boolean> checkId(@RequestParam String mem_id) {
        boolean isDuplicate = loginService.checkId(mem_id);
        return ResponseEntity.ok(isDuplicate);
    }
	
	//우편번호
	@RequestMapping(value="zipcheck.shop", method=RequestMethod.POST)
	public String getZipcode(@RequestParam("check") String check, 
										@RequestParam("area3") String area3,
										Model model) throws Exception {	
		
		System.out.println("check => "+check+", area3 => "+area3);
		ArrayList<ZipcodeDTO> zipcodeList = loginService.zipcodeRead(area3);
		System.out.println("zipcodeList => "+zipcodeList);
		
		if (zipcodeList.isEmpty()) {
	        check = "y";
	    } else {
	        check = "n";
	    }
		
		model.addAttribute("zipcodeList", zipcodeList);
	    model.addAttribute("check", check);
		
		return "zipcheck";
	}

}