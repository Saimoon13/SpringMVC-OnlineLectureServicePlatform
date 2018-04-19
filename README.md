# SpringMVC - OnlineLectureServicePlatform

ImageClick - Demonstration of project via youtube

[![WebTest](http://img.youtube.com/vi/OUt0UI3mrNM/0.jpg)](http://www.youtube.com/watch?v=OUt0UI3mrNM "WebTest")

Project Name: Undecided

Environment: Tomcat 9.0, SpringFramework 4.3.12, Maven, MyBatis, Oracle DB, JSP... etc

Language or Library: Java, HTML, Javascript, Bootstrap 4, handlebar.js, Ajax... etc

Project Type: Personal Spring Project

Total elapsed time: 3 weeks and a half

<details><summary>한국어 CLICK ME</summary>
<p>


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

로그인 중인 데이터 정보를 표기합니다. 위 사진에서는 admin 계정으로 로그인되어있기에 자기 자신만 표시되었습니다.
DB에서 읽어온 통계정보와 최근 3일 이내의 신회원 정보를 표기합니다.

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
##  만들기 전에 구상했던 점과 다르게 구현된 점들

프로젝트를 시작하기 전에 정말 간단하게 개요 ppt를 만들었습니다.

대략적으로 구상을 해놓았습니다.

밑에서도 차이점을 설명하기 위해 사용하겠지만

그래도 전체를 보고싶으신 분들은 밑 주소를 참고해주세요.

https://www.slideshare.net/yuwonkyun/spring-overview-roughly

&nbsp;
![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/changed/001.png?raw=true)
 
자유게시판을 만들려했는데

동영상 서비스 제공 플랫폼에서 자유 게시판이 있다는 것이 어색했다고 느꼈습니다.

자유게시판을 지우고, 토론 게시판을 만들기로 했습니다.

&nbsp;
![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/changed/002.png?raw=true)

Ajax를 이용하여 모든 input의 데이테를 확인하여

'중복된 아이디입니다.' 라는 식으로 사용하려 했지만

정규표현식을 이용한 view의 활용만으로 필터처리를 했습니다.

&nbsp;
![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/changed/003.png?raw=true)

자유 게시판이 사라져서 쓸모없는 부분이 되어버렸습니다. 전부 지우고

토론 게시판으로 리모델링 돼었습니다.

&nbsp;
![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/changed/004.png?raw=true)

난이도를 아코디언 같은 Jquery UI로 처리하려고 했으나

사용자의 입장에서 클릭 같은 이벤트를 발생시켜야만 컨텐츠가 보인다는 것은 매우 불편할 것이라고 생각해

offset을 이용한 스크롤 버튼을 만들어놓고

모든 강의를 한페이지에 표현하기로 했습니다.

&nbsp;
![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/changed/005.png?raw=true)

자유 게시판이 사라지고 토론게시판으로 만들어졌기에

검색게시판은 토론 게시판에 포함되어 있어 기능 자체가 필요가 없어졌습니다.

때문에 사라졌습니다.

&nbsp;
![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/changed/006.png?raw=true)

lecture comment 기능을 만들 시 DIscuss 에 토론 기능을 집중시키는 의도가 희석될 수 있다는 생각이 들었습니다.

Udacity에서도 video coment는 사용하지 않는 점을 생각해 기능을 삭제했습니다.


&nbsp;
## 프로젝트를 마무리하면서 느낀점

&nbsp;
먼저 DB에 대해 느낀점이 많습니다. 아래는 제가 만든 DB의 erd 입니다.

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/erd.png?raw=true)

프로젝트를 완성 후 데이터보에스 erd를 만들면서 느낀점은 중복되는 부분이 너무많다는 것입니다.

lid(과목 아이디), lname(과목 이름) 등 과목정보는 과반 이상의 테이블에서 사용하고 있습니다.


객체 지향 언어에서는 상속을 통해서 코드의 중복을 최소화 할 수 있습니다.

하지만 데이터베이스는 상속이 없는 것으로 알고 있습니다. 

다른 사람에게 묻고 조사해서 데이터베이스는 릴레이션을 이용해서 

중복을 최소화 할 수 있다는 사실을 알았지만 구체적 활용 방도는 모르는 채입니다. 


또한 youtube url의 처리 때문에 이 로우들을 키(key) 처리도 하지 못한 점도 굉장히 신경스입니다

데이터베이스 설계 능력이 부족함을 통감하였고, 더 공부해서 다음에는 더 치밀한 구성으로 진행해야할 필요성을 느꼈습니다.

&nbsp;
&nbsp;
마지막으로 혼자 프로젝트를 마무리하면서 느낀 가장 큰 점은 모르는 점을 혼자 조사해야한다는 점을 느꼈습니다.

지도 선생님의 아래에서 그룹프로젝트를 진행하면 모르는 것은 팀원들에게 묻거나

그래도 해결되지 않으면, 지도 선생님께 물으면 됩니다. 하지만 혼자 준비하게 되면 그럴 수 없는 것이 가장 힘들었습니다.

**'이게 이렇게 하면 될거같은데 왜 안되지?' **
 
라는 의문을 해결하기 위해 stackoverflow 등 웹 사이트를 적극 활용하여

찾아도 모르는 것이 생기면 직접 질문을 하기도 하였습니다.

 

이러한 경험으로 가르쳐주는 지도자 없이 스스로 해결하는 방법을 배우는 한편

지도자의 중요성을 다시금 깨닫는 좋은 경험이었습니다.


</p>
</details>

<details><summary>日本語 CLICK ME</summary>
<p>




## 開発の動機
![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/01.png?raw=true)
```diff
+左 - 有名インターネット講義プラットフォームUdacity、右 - 学校のディスカッションスレッド掲示板
```

プロジェクト当時HTMLスキルレベルが良くないと思い、udacityで提供するのHTML講座を受けていました。
その時期、大学４年のネット授業も受けていました、この講義の内容は、
英語のビデオ講義を見て、掲示板で英語を使って議論することでした。

機関で教育を受けている時、教育生たちが授業を受けて分からないことに苦労しているところをよく見ました。
先生は一人のため、時間の制約もあり全ての生徒の質問に答えることは難しいかったのです。

英語が上手で英語のウェブを探し、解決する人もいたですが、国内ではそういうIT情報がよく集まる
ウェブサイトが見つかりませんでした。

このため私はその時に受けていた、映像の授業と学校の講義を合わせたらこういう悩みが解決できるかも知れないと思いました。
単なる映像提供のサービスではなく、その映像を見て疑問に思ったこと、もっといい情報をディスカッションするそういうウェブサイトです。
互いに知らないことを教え会い、相乗効果を作る出すことができるホームページと思いました。

このため、二つのサイトを参考として開発に取り組むことにしました。


## 構成
&nbsp;
* メイン

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/02.png)
**1: 基本的サービスを提供する処です.**

