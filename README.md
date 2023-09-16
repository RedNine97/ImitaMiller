# ImitaMiller
Spring MVC로 구현한 쇼핑몰 사이트 제작

## 💡 프로젝트 소개
스프링MVC로 구현한 가구 쇼핑몰입니다. 그동안 배웠던 것들을 녹일 수 있는 것은 <br>
쇼핑몰만 한 게 없다고 판단이 되어 주제를 가구 쇼핑몰로 선정했습니다.<br>

#### 🧙진행 기간
* 23.8.14 - 23.9.14<br>
**인원** : 1명

### ⚙️ 개발 환경
- **개발언어** : Java 8, JDK 1.8.0, jstl...
- **라이브러리** : Jquery(Bootstrap5에 포함)
- **프레임워크** : Bootstrap5
- **개발도구** : Eclipse, VS Code
- **웹서버** : Apache Tomcat (v9.0)
- **데이타 베이스** : Oracle DB(11g)

## 💡 주요 기능
- 로그인/회원가입, 마이 페이지 : CRUD 기능
- 상품 메인 : 페이징 및 검색 처리
- 상품 상세 페이지 : 조회수

## 💡 DB 설계(ERD)
![image](https://github.com/RedNine97/ImitaMiller/assets/117744969/90ce5dcc-9b3d-49c3-ad7b-cc681551802c)

### DB축소
![image](https://github.com/RedNine97/ImitaMiller/assets/117744969/bf518709-5558-46e3-87a3-561f382ca5a4)

## 💡 개발 내용
**밸로그 링크** <br>
[DB, 환경설정, 상품](https://velog.io/@ghdrn221/%EC%8A%A4%ED%94%84%EB%A7%81MVC-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8)<br>
[DB 테이블 수정](https://velog.io/@ghdrn221/%EB%A1%9C%EA%B7%B8%EC%9D%B8%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85)<br>
[로그인 / 로그아웃](https://velog.io/@ghdrn221/%EB%A1%9C%EA%B7%B8%EC%9D%B8-%EB%A1%9C%EA%B7%B8%EC%95%84%EC%9B%83)<br>
[회원가입](https://velog.io/@ghdrn221/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85)<br>
[마이페이지](https://velog.io/@ghdrn221/%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%80)<br>
[아이디, 비밀번호 찾기](https://velog.io/@ghdrn221/%EC%95%84%EC%9D%B4%EB%94%94-%EB%B9%84%EB%B0%80%EB%B2%88%ED%98%B8-%EC%B0%BE%EA%B8%B0)<br>
[관리자(상품수정까지)](https://velog.io/@ghdrn221/%EA%B4%80%EB%A6%AC%EC%9E%90)<br>
[상품 첨부파일(등록, 수정, 삭제)](https://velog.io/@ghdrn221/%EC%83%81%ED%92%88-%EC%B2%A8%EB%B6%80%ED%8C%8C%EC%9D%BC%EB%93%B1%EB%A1%9D-%EC%88%98%EC%A0%95-%EC%82%AD%EC%A0%9C)<br>
[에러처리 / Spring Security](https://velog.io/@ghdrn221/%EC%97%90%EB%9F%AC%EC%B2%98%EB%A6%AC-Spring-Security)<br>
[마무리 (DB, 느낀점)](https://velog.io/@ghdrn221/%EB%A7%88%EB%AC%B4%EB%A6%AC-DB-%EB%8A%90%EB%82%80%EC%A0%90)<br>

## 💡 이전 프로젝트
[모델2로 구현한 프로젝트 밸로그 링크](https://velog.io/@ghdrn221/series/%EB%AA%A8%EB%8D%B82%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8)<br>

## 💡 느낀점
처음에 너무 많은 범위를 혼자 하려고 했던 것 같습니다. 그리고, Spring Security를 적용(권한) 해서 로그인 처리하고, Tiles와 Mybatis로 구현한 게시판 프로젝트가 있어서 이걸 참고 해서 구현했다면 하는 아쉬움도 남습니다. 한달정도 걸렸지만 처음에는 거의 SpringMVC, Tiles,  Spring Security, 어노테이션을 다시 익히는 데에 시간을 보냈습니다. 또, 자바스크립트에 많이 막혀서 막상 시작하고 끝낸 기간은 일주일 조금 넘는 것 같아서 더 아쉬움이 남는 것 같습니다.
