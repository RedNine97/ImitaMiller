package com.imitamiller.dto;

public class ProductDTO {
	
	private int pID,pprice,count; //상품아이디, 상품가격, 조회수
	private String pname,psize,pfinishing,ptype,pcategory,psizemgpath,imgpath;
	//상품이름, 사이즈, 마감, 종류, 유형, 도면경로, 이미지경로
	
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
	
	//SetterMethod
	public void setpID(int pID) {
		this.pID = pID;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public void setCount(int count) {
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
	
	@Override
	public String toString() {
		return "ProductDTO [pID=" + pID + ", pprice=" + pprice + ", count=" + count + ", pname=" + pname + ", psize="
				+ psize + ", pfinishing=" + pfinishing + ", ptype=" + ptype + ", pcategory=" + pcategory
				+ ", psizemgpath=" + psizemgpath + ", imgpath=" + imgpath + "]";
	}
	
}