Lectureは講義サービスを提供するページ

Discussは講義と関連する掲示板です。



**2: 会員を管理する処です。**

Bootstrap4 Modalテンプレートを使用しました。
セッションを通じたログイン方法です。

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/03.png)

Jspを使うログイン時、変化するように作られています。

**3：クリックし、各難易度に対応するlecture部分に移動します。**

offsetメソッドを使い、移動するようclick属性を付与しました。

&nbsp;
* 会員登録Modalです。

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/04.png)

**1: 会員情報の入力する処です。**

正規表現のコードでViewからの着信データを検査します。

正規表現を通過しない場合や、入力データが満たされない時**2**に該当するメッセージが表示されます。

&nbsp;
* 映像サービスlectureです。

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/05.png)

**1: 各難易度に対応するスクロールに移動します。**

**2: 講義のページです。クリック時、Modalポップアップが表示されます。**

&nbsp;
* 講義モーダルです。

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/06.png)

**1: Oracle DBから取得した講義情報です。**

**2:ページイベントです。**

Enrollボタン：講義サービス提供のページに進みます。

Discussボタン：講義情報のページに進みます。

&nbsp;
* 講義サービス提供のページです。

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/07.png)

**1: 講義の小分類です。**

講義ごとに1つの映像urlを含む情報を持っています。

**2: Side-navigation barを開閉するボタンです。**

**3: DBから取得したyoutube urlをiframeを使って映像を映します**

&nbsp;
* ディスカッション掲示板です。

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/08.png)

**1: 講義の難易度別に分類されています。**

**2: Spring WebSocketを利用して、接続者のログイン情報を現れます。**

ログイン中のデータの情報を表記します。
上の写真では、adminアカウントでログインしているので、adminだけが表示されました。
DBから読み取った統計情報と、過去3日以内の新会員情報を表記します。

