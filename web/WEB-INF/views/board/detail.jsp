<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt"
           uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Insert title here</title>

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>

<!-- 머리글 -->
<header>
    <jsp:include page="../subPage/header.jsp">
        <jsp:param name="before" value="first"></jsp:param>
    </jsp:include>
</header>
<div class="container">
    <div class="vertical">


        <h1>게시글 상세 보기</h1>

        <ul>
            <li><a href="update?bno=${board.bno}">수정하기</a></li>
            <li><a href="list">메인으로</a></li>
        </ul>

        <form>
            <label for="bno">번호</label><br/>
            <input type="number" name="bno" id="bno"
                   value="${board.bno}" readonly/>
            <br/>
            <label for="title">제목</label><br/>
            <input type="text" name="title" id="title"
                   value="${board.title}" readonly/>
            <br/>
            <label for="content">본문</label><br/>
            <textarea rows="5" cols="40" name="content" id="content"
                      readonly>${board.content}</textarea>
            <br/>
            <label for="userid">작성자</label><br/>
            <input type="text" name="userid" id="userid"
                   value="${board.userid}" readonly/>
            <br/>
            <label for="replydate">작성 시간</label><br/>
            <fmt:formatDate value="${board.replydate}" var="replydate"
                            pattern="yyyy/MM/dd HH:mm:ss"/>
            <input type="text" id="replydate" value="${replydate}" readonly/>
            <br/>
        </form>

        <%----------------------------댓글------------------------------------%>

        <h1>댓글 처리</h1>
        <label>게시글 번호</label>
        <input type="text" id="replybno" value="${board.bno}" readonly/>

        <hr/>
        <h2>댓글 목록</h2>
        <div id="replies"></div>


        <br/>
        <input type="text" name="rtext" id="rtext"
               placeholder="댓글을 입력하세요"/>
        <input type="text" name="replier" id="replier"
               placeholder="아이디 입력"/>
        <button type="button" id="btn-insert">댓글 입력</button>
    </div>

</div>
<!-- 꼬리글 -->
<footer>
    <jsp:include page="../subPage/footer.jsp"></jsp:include>
</footer>

<script>
    $(document).ready(function () {
        // 검색할 댓글의 게시글 번호
        var bno = ${board.bno};

        // jQuery를 사용해서 AJAX 요청을 보내는 함수들 중에서
        // $.getJSON(url, data, callback)
        // 해당 url로 HTTP GET 방식의 ajax 요청을 보내고,
        // JSON 객체를 로드하는 함수
        // url (필수): 서버로 요청을 보내는 주소
        // data (선택): 요청과 함께 서버로 보내는 데이터. 생략 가능.
        // callback (선택): 응답을 받았을 때 처리할 일을 정의하는 콜백 함수
        function getAllReplies() {
            $.getJSON('/replies/all/' + bno, function (data) {
                // 매개변수 data: Ajax 요청에 대한 응답으로 온 데이터
                console.log('댓글 갯수: ' + data.length);

                var replyList = '';
                $(data).each(function () {
                    replyList +=
                        '<div class="reply-item" data-rno="'
                        + this.rno
                        + '">'
                        + '<input type="hidden" id="rno" value="'
                        + this.rno
                        + '" readonly />'
                        + '<input type="text" id="rtext" value="'
                        + this.rtext
                        + '" />'
                        + '<input type="text" id="replier" value="'
                        + this.replier
                        + '" readonly />'
                        + '<button class="btn-update">수정</button>'
                        + '<button class="btn-delete">삭제</button>'
                        + '</div>';
                });
                $('#replies').html(replyList);

            });
        } // end function getAllReplies()

        getAllReplies(); // 함수 호출

        // btn-insert 버튼을 클릭했을 때 댓글 입력 기능
        $('#btn-insert').click(function () {
            var rtext = $('#rtext').val();
            var replier = $('#replier').val();
            console.log('bno = ' + bno);
            $.ajax({
                type: 'post',
                url: '/replies',
                headers: {
                    'Content-Type': 'application/json',
                    'X-HTTP-Method-Override': 'POST'
                },
                data: JSON.stringify({
                    'bno': bno,
                    'rtext': rtext,
                    'replier': replier
                }),
                success: function (result) {
                    if (result === 1) {
                        alert("댓글 입력 성공");
                        getAllReplies();
                    } else {
                        alert("댓글 입력 실패");
                    }
                }
            });
        });

        $('#replies').on('click', '.reply-item .btn-update',
            function () {
                var rno = $(this).prevAll('#rno').val();
                console.log('rno = ' + rno);
                var rtext = $(this).prevAll('#rtext').val();
                console.log('rtext = ' + rtext);

                $.ajax({
                    type: 'PUT',
                    url: '/replies/' + rno,
                    headers: {
                        'Content-Type': 'application/json',
                        'X-HTTP-Method-Override': 'PUT'
                    },
                    data: JSON.stringify({
                        'rtext': rtext
                    }),
                    success: function (result) {
                        if (result === 'success') {
                            alert('댓글 수정 성공');
                            getAllReplies();
                        } else {
                            alert('댓글 수정 실패');
                        }
                    }
                });

            });

        $('#replies').on('click', '.reply-item .btn-delete',
            function () {
                var rno = $(this).prevAll('#rno').val();

                $.ajax({
                    type: 'DELETE',
                    url: '/replies/' + rno,
                    headers: {
                        'Content-Type': 'application/json',
                        'X-HTTP-Method-Override': 'DELETE'
                    },
                    success: function (result) {
                        if (result === 'success') {
                            alert('댓글 삭제 성공');
                            getAllReplies();
                        } else {
                            alert('댓글 삭제 실패');
                        }
                    }
                });
            });

    });
</script>

</body>
</html>






