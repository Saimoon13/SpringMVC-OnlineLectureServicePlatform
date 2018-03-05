<%@ page import="domain.Member" %><%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2018-02-21
  Time: 오전 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

    <meta charset="utf-8">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit:no">--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="../../../resources/CSS/discuss-overview.css?df" type="text/css" media="screen"
          title="no title"
          charset="utf-8"/>

    <script src="../../../resources/lib/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
    <script src="../../../resources/lib/bootstrap.bundle.min.js"></script>

    <title>Forum - Topic overview</title>

    <style type="text/css">
        .author-col {
            min-width: 12em;
        }

        .post-col {
            min-width: 20em;
        }

    </style>
</head>
<body>
<header>
    <jsp:include page="../subPage/header.jsp">
        <jsp:param name="before" value="third"></jsp:param>
    </jsp:include>
</header>

<%--my margin top and bottom--%>
<div class="container my-3">
    <nav class="breadcrumb">
        <a href="/discuss/" class="breadcrumb-item">Discuss</a>
        <a href="/discuss/topics?lid=${lid}&lname=${lname}&lcategory=${lcategory}" class="breadcrumb-item">${lname}</a>
        <span class="breadcrumb-item active">${topic.title}</span>
    </nav>
    <div class="row">
        <div class="col-12">
            <c:choose>
                <c:when test="${lcategory eq 'basic'}">
                    <h2 class="h4 text-white bg-warning mb-0 p-4 rounded-top">${lname}</h2>
                </c:when>
                <c:when test="${lcategory eq 'advanced'}">
                    <h2 class="h4 text-white bg-info mb-0 p-4 rounded-top">${lname}</h2>
                </c:when>
                <c:when test="${lcategory eq 'superior'}">
                    <h2 class="h4 text-white bg-dark mb-0 p-4 rounded-top">${lname}</h2>
                </c:when>
                <c:otherwise>
                    <h2 class="h4 bg-light mb-0 p-4 rounded-top">Unknown Error</h2>
                </c:otherwise>
            </c:choose>
            <%--<h2 class="h4 text-white bg-info mb-0 p-4 rounded-top">forum post title with a complex and long questio</h2>--%>
            <table class="table table-striped table-bordered table-responsive-lg">
                <thead class="thead-light">
                <tr>
                    <th scope="col" class="topic-col" style="width: 18%">Author</th>
                    <th scope="col" class="created-col" style="width: 72%;">Message</th>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <td class="author-col">
                        <div>by <a href="#0">${writer.userid}</a></div>
                    </td>
                    <td class="post-col d-lg-flex justify-content-lg-between">
                        <div><span class="font-weight-bold">Post subject:</span> ${topic.title}</div>
                        <fmt:formatDate var="topicdate" value="${topic.topicdate}" pattern="yy/MM/dd HH:mm:ss"/>
                        <div><span class="font-weight-bold">Posted:</span>${topicdate}</div>
                    </td>

                </tr>
                <tr>
                    <td>
                        <fmt:formatDate var="regdate" value="${writer.regdate}" pattern="yy/MM/dd HH:mm:ss"/>
                        <div><span class="font-weight-bold">Joined:</span> ${regdate}</div>
                        <div><span class="font-weight-bold">Posts:</span> ${writer.postnum}</div>
                        <c:choose>
                            <c:when test="${user.userid eq writer.userid}">
                                <div class="row">
                                        <%--TODO: href 파마미터로 {{replynumber}} 넘길것--%>
                                    <a class="col-6" href="update?tnumber=${topic.tnumber}&lname=${lname}&lcategory=${lcategory}&lid=${lid}">Update</a>
                                    <a class="col-6" href="#">Delete</a>
                                </div>
                            </c:when>
                        </c:choose>
                    </td>
                    <td>
                        <p>${topic.tcontent}</p>
                    </td>
                </tr>
                </tbody>
            </table>
            <table class="table table-striped table-bordered table-responsive-lg">
                <thead class="thead-light">
                <tr>
                    <th scope="col" class="topic-col" style="width: 18%">Author</th>
                    <th scope="col" class="created-col" style="width: 72%">Message</th>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <td class="author-col">
                        <div>by <a href="#0">Author name</a></div>
                    </td>
                    <td class="post-col d-lg-flex justify-content-lg-between">
                        <div><span class="font-weight-bold">Post subject:</span>forum post title with a complex and
                            long
                            questio
                        </div>
                        <div><span class="font-weight-bold">Posted:</span> 05 apr 2017, 20:07</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div><span class="font-weight-bold">Joined:</span> 05 apr 2017, 20:07</div>
                        <div><span class="font-weight-bold">Posts:</span> 123</div>
                    </td>
                    <td>
                        <p>
                            ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
                            ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
                            dddddddddddddddddddddddddddddddddddddddddddddddddd</p>
                        <img src="https://placehold.it/600x400" class="img-flow">
                        <p>ddddddddddddddddddddddddddddddddddddddddd
                            ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
                            dddddddddddddddddddddddddddddddddddddd</p>
                    </td>
                </tr>
                </tbody>
            </table>
            <div>
                <div class="row" id="replyTh-tables">

                </div>
            </div>
        </div>
    </div>
    <div class="mb-3 clearfix">
        <nav aria-label="Navigate post pages" class="float-lg-right">
            <ul class="pagination pagination-sm mb-lg-0">
                <li class="page-item"><a href="#0" class="page-link">1<span class="sr-only">(current)</span></a></li>
                <li class="page-item"><a href="#0" class="page-link">2</a></li>
                <li class="page-item"><a href="#0" class="page-link">3</a></li>
                <li class="page-item"><a href="#0" class="page-link">4</a></li>
                <li class="page-item"><a href="#0" class="page-link">5</a></li>
                <li class="page-item"><a href="#0" class="page-link">&hellip; 31</a></li>
                <li class="page-item"><a href="#0" class="page-link">Next</a></li>
            </ul>
        </nav>
    </div>
    <%--<form class="mb-3">--%>
    <%
        if ((Member) session.getAttribute("loginResult") != null) {
            out.print("<div class=\"form-group\">\n" +
                    "        <input type=\"text\" class=\"form-control\" name=\"replyTitle\" path=\"replyTitle\"\n" +
                    "               id=\"replyTitle\" placeholder=\"Give your a comment title.\" required>\n" +
                    "    </div>\n" +
                    "    <div class=\"form-group\">\n" +
                    "            <textarea class=\"form-control\" id=\"replyComment\" rows=\"10\" placeholder=\"Write your comment here\"\n" +
                    "                      required></textarea>\n" +
                    "    </div>\n" +
                    "    <button type=\"submit\" class=\"btn btn-primary mb-3\" id=\"btn-insert\">Reply</button>\n" +
                    "    <button type=\"reset\" class=\"btn btn-danger mb-3\">Reset</button>");
        }
    %>
    <%--<div class="form-group">--%>
    <%--<input type="text" class="form-control" name="replyTitle" path="replyTitle"--%>
    <%--id="replyTitle" placeholder="Give your a comment title." required>--%>
    <%--</div>--%>
    <%--<div class="form-group">--%>
    <%--<textarea class="form-control" id="replyComment" rows="10" placeholder="Write your comment here"--%>
    <%--required></textarea>--%>
    <%--</div>--%>
    <%--<button type="submit" class="btn btn-primary mb-3" id="btn-insert">Reply</button>--%>
    <%--<button type="reset" class="btn btn-danger mb-3">Reset</button>--%>
    <%--</form>--%>

