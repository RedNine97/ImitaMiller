package com.imitamiller.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	
	private int pID,pprice,count; //상품아이디, 상품가격, 조회수
	//상품이름, 사이즈, 마감, 종류, 유형
	private String pname,psize,pfinishing,ptype,pcategory;
	
	//도면경로 파일명, 이미지경로 파일명
	private String psizemgpath,imgpath;
	
	//추가
	private MultipartFile psizemgpathFile;//업로드할때 필요로하는 객체
	private MultipartFile imgpathFile;//업로드할때 필요로하는 객체
	
	//GetterMethod
	public int getpID() {
		return pID;
	}
	public int getPprice() {
		return pprice;
	}
	public int getCount() {
		return count;
	}
	public String getPname() {
		return pname;
	}
	public String getPsize() {
		return psize;
	}
	public String getPfinishing() {
		return pfinishing;
	}
	public String getPtype() {
		return ptype;
	}
	public String getPcategory() {
		return pcategory;
	}
	public String getPsizemgpath() {
		return psizemgpath;
	}
	public String getImgpath() {
		return imgpath;
	}
	public MultipartFile getPsizemgpathFile() {
		return psizemgpathFile;
	}
	public MultipartFile getImgpathFile() {
		return imgpathFile;
	}
	
	//SetterMethod
	public void setpID(int pID) {
		this.pID = pID;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public void setCount(int count) {
		count=0;
		this.count = count;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	public void setPfinishing(String pfinishing) {
		this.pfinishing = pfinishing;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}
	public void setPsizemgpath(String psizemgpath) {
		this.psizemgpath = psizemgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public void setPsizemgpathFile(MultipartFile psizemgpathFile) {
		this.psizemgpathFile = psizemgpathFile;
	}
	public void setImgpathFile(MultipartFile imgpathFile) {
		this.imgpathFile = imgpathFile;
	}
	@Override
	public String toString() {//@ModelAttibute 어노테이션 기능
		return "ProductDTO [pID=" + pID + ", pprice=" + pprice + ", count=" + count + ", pname=" + pname + ", psize="
				+ psize + ", pfinishing=" + pfinishing + ", ptype=" + ptype + ", pcategory=" + pcategory
				+ ", psizemgpath=" + psizemgpath + ", imgpath=" + imgpath
				+ ", psizemgpathFile=" + psizemgpathFile+ ", imgpathFile=" + imgpathFile + "]";
	}
	
}