&nbsp;
* 科目別掲示板です。

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/09.png)

**1: 掲示板です。** 

作成した人のIDや、最後のコメントの人などの情報が表記されます。

**2: 検索機能です。** 

タイトル、内容、作成者フィルタで検索が可能です。

**3: 新しいディスカッションボタンです。** 

ログインしている場合にのみ有効になります。

&nbsp;
* スレッドのページです。

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/10.png)

**1: スレッドのページです。**

ログインユーザーが作成者本人であれば、「3」と同じく変更、削除、ボタンがアクティブになります。

**2: スレッドのコメントです。**

handlebar.jsライブラリを使い作られています。

**3: ログインユーザーがコメントの作成者であれば、変更、削除ボタンがアクティブになります。**


&nbsp;
##  作成する前の構想との違い

プロジェクトを開始する前に、簡単な概要pptを作成しました。

大まかに構想をしてました。

下でも違いを説明するために使用するが、見たい人は下のアドレスをご参照してください。

https://www.slideshare.net/yuwonkyun/spring-overview-roughly

&nbsp;
![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/changed/001.png?raw=true)
 
始めは、ただ会話が出来る自由掲示板を作成しようと思いました。

しかし、映像サービス提供プラットフォームで自由掲示板があることがぎこちなく感じました。

それで自由掲示板を消して、ディスカッション掲示板を作ることにしました。

&nbsp;
![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/changed/002.png?raw=true)

Ajaxを利用して、すべてのinputのデータを確認して

「重複したIDです。」という風に使用しようとしましたが、

正規表現を利用したviewの活用だけでフィルタ処理をしました。

&nbsp;
![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/changed/003.png?raw=true)

自由掲示板が消えて無駄な部分になってしまいました。

全て排除し、ディスカッション掲示板に改造しました。

&nbsp;
![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/changed/004.png?raw=true)

難易度をアコーディオンのようなJquery UIを使い処理しようとしましたが、

ユーザーの立場で考えてみると
クリックのイベントを発生してこそコンテンツが見えるということは非常に不便だと思いました。

それで、offsetを利用したスクロールボタンを作っておいて
すべての講義をページに表現するようにしました。

&nbsp;
![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/changed/005.png?raw=true)

自由掲示板が消えディスカッション掲示板が作られたので

検索機能は掲示板に含まれており、機能自体が必要がなくなりました。

このため機能が消えました。

&nbsp;
![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/changed/006.png?raw=true)

lecture comment機能を作成する際、DIscussにディスカッション機能を集中させる意図が希釈される機能性があると思いました。

Udacityもvideo comentは使用しておりません。その点を考え、機能を削除しました。


&nbsp;
## プロジェクトを仕上げながら感じたこと

&nbsp;
まず、DBに対して感じたことがあります。以下は私が作ったDBのerdです。

![alt text](https://github.com/Saimoon13/myProject2/blob/master/web/resources/imgForPort/erd.png?raw=true)

プロジェクトを完成した後、データベースerdを作りながら感じた点は、
重複している部分があまりにも多いということです。

lid（科目名）、lname（科目名）などの科目については、過半以上のテーブルで使用されています。


オブジェクト指向言語では、継承を使ってコードの重複を最小限に抑えることができます。

しかし、データベースは継承がありません。

他の人に聞いて調査してデータベースはリレーションを利用して

重複を最小限に抑えることができるという事実を知りましたが、具体的に活用戦略はわからないままです。


また、youtube urlの処理のためには、キー（key）の処理しなかった点も非常に気になります。

データベースの設計能力がないことを痛感し、
勉強して今度はより緻密な構成を作るよう努力しようと思いました。

&nbsp;
&nbsp;
最後に、一人でプロジェクトを仕上げながらよく思った点は知らないことを一人で調査する必要がないという点です。

先生の下でグループプロジェクトを進める時は、わからないことはチームメンバーに尋ねたり
それでも解決しない場合は、先生に聞くことができます。
しかし、一人で準備すれば、そのことができない点が大変でした。

**'このやり方でできると思ってのに、なんで出来ないんだ？'**
 
という疑問を解決するためにstackoverflowなどのウェブサイトを積極的に活用しました。
探してもわからない場合は直接質問をしました。

このような経験で、教えてくれる指導者なしで自ら解決する方法を学ぶ一方、
先生の重要性を再び実感しました。


</p>
</details>
