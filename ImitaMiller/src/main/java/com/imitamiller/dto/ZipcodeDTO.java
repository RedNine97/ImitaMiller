package com.imitamiller.dto;//같은 패키지에 보관

public class ZipcodeDTO 
{
  private String zipcode;//우편번호
  private String area1;//시
  private String area2;//구
  private String area3;//동,면리
  private String area4;//주소의 나머지

  //Setter
  public void setZipcode(String zipcode){
     this.zipcode = zipcode;
  }

  public void setArea1(String area1){
     this.area1 = area1;
  }

  public void setArea2(String area2){
     this.area2 = area2;
  }

  public void setArea3(String area3){
     this.area3 = area3;
  }

  public void setArea4(String area4){
     this.area4 = area4;
  }

  //Getter
  public String getZipcode(){return zipcode;}
  public String getArea1(){ return area1;}
  public String getArea2(){ return area2;}
  public String getArea3(){ return area3;}
  public String getArea4(){ return area4;}

}