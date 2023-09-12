package com.imitamiller.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;//import 구문을 통해서 불러온다. -> Log4j.xml
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.csrf.CsrfTokenRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.imitamiller.dto.LoginDTO;
import com.imitamiller.dto.ManagerDTO;
import com.imitamiller.dto.MemberDTO;
import com.imitamiller.dto.SearchDTO;
import com.imitamiller.dto.ZipcodeDTO;
import com.imitamiller.service.LoginService;

@Controller
public class LoginController {
	
	private Logger log=Logger.getLogger(this.getClass());//로그객체 생성 구문
	@Autowired
	private LoginService loginService;
	
	private CsrfTokenRepository csrfTokenRepository;

    // 생성자를 통해 CsrfTokenRepository 주입
    public LoginController(CsrfTokenRepository csrfTokenRepository) {
        this.csrfTokenRepository = csrfTokenRepository;
    }
    
    @Autowired
    BCryptPasswordEncoder cryptEncoder;
	
	//로그인 ---------------------------------------------------------------------------------------
    @GetMapping("login.shop")
    public String getlogin() {
        return "/login";
    }
	
	//로그아웃
	@GetMapping("logout.shop")
    public String getlogout(HttpSession session) {
        // 세션에서 사용자 정보 삭제
        session.removeAttribute("loginCheck");
        session.removeAttribute("managerCheck");
        session.removeAttribute("login_id");
        session.invalidate(); // 세션 무효화
        
        return "redirect:/main.shop"; // 로그아웃 후 리다이렉트할 페이지
    }
	
	//로그인 post
	@RequestMapping(value="login.shop", method=RequestMethod.POST)
	public String postLogin(@RequestParam("inputID") String id, 
									  @RequestParam("inputPassword") String pwd,
							           HttpSession session) throws Exception {	
		
		//String pwdCrypt =cryptEncoder.encode(pwd);
		// 실시간 ? -> System.out.print(X)
		if (log.isDebugEnabled()) {// 로그객체가 작동중이라면(디버그상태)
			log.debug("id =>" + id);// System.out.println("id=>"+id);
			log.debug("pwd =>" + pwd);
			//log.debug("pwdCrypt =>" + pwdCrypt);
			//log.debug("cryptEncoder.matches(pwd, pwdCrypt) =>" + cryptEncoder.matches(pwd, pwdCrypt));
		}
		
		//일반회원인지 확인
		LoginDTO loginCheck = loginService.loginCheck(id);
		//관리자인지 확인
		ManagerDTO managerCheck = loginService.managerCheck(id);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		log.debug("loginCheck pwd =>" + (loginCheck != null ? loginCheck.getPwd() : "null"));
		log.debug("managerCheck pwd =>" + (managerCheck != null ? managerCheck.getPwd() : "null"));
		
		// loginCheck 또는 managerCheck 중 하나라도 정보가 존재해야 진행
		if (loginCheck != null || managerCheck != null) {
		    // 둘 중 하나라도 비밀번호가 일치하면 세션에 정보 담기
		    if ((loginCheck != null && encoder.matches(pwd, loginCheck.getPwd())) ||
		        (managerCheck != null && encoder.matches(pwd, managerCheck.getPwd()))) {
		        if (managerCheck != null) {
		            session.setAttribute("managerCheck", managerCheck);
		        }
		        if (loginCheck != null) {
		        	log.debug("encoder.matches(pwd, loginCheck.getPwd()) =>" + encoder.matches(pwd, loginCheck.getPwd()));
		            session.setAttribute("loginCheck", loginCheck);
		        }
		    } else {
		        log.debug("loginCheck, managerCheck 모두 로그인 실패");
		        return "redirect:/login.shop";
		    }
		} else {
		    // loginCheck와 managerCheck 모두 null인 경우에 대한 처리를 추가
		    log.debug("일반 회원과 관리자 정보가 없습니다.");
		    return "redirect:/login.shop";
		}

		return "redirect:/main.shop";
	}
	