</div>

<footer class="small bg-dark text-white">
    <div class="container py-4">
        <ul class="list-inline mb-0 text-center">
            <li class="list-inline-item">&copy; 2017 web company, Inc.</li>
            <li class="list-inline-item">All rights reserved.</li>
            <li class="list-inline-item">&copy; 2017 web company, Inc.</li>
        </ul>
    </div>
</footer>

<%--핸들러--%>
<script id="replyThread" type="text/x-handlebars-template">
    <div class="col-12">
        <table class="table table-striped table-bordered table-responsive-lg ">
            <thead class="thead-light">
            <tr>
                <th scope="col" class="topic-col" style="width: 18%">Author${lid}</th>
                <th scope="col" class="created-col" style="width: 72%">Message</th>
            </tr>
            </thead>

            <tbody>
            <tr>
                <td class="author-col">
                    <div class="replyUserid">by <a href="#0">{{userid}}</a></div>
                </td>
                <td class="post-col d-lg-flex justify-content-lg-between">
                    <div><span class="font-weight-bold">Post subject:</span> {{title}}</div>
                    <div><span class="font-weight-bold">Posted:</span><a> {{replydate}}</a></div>
                </td>
            </tr>
            <tr>
                <td class="replyStatusBtn">
                    <div><span class="font-weight-bold">Joined:</span> {{signupdate}}</div>
                    <div><span class="font-weight-bold">Posts:</span> {{postnum}}</div>
                    <div class="row">
                        <%--TODO: href 파마미터로 {{replynumber}} 넘길것--%>
                        <a class="col-6 updateReplyBtn" id="updateReply-{{replynumber}}">{{#noop}}{{Update}}{{/noop}}</a>
                        <a class="col-6" href="#">{{#noop2}}{{Delete}}{{/noop2}}</a>
                    </div>
                </td>
                <td>
                    <p>{{rcontent}}</p>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="form-group updateReplyText" id="updateReply-{{replynumber}}text">
            <textarea class="form-control" rows="5"
                      placeholder="Write your update here" required>{{rcontent}}</textarea>
            <button type="submit" class="btn btn-primary my-2" style="float: right">Change</button>
        </div>
    </div>
</script>





<script>
    $(document).ready(function () {
        // 검색할 댓글의 게시글 번호


        <%--if($('.replyUserid a').html() == ${user.userid})--%>

        // jQuery를 사용해서 AJAX 요청을 보내는 함수들 중에서
        // $.getJSON(url, data, callback)
        // 해당 url로 HTTP GET 방식의 ajax 요청을 보내고,
        // JSON 객체를 로드하는 함수
        // url (필수): 서버로 요청을 보내는 주소
        // data (선택): 요청과 함께 서버로 보내는 데이터. 생략 가능.
        // callback (선택): 응답을 받았을 때 처리할 일을 정의하는 콜백 함수

        var tnumber = ${topic.tnumber};

        function getAllReplies() {
            $.getJSON('/rplyth/all/' + tnumber, function (data) {
                console.log('댓글 갯수: ' + data.length);

                var temp = "";
                $(data).each(function () {
                    var templateResponse = Handlebars.compile($("#replyThread").html());
                    var contextResponse = {
                        userid: JSON.parse(this.member).userid,
                        signupdate: JSON.parse(this.member).regdate,
                        postnum: JSON.parse(this.member).postnum,
                        title: this.title,
                        replydate: this.replydate,
                        rcontent: this.rcontent,
                        replynumber: this.replynumber
                    }
//                    자신의 댓글만 update/delete 뜨게 처리 start
                    if ('${user.userid}' === JSON.parse(this.member).userid) {
                        <%--console.log('${user.userid}' === JSON.parse(this.member).userid);--%>
                        Handlebars.registerHelper('noop', function (options) {
                            return options.fn(this) + "Update";
                        });
                        Handlebars.registerHelper('noop2', function (options) {
                            return options.fn(this) + "Delete";
                        });
                    } else {
                        Handlebars.registerHelper('noop', function (options) {
                            return options.fn(this);
                        });
                        Handlebars.registerHelper('noop2', function (options) {
                            return options.fn(this);
                        });
                    }
//                    end
                    temp += templateResponse(contextResponse);
                });
                $('#replyTh-tables').html(temp);
                $('.updateReplyText').hide();

                $('.updateReplyBtn').click(function () {
                    var id = this.id
                    var id_change = id + "text";

                    var textReply = document.getElementById(id_change.toString());
                    if (textReply.style.display === "none") {
                        textReply.style.display = "block";
                    } else {
                        textReply.style.display = "none";
                    }
                });

                <%--console.log('${user.userid}', $('.replyUserid a').html());--%>

            });
        } //
        getAllReplies();

        // btn-insert 버튼을 클릭했을 때 댓글 입력 기능
        $('#btn-insert').click(function () {
            var rtitle = $('#replyTitle').val();
            var rcoment = $('#replyComment').val();
            console.log('rtitle: ' + rtitle + ", " + "rcoment: " + rcoment);
            $.ajax({
                type: 'post',
                url: '/rplyth',
                headers: {
                    'Content-Type': 'application/json',
                    'X-HTTP-Method-Override': 'POST'
                },
                data: JSON.stringify({
                    'tnumber': tnumber,
                    'title': rtitle,
                    'rcontent': rcoment
                }),
                success: function (result) {
                    if (result === 1) {
                        alert("댓글 입력 성공");
                        $('#replyTitle').val("");
                        $('#replyComment').val("");
                        getAllReplies();
                    } else {
                        alert("댓글 입력 실패");
                    }
                }
            });
        });


//        $('#replies').on('click', '.reply-item .btn-update',
//            function () {
//                var rno = $(this).prevAll('#rno').val();
//                console.log('rno = ' + rno);
//                var rtext = $(this).prevAll('#rtext').val();
//                console.log('rtext = ' + rtext);
//
//                $.ajax({
//                    type: 'PUT',
//                    url: '/replies/' + rno,
//                    headers: {
//                        'Content-Type': 'application/json',
//                        'X-HTTP-Method-Override': 'PUT'
//                    },
//                    data: JSON.stringify({
//                        'rtext': rtext
//                    }),
//                    success: function (result) {
//                        if (result === 'success') {
//                            alert('댓글 수정 성공');
//                            getAllReplies();
//                        } else {
//                            alert('댓글 수정 실패');
//                        }
//                    }
//                });
//
//            });
//
//        $('#replies').on('click', '.reply-item .btn-delete',
//            function () {
//                var rno = $(this).prevAll('#rno').val();
//
//                $.ajax({
//                    type: 'DELETE',
//                    url: '/replies/' + rno,
//                    headers: {
//                        'Content-Type': 'application/json',
//                        'X-HTTP-Method-Override': 'DELETE'
//                    },
//                    success: function (result) {
//                        if (result === 'success') {
//                            alert('댓글 삭제 성공');
//                            getAllReplies();
//                        } else {
//                            alert('댓글 삭제 실패');
//                        }
//                    }
//                });
//            });

    });

</script>


</body>
</html>
