# myProject2
Environment: Tomcat 9.0, SpringMVC, Maven, MyBatis, Oracle DB, JSP

Language and Library: Java, HTML, Javascript, Bootstrap 4, handlebar.js... etc

## 개발동기
![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/01.png?raw=true)
```diff
+ 좌 - 유명 인터넷 강의 플랫폼 Udacity, 우 - 학교 토론 스레드 게시판
```

프로젝트 당시 HTML의 활용 수준이 미흡하다는 것을 깨닫고 udacity에서 제공하던 무료 HTML 강좌를 듣고 있었습니다.
그와 동시에 대학교 마지막 학기의 수업이 인터넷 강의로 진행되는 것이었는데, 이 강의 내용은
영어 동영상 강의를 듣고, 영어로 토론을 진행하는 것이었습니다.

기관에서 교육을 받으면서 udacity처럼 동영상 서비스를 제공하면서
스레드 형식의 게시판으로 정보 공유, 토론을 하면 좋겠다는 생각에
이 둘을 합쳐보고 싶다는 생각에 사이트를 만들게 되었습니다.


## 구성
&nbsp;
* 메인화면

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/02.png)
**1: 기본적인 서비스를 제공하는 탭입니다.**

Lecture는 강의 서비스를 제공하는 페이지

Discuss는 강의와 관련된 토론 게시판입니다.



**2: 회원을 관리하는 탭입니다.**

Bootstrap4 Modal 템플릿을 사용하였으며
세션을 통한 로그인 방식입니다.

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/03.png)

Jsp를 이용하여 로그인 시변화하도록 구현되어있습니다.

**3: 클릭 시 각 난이도에 해당하는 lecture 부분으로 이동합니다.**

offset 메소드를 이용하여, 이동하게끔 click 속성을 부여했습니다.

&nbsp;
* 회원가입 Modal 입니다.

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/04.png)

**1: 회원 정보를 입력받는 곳입니다.**

정규표현식 코드로 View에서 들어오는 데이터를 솎아냅니다.

정규표현식을 통과하지 못하거나, 입력데이터가 부족할 시 **2** 에 해당되는 메시지가 뜹니다.

&nbsp;
* 동영상 서비스 lecture 탭입니다.

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/05.png)

**1: 탭으로 각 난이도에 해당하는 뷰로 스크롤 이동이 가능합니다.**

**2: 구체적 강의 페이지입니다. 클릭 시 Modal 팝업이 뜹니다.**

&nbsp;
* 강의 모달입니다.

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/06.png)

**1: Oracle DB에서 가져온 강의 정보입니다.**

**2:페이지 이벤트입니다.**

Enroll 버튼으로 강의 서비스 제공 페이지로 넘어갑니다.

Discuss 버튼은 강의 정보의 페이지로 넘어갑니다.

&nbsp;
* 강의 서비스 제공 페이지입니다.

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/07.png)

**1: 강의의 소분류입니다.**

강의마다 하나의 동영상 url을 포함한 정보를 지니고 있습니다.

**2: Side-navigation bar를 여닫는 버튼입니다.**

**3: DB에서 가져온 youtube url을 iframe으로 서비스 제공합니다.**

&nbsp;
* 토론 게시판입니다.

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/08.png)

**1: 강의의 난이도 별로 분류되어있습니다.**

**2: Spring WebSocket을 이용한 접속자 로그인 정보입니다.**

로그인 중인 데이터 정보를 표기하고 DB에서 읽어온 통계정보와 최근 3일 이내의 신회원 정보를 표기합니다.

&nbsp;
* 과목 별 게시판입니다.

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/09.png)

**1: 게시판 메뉴입니다.** 

댓글 조회수 마지막 댓글자 정보등이 표기됩니다.

**2: 검색창입니다.** 

제목, 내용, 작성자 필터로 검색이 가능합니다.

**3: 새 글 쓰기 버튼입니다.** 

로그인 되어 있을 때만 활성화됩니다.

&nbsp;
* 게시글 페이지 입니다.

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/10.png)

**1: 게시글 내용입니다.** 

로그인 사용자가 작성자 본인이라면 3처럼 수정, 삭제 탭이 활성화 됩니다.

**2: 게시글의 스레드 댓글입니다.** 

handlebar.js 라이브러리로 구현되어 있습니다.

**3: 로그인 사용자가 댓글 작성자라면 수정, 삭제 버튼이 확성화됩니다.**


&nbsp;
##  만들기 전에 구상했던 점과, 완성 후 구상했던 것과 다르게 구현된 점들

프로젝트를 시작하기 전에 정말 간단하게 개요 ppt를 만들었습니다.

대략적으로 구상을 해놓았습니다.

밑에서도 차이점을 설명하기 위해 사용하겠지만

전체를 보고싶으신 분들은 밑 주소를 참고해주세요.

https://www.slideshare.net/yuwonkyun/spring-overview-roughly