	//회원가입 -------------------------------------------------------------------------------------------
	@GetMapping("register.shop")
	public String getregister() {
		return "/register";
	}
	
	@GetMapping("zipcheck.shop")
	public String getzipcheck() {
		return "/zipcheck";
	}
	
	//회원가입 post
	@RequestMapping(value="register.shop", method=RequestMethod.POST)
	public String postRegisterMember(@ModelAttribute("RegisterDTO") MemberDTO registerDTO,
												@ModelAttribute("LoginDTO") LoginDTO loginDTO,
												@RequestParam("number") String number) throws Exception {	
		
		String pwdCrypt =cryptEncoder.encode(loginDTO.getPwd());
		loginDTO.setPwd(pwdCrypt);
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
    public ResponseEntity<Boolean> checkId(@RequestParam("mem_id") String mem_id) {
        boolean isDuplicate = loginService.checkId(mem_id);
        return ResponseEntity.ok(isDuplicate);
    }
	
	//우편번호
	@RequestMapping(value="zipcheck.shop", method=RequestMethod.POST)
	public String postZipcode(@RequestParam("check") String check, 
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
	
	//아이디 찾기 ----------------------------------------------------------
	@GetMapping("search_id.shop")
	public String getSearch_id() {
		return "/search_id";
	}
	
	//이름과 이메일을 받아와서 이름, 회원가입일, 아이디, 총 검색갯수(계정이 여러개일 경우)를 받아온다.
	@PostMapping("search_idproc.shop")
	public String postSearch_id(@RequestParam("memname") String memname, 
											  @RequestParam("email") String email,
											  Model model) {
		ArrayList<SearchDTO> searchId = loginService.getSearchId(memname, email);
		int totalList = searchId.size();
		System.out.println("totalList"+totalList);
		
		model.addAttribute("totalList", totalList);//검색갯수
		model.addAttribute("searchId", searchId); 
		model.addAttribute("memname", memname); 
		model.addAttribute("email", email);
		return "/search_idproc";
	}
	
	@GetMapping("search_idproc.shop")
	public String getSearch_idproc() {
		return "/search_idproc";
	}
	
	//비밀번호 찾기 ------------------------------------------------------------
	@GetMapping("search_pwd1.shop")
	public String getSearch_pwd1() {
		return "/search_pwd1";
	}
	
	@PostMapping("search_pwd2.shop")
	public String postSearch_pwd2(@RequestParam("id") String id,
													Model model) {
		
		SearchDTO searchDto = loginService.searchPwd(id);
		model.addAttribute("searchDto", searchDto);
		
		return "/search_pwd2";
	}
	
	@GetMapping("search_pwd2.shop")
	public String getSearch_pwd2() {
		return "/search_pwd2";
	}
	
	@PostMapping("search_pwd_update.shop")
	public ModelAndView postSearch_pwd_update(@RequestParam("memidDb") String id) {
		
		ModelAndView mav = new ModelAndView("search_pwd_update");
		mav.addObject("id",id);
		
		return mav;
	}
	
	@PostMapping("search_pwd_updateproc.shop")
	public String postSearch_pwd_updateproc(@RequestParam("id") String id,
																	@RequestParam("pwd") String pwd) {
		String pwdCrypt =cryptEncoder.encode(pwd);
		boolean pwdUpdateCheck = loginService.pwdSearchUpdate(id, pwdCrypt);
		
		if (pwdUpdateCheck == false) {
			System.out.println("pwdUpdateCheck가 실패 => "+pwdUpdateCheck);
			return "redirect:/search_pwd1.shop";
		}
		
		return "redirect:/main.shop";
	}
	
	@GetMapping("search_pwd_update.shop")
	public String getSearch_pwd_update() {
		return "/search_pwd_update";
	}
	
}