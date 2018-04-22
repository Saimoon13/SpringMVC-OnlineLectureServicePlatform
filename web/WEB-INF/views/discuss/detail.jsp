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
                                    <a class="col-6"
                                       href="update?tnumber=${topic.tnumber}&lname=${lname}&lcategory=${lcategory}&lid=${lid}">Update</a>
                                    <a class="col-6" href="delete?tnumber=${topic.tnumber}&lname=${lname}&lcategory=${lcategory}&lid=${lid}">Delete</a>
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
            <div>
                <div class="row" id="replyTh-tables">

                </div>
            </div>
        </div>
    </div>
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
                    "    <button type=\"submit\" class=\"btn btn-primary mb-3\" id=\"btn-insert\">Reply thread</button>\n" +
                    "    <button type=\"reset\" class=\"btn btn-danger mb-3\">Reset</button>");
        }
    %>

</div>

<jsp:include page="../subPage/footer.jsp"/>

<%--핸들러--%>
<script id="replyThread" type="text/x-handlebars-template">
    <div class="col-12">
        <table class="table table-striped table-bordered table-responsive-lg ">
            <thead class="thead-light">
            <tr>
                <th scope="col" class="topic-col" style="width: 18%">Author</th>
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
                        <a class="col-6 updateReplyBtn"
                           id="updateReply-{{replynumber}}">{{#noop}}{{Update}}{{/noop}}</a>
                        <a class="col-6 deleteReplyBtn"
                           id="deleteReply:{{replynumber}}-">{{#noop2}}{{Delete}}{{/noop2}}</a>
                    </div>
                </td>
                <td>
                    <p>{{rcontent}}</p>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="form-group updateReplyText" id="updateReply-{{replynumber}}text">
            <textarea class="form-control" rows="5" id="textarea:{{replynumber}}-text"
                      placeholder="Write your update here" required>{{rcontent}}</textarea>
            <button type="submit" class="btn btn-primary my-2 UpdateConfirmBtn" id="textarea:{{replynumber}}"
                    style="float: right">Change
            </button>
        </div>
    </div>
</script>

<script>
    $(document).ready(function () {

        var tnumber = ${topic.tnumber};

        function getAllReplies() {
            $.getJSON('/rplyth/all/' + tnumber, function (data) {
                console.log('RelyThread Number: ' + data.length);

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
//                    My update/delete Creating Start
                    if ('${user.userid}' === JSON.parse(this.member).userid) {
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
//                    End
                    temp += templateResponse(contextResponse);
                });
                $('#replyTh-tables').html(temp);
                $('.updateReplyText').hide();

                $('.updateReplyBtn').click(function () {
                    var id = this.id;
                    var id_change = id + "text";

                    var textReply = document.getElementById(id_change.toString());
                    if (textReply.style.display === "none") {
                        textReply.style.display = "block";
                    } else {
                        textReply.style.display = "none";
                    }
                });

                $('.UpdateConfirmBtn').click(function () {
                    var id = this.id;
                    var id_change = id + "-text";

                    var replynumber = id_change.substring(id_change.indexOf(":") + 1, id_change.indexOf("-"));

                    var textarea = document.getElementById(id_change.toString());
                    console.log(textarea.value + ", " + replynumber);

                    $.ajax({
                        type: 'PUT',
                        url: '/rplyth/' + replynumber,
                        headers: {
                            'Content-Type': 'application/json',
                            'X-HTTP-Method-Override': 'PUT'
                        },
                        data: JSON.stringify({
                            'rcontent': textarea.value
                        }),
                        success: function (result) {
                            if (result === 'success') {
                                alert('ReplyThread Edit Success');
                                getAllReplies();
                            } else {
                                alert('ReplyThread Edit Fail');
                            }
                        }
                    });

                });

                $('.deleteReplyBtn').click(function () {
                    var id = this.id;
                    var replynumber = id.substring(id.indexOf(":") + 1, id.indexOf("-"));

                    console.log(replynumber);

                    $.ajax({
                        type: 'DELETE',
                        url: '/rplyth/' + replynumber,
                        headers: {
                            'Content-Type': 'application/json',
                            'X-HTTP-Method-Override': 'DELETE'
                        },
                        success: function (result) {
                            if (result === 'success') {
                                alert('ReplyThread Delete Success');
                                getAllReplies();
                            } else {
                                alert('ReplyThread Delete Fail');
                            }
                        }
                    });
                }); // delete end
            });
        }
        getAllReplies();

        // btn-insert Click function
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
                        alert("ReplyThread Creating Success");
                        $('#replyTitle').val("");
                        $('#replyComment').val("");
                        getAllReplies();
                    } else {
                        alert("ReplyThread Creating Fail");
                    }
                }
            });
        });


    });

</script>


</body>
</html>
