package com.imitamiller.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.imitamiller.dto.ManagerDTO;
import com.imitamiller.dto.ProductDTO;
import com.imitamiller.service.LoginService;
import com.imitamiller.service.ProductService;
import com.imitamiller.util.FileUtil;

@Controller
public class ManagerController {
	
	private Logger log=Logger.getLogger(this.getClass());//로그객체 생성 구문
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private LoginService loginService;
	
	//관리자 페이지 ---------------------------------------------------------------------------
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
    
    //상품정보 페이지 (관리자) -------------------------------------------------------------------------------------------------------------
  	@RequestMapping(value="product_admin_list.shop", method=RequestMethod.GET)
  	public ModelAndView getProduct_admin_list(@RequestParam(name = "pageNum", defaultValue = "1") String pageNum,
  															@RequestParam(name = "search", defaultValue = "") String search,
  															@RequestParam(name = "searchtext", defaultValue = "") String searchtext,
  															@RequestParam(name = "sort", defaultValue = "PID DESC") String sort){// 정렬 파라미터 추가
  		
  		int count=0;//총레코드수
  		List productList=null;//화면에 출력할 레코드를 저장할 변수
  		 
  		count=productService.getProductSearchCount(search, searchtext);
  		
  		//1.화면에 출력할 페이지번호, 2.출력할 레코드 갯수
  		Hashtable<String,Integer> pgList=productService.pageList(pageNum, count);
  		 if (count > 0){
  			 productList=productService.getProductList(pgList.get("startRow"),pgList.get("pageSize"),search,searchtext,sort);
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
  	
  	//상품 수정 ---------------------------------------------------------------------------------
  	//상품 수정하기 pID 정보
  	@RequestMapping(value="product_admin_update.shop", method=RequestMethod.GET)
	public String getProduct_admin_update(@RequestParam("pID") int pID, Model model) {
  		ProductDTO productDto = productService.getProductUpdate(pID);
  		model.addAttribute("productDto", productDto);
  		
		return "/product_admin_update";
	}
  	
  	// 상품 수정하기 POST
  	@RequestMapping(value = "product_admin_update.shop", method = RequestMethod.POST)
  	public String getProductAdminUpdateProc(@ModelAttribute("ProductDTO") ProductDTO productDto,
														  	    @RequestParam("repsizemgpath") String repsizemgpath, 
														  	    @RequestParam("reimgpath") String reimgpath,
														  	    Model model) throws Exception {
  		
  	    // 도면 이미지 업로드 처리
  	    if (!productDto.getPsizemgpathFile().isEmpty() ) {
  	        try {
  	            String newImgpath1 = FileUtil.rename(productDto.getPsizemgpathFile().getOriginalFilename());
	        	productDto.setPsizemgpath("./img/sizepimg/"+newImgpath1);
  	        } catch (Exception e) {
  	            e.printStackTrace();
  	        }
  	    } else {
	        productDto.setPsizemgpath(repsizemgpath);
	    }

  	    // 상품 이미지 업로드 처리
  	    if (!productDto.getImgpathFile().isEmpty()) {
  	        try {
  	        	String newImgpath2 = FileUtil.rename(productDto.getImgpathFile().getOriginalFilename());
  	        	productDto.setImgpath("./img/pimg/"+newImgpath2);
  	        } catch (Exception e) {
  	            e.printStackTrace();
  	        }
  	    }else {
	        productDto.setImgpath(reimgpath);
	    }

  	    //db에 업데이트하기
  	    boolean productUpdateCheck = productService.productUpdateProc(productDto);

  	    //도면 이미지 업로드 및 기존 파일 삭제 처리
  	    if (!productDto.getPsizemgpathFile().isEmpty()) {
  	        try {
  	        	String psizemgpath = productDto.getPsizemgpath().replace("./img/sizepimg/", "");
  	        	System.out.println("도면 이미지 업로드 및 기존 파일 삭제 처리 경로"+psizemgpath);
  	            File file1 = new File(FileUtil.UPLOAD_PATH_JPG + "/" + psizemgpath);
  	            productDto.getPsizemgpathFile().transferTo(file1);
  	        } catch (IOException e) {
  	            e.printStackTrace();
  	        } catch (Exception e2) {
  	            e2.printStackTrace();
  	        }
  	        if (productUpdateCheck) {//업로드했다면 -> 기존파일은 삭제하는 구문이 필요하다.
  	            FileUtil.removeFileJPG(repsizemgpath.replace("./img/sizepimg/", ""));
  	        } else {
  	            String errorMessage = "상품 수정하기를 실패했습니다.";
  	            model.addAttribute("errorMessage", errorMessage);
  	            return "redirect:/error.shop";
  	        }
  	    }

  	    // 상품 이미지 업로드 및 기존 파일 삭제 처리
  	    if (!productDto.getImgpathFile().isEmpty()) {
  	        try {
  	        	String imgpath = productDto.getImgpath().replace("./img/pimg/", "");
  	            File file2 = new File(FileUtil.UPLOAD_PATH_PNG + "/" + imgpath);
  	            productDto.getImgpathFile().transferTo(file2);
  	        } catch (IOException e) {
  	            e.printStackTrace();
  	        } catch (Exception e2) {
  	            e2.printStackTrace();
  	        }
  	        if (productUpdateCheck) {//업로드했다면 -> 기존파일은 삭제하는 구문이 필요하다.
  	            FileUtil.removeFilePNG(reimgpath.replace("./img/pimg/", ""));
  	        } else {
  	            String errorMessage = "상품 수정하기를 실패했습니다.";
  	            model.addAttribute("errorMessage", errorMessage);
  	            return "redirect:/error.shop";
  	        }
  	    }

  	    return "redirect:/product_admin_list.shop";
  	}
  	
  	//상품 등록 -----------------------------------------------------------------------------
  	@GetMapping("product_admin_write.shop")
	public String getProduct_admin_write() {
		return "/product_admin_write";
	}
  	
  	@PostMapping("product_admin_write.shop")
    public String postProductAdminWrite(@ModelAttribute("ProductDTO") ProductDTO productDTO,
                                        					Model model) {//에러메세지 전달
  		if (log.isDebugEnabled()) {// 로그객체가 작동중이라면(디버그상태)
			log.debug("productDTO =>" + productDTO);
			//log.debug("productDTO.getPsizemgpathFile() =>" + productDTO.getPsizemgpathFile().getOriginalFilename());
		}
        try {
            // 파일 업로드 처리 및 새 이름 부여
            String psizemgpath = FileUtil.rename(productDTO.getPsizemgpathFile().getOriginalFilename());
            String imgpath = FileUtil.rename(productDTO.getImgpathFile().getOriginalFilename());
            
            // ProductDTO에 업로드된 파일 경로 설정
            productDTO.setPsizemgpath("./img/sizepimg/"+psizemgpath);
            productDTO.setImgpath("./img/pimg/"+imgpath);

            // 상품 등록 로직
            boolean productInsertCheck = productService.ProductInsert(productDTO);
            if (!productInsertCheck) {
                String errormessage = "상품 등록하기를 실패했습니다.";
                model.addAttribute("errormessage", errormessage);
                return "redirect:/error.shop";
            }
            
          //실제로 업로드됐다면 upload폴더 업로드한 파일을 전송
          File file1= new File(FileUtil.UPLOAD_PATH_JPG+"/"+psizemgpath);
          File file2= new File(FileUtil.UPLOAD_PATH_PNG+"/"+imgpath);
          //물리적으로 데이터 전송(복사)
          productDTO.getPsizemgpathFile().transferTo(file1);//파일 업로드 위치로 전송
          productDTO.getImgpathFile().transferTo(file2);//파일 업로드 위치로 전송
        } catch (Exception e) {
            e.printStackTrace();
            String errormessage = "파일 업로드 또는 상품 등록 중 오류가 발생했습니다.";
            model.addAttribute("errormessage", errormessage);
            return "redirect:/error.shop";
        }

        return "redirect:/product_admin_list.shop";
    }
  
  //상품 삭제 -----------------------------------------------------------------------------
  	@GetMapping("product_admin_delete.shop")
	public String getProduct_admin_delete(@RequestParam("pID") int pID, Model model) {
  		////삭제할 상품을 찾을 메서드
  		ProductDTO productDto = productService.getProductUpdate(pID);
  		model.addAttribute("productDto", productDto);
		return "/product_admin_delete";
	}
  	
  	@RequestMapping(value="/product_admin_delete.shop",method=RequestMethod.POST)
	public String postProduct_admin_delete(@ModelAttribute("ProductDTO") ProductDTO productDTO) throws Exception {
  		String psizemgpath = productDTO.getPsizemgpath();
  		String imgpath = productDTO.getImgpath();
  		//db데이터 삭제
  		boolean productDeleteCheck = productService.getProductDelete(productDTO.getpID());
  		//업로드한 파일까지 삭제 (흔적 지우기)
			FileUtil.removeFileJPG(psizemgpath.replace("./img/sizepimg/", ""));
			FileUtil.removeFilePNG(imgpath.replace("./img/pimg/", ""));
		return "redirect:/product_admin_list.shop";
	}
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
}