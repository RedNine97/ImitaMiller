package com.imitamiller.util;//프로젝트에서 공통으로 사용되는 기능만 모아놓은 클래스 => 공통관심 클래스(AOP)

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.web.multipart.MultipartFile;

//파일업로드시 업로드할 경로지정 및 파일의 새이름을 부여(=공통모듈)(자바스크립트계열 언어)
public class FileUtil {
	
	//업로드 및 다운로드 경로 -> 정적 상수
	public static final String UPLOAD_PATH_PNG = "C:/Users/RedNine/git/repositoryImitaMiller/ImitaMiller/src/main/webapp/img/pimg";
    public static final String UPLOAD_PATH_JPG = "C:/Users/RedNine/git/repositoryImitaMiller/ImitaMiller/src/main/webapp/img/sizepimg";
    
  //1. 탐색기의 원본파일명만 받아서 처리해주는 메서드
  	public static String rename(String filename) throws Exception {
  		if(filename==null) return null;//업로드 X 이름변경 X
  		//새이름 규칙 -> 시스템날짜 + 랜덤숫자(0~49) => 조합
  		String newName=Long.toString(System.currentTimeMillis())+
  													  (int)(Math.random()*50);
  		System.out.println("newName(난수)=>"+newName);
  		return rename(filename,newName);
  	}
  	
  	//2. 실제로 새로운 파일명을 변경하는 역할 -> 확장자 구분 -> 변경된 이름만 구해서 변경할 수 있다.
  	public static String rename(String filename,String newName) throws Exception {
  		if(filename==null) return null;
  		//확장자 구하기( ex - testdddddd.png)
  		int idx=filename.lastIndexOf(".");//못찾으면 -1을 리턴
  		String extention="";//확장자를 저장
  		String newFileName="";//새파일명을 저장
  		if(idx!=-1) {//.을 찾았다면
  			extention=filename.substring(idx);//idx부터 파일끝까지
  			System.out.println("extention=>"+extention);
  		}
  		//새파일명
  		int newIdx=newName.lastIndexOf(".");//확장자를 포함한 변경된 파일명
  		if(newIdx!=-1) {
  			newName=newName.substring(0,newIdx);//0은 포함->newIdx바로 앞번호까지 구한다.
  			System.out.println("newName(변경된파일명)=>"+newName);
  		}
  		//혹시나 대문자로 쓸 수 있기 때문에
  		newFileName=newName+extention.toLowerCase();//.TXT(대) -> .png
  		System.out.println("최종 newName =>"+newName);
  		return newFileName;//실질적인 이름이 변경된 업로드파일명
  	}
	
	//3. 글수정 -> 업로드된 파일도 수정 -> 기존 업로드된 파일 삭제 -> 새로 업로드
	//파일 삭제 -> 수정목적
	public static void removeFilePNG(String filename) {
        File file = new File(UPLOAD_PATH_PNG, filename);
        if (file.exists()) file.delete();
    }
    
    public static void removeFileJPG(String filename) {
        File file = new File(UPLOAD_PATH_JPG, filename);
        if (file.exists()) file.delete();
    }
    
    
}
