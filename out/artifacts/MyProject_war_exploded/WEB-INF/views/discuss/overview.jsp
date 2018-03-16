<%@ page import="java.util.List" %>
<%@ page import="domain.Discuss" %><%--
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
    <link rel="stylesheet" href="../../../resources/CSS/discuss-overview.css?sf" type="text/css" media="screen"
          title="no title"
          charset="utf-8"/>

    <title>Discuss-Board overview</title>

    <style type="text/css">

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
        <span class="breadcrumb-item active">Discuss</span>
    </nav>
    <div class="row">
        <div class="col-12 col-xl-9">
            <h2 class="h4 text-white bg-warning mb-0 p-4 rounded-top">Basic</h2>
            <table class="table table-striped table-bordered table-responsive mb-xl-0">
                <thead class="thead-light">
                <tr>
                    <th scope="col" class="forum-col tr-th-1">forum</th>
                    <th scope="col" class="tr-th-2">topics</th>
                    <th scope="col" class="tr-th-3">replies</th>
                    <th scope="col" class="last-post-col tr-th-4">last post</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach var="Discuss" items="${lectureList}">
                    <c:choose>
                        <c:when test="${Discuss.lcategory eq 'basic'}">
                            <tr>
                                <td>
                                    <h3 class="h5 mb-0"><a
                                            href="/discuss/topics?lid=${Discuss.lid}&lname=${Discuss.lname}&lcategory=${Discuss.lcategory}"
                                            class="text-uppercase">${Discuss.lname}</a></h3>
                                    <p class="mb-0">${Discuss.lexplain}</p>
                                </td>
                                <td>
                                    <div>${Discuss.topiccount}</div>
                                </td>
                                <td>
                                    <div>${Discuss.rlycount}</div>
                                </td>
                                <td>
                                    <fmt:formatDate var="lasttopicdate" value="${Discuss.lasttopicdate}"
                                                    pattern="yyyy/MM/dd HH:mm:ss"/>
                                    <h4 class="h6 mb-0 font-weight-bold"><a href="#0"><span>${Discuss.lasttitle}</span></a>
                                    </h4>
                                    <c:if test="${empty Discuss.lastwriter}">
                                        <div>Empty</div>
                                    </c:if>
                                    <c:if test="${not empty Discuss.lastwriter}">
                                        <div>by <a href="#0"><span>${Discuss.lastwriter}</span></a></div>
                                    </c:if>
                                    <div>${lasttopicdate}</div>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                </tbody>
            </table>

            <h2 class="h4 text-white bg-info mb-0 p-4 rounded-top mt-3">Advanced</h2>
            <table class="table table-striped table-bordered table-responsive mb-xl-0">
                <thead class="thead-light">
                <tr>
                    <th scope="col" class="forum-col tr-th-1">forum</th>
                    <th scope="col" class="tr-th-2">topics</th>
                    <th scope="col" class="tr-th-3">replies</th>
                    <th scope="col" class="last-post-col tr-th-4">last post</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="Discuss" items="${lectureList}">
                    <c:choose>
                        <c:when test="${Discuss.lcategory eq 'advanced'}">
                            <tr>
                                <td>
                                    <h3 class="h5 mb-0"><a
                                            href="/discuss/topics?lid=${Discuss.lid}&lname=${Discuss.lname}&lcategory=${Discuss.lcategory}"
                                            class="text-uppercase">${Discuss.lname}</a></h3>
                                    <p class="mb-0">${Discuss.lexplain}</p>
                                </td>
                                <td>
                                    <div>${Discuss.topiccount}</div>
                                </td>
                                <td>
                                    <div>${Discuss.rlycount}</div>
                                </td>
                                <td>
                                    <fmt:formatDate var="lasttopicdate" value="${Discuss.lasttopicdate}"
                                                    pattern="yyyy/MM/dd HH:mm:ss"/>
                                    <h4 class="h6 mb-0 font-weight-bold"><a href="#0"><span>${Discuss.lasttitle}</span></a>
                                    </h4>
                                    <c:if test="${empty Discuss.lastwriter}">
                                        <div>Empty</div>
                                    </c:if>
                                    <c:if test="${not empty Discuss.lastwriter}">
                                        <div>by <a href="#0"><span>${Discuss.lastwriter}</span></a></div>
                                    </c:if>
                                    <div>${lasttopicdate}</div>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                </tbody>
            </table>

            <h2 class="h4 text-white bg-dark mb-0 p-4 rounded-top mt-3">Superior</h2>
            <table class="table table-striped table-bordered table-responsive mb-xl-0">
                <thead class="thead-light">
                <tr>
                    <th scope="col" class="forum-col tr-th-1">forum</th>
                    <th scope="col" class="tr-th-2">topics</th>
                    <th scope="col" class="tr-th-3">replies</th>
                    <th scope="col" class="last-post-col tr-th-4">last post</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="Discuss" items="${lectureList}">
                    <c:choose>
                        <c:when test="${Discuss.lcategory eq 'superior'}">
                            <tr>
                                <td>
                                    <h3 class="h5 mb-0"><a
                                            href="/discuss/topics?lid=${Discuss.lid}&lname=${Discuss.lname}&lcategory=${Discuss.lcategory}"
                                            class="text-uppercase">${Discuss.lname}</a></h3>
                                    <p class="mb-0">${Discuss.lexplain}</p>
                                </td>
                                <td>
                                    <div>${Discuss.topiccount}</div>
                                </td>
                                <td>
                                    <div>${Discuss.rlycount}</div>
                                </td>
                                <td>
                                    <fmt:formatDate var="lasttopicdate" value="${Discuss.lasttopicdate}"
                                                    pattern="yyyy/MM/dd HH:mm:ss"/>
                                    <h4 class="h6 mb-0 font-weight-bold"><a href="#0"><span>${Discuss.lasttitle}</span></a>
                                    </h4>
                                    <c:if test="${empty Discuss.lastwriter}">
                                        <div>Empty</div>
                                    </c:if>
                                    <c:if test="${not empty Discuss.lastwriter}">
                                        <div>by <a href="#0"><span>${Discuss.lastwriter}</span></a></div>
                                    </c:if>
                                    <div>${lasttopicdate}</div>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                </tbody>
            </table>
        </div>
        <div class="col-12 col-xl-3">
            <aside>
                <div class="row">
                    <div class="col-12 col-sm-6 col-xl-12">
                        <%--576(sm)이상일 경우 2개(6+6) 1200(xl)이상일경우 12--%>
                        <div class="card mb-3 mb-sm-0 mb-xl-3">
                            <div class="card-body">
                                <h2 class="h4 card-title">Site online</h2>
                                <%
                                    if (session.getAttribute("loginResult") != null) {
                                        out.print("<ul class=\"list-unstyled mb-0\" id=\"usersInfo\"></ul>");
                                    } else {
                                        out.print("<ul class=\"list-unstyled mb-0\">Please, Login for OnlineList.</ul>");
                                    }
                                %>
                                <%--<ul class="list-unstyled mb-0" id="usersInfo"></ul>--%>
                            </div>
                            <div class="card-footer">
                                <dl class="row mb-0">
                                    <dt class="col-8">Total online:</dt>
                                    <dt class="col-4 mb-0" id="totalOnline">10</dt>
                                </dl>
                                <%--<dl class="row mb-0">--%>
                                <%--<dt class="col-8">total:</dt>--%>
                                <%--<dt class="col-4 mb-0">7</dt>--%>
                                <%--</dl>--%>
                                <%--<dl class="row mb-0">--%>
                                <%--<dt class="col-8">total:</dt>--%>
                                <%--<dt class="col-4 mb-0">3</dt>--%>
                                <%--</dl>--%>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-xl-12">
                        <div class="card">
                            <div class="card-body">
                                <h2 class="h4 card-title">Forum statistics</h2>
                                <dl class="row mb-0">
                                    <dt class="col-8">forums:</dt>
                                    <dt class="col-4 mb-0">${topicTotalCount}</dt>
                                </dl>
                                <dl class="row mb-0">
                                    <dt class="col-8">replies thread:</dt>
                                    <dt class="col-4 mb-0">${replythreadTotalCount}</dt>
                                </dl>
                                <dl class="row mb-0">
                                    <dt class="col-8">total members:</dt>
                                    <dt class="col-4 mb-0">${memberTotalCount}</dt>
                                </dl>
                            </div>
                            <div class="card-footer">
                                <div>newset member:</div>
                                <c:forEach var="Member" items="${newsetMember}">
                                    <div><a href="#0">${Member}</a></div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </aside>
        </div>
    </div>

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

<script src="../../../resources/lib/jquery-3.3.1.min.js"></script>
<script src="../../../resources/lib/bootstrap.bundle.min.js"></script>

<script>
    $(document).ready(function () {

        var userinfo = $("#usersInfo"); // 유저 목록
        var currentUser = $("#userid a").html();

        function Socket(url, callback) {
            var socket = new WebSocket(url);

            socket.onopen = function (event) {
                var message = {
                    type: 0,
                    username: "justCallForList"
                };
                console.log(currentUser + " : overview 메시지");
                socket.send(JSON.stringify(message));
            }

            socket.onmessage = function (event) {
                callback(event);
            }

            return socket;
        }

        var socket = new Socket("ws://localhost:8282/webSocketServer", messageHandle);

        function messageHandle(event) {
            var jsonStr = event.data;
            var data = JSON.parse(jsonStr);

            switch (data.type) {
                case 3: // json 타입이 3일 때
                    var usernames = data.usernames;
                    var userinfo = $("#usersInfo");
                    userinfo.empty();
                    $('#totalOnline').html(usernames.length);
                    for (var i = 0, len = usernames.length; i < len; i++) {
                        var username = $("<li><a href=\"#0\"></a></li>");
                        username.text(usernames[i]);
                        userinfo.append(username);
                    }

                    break;
                case 4: // json 타입이 4일 때 사용자 정보 삭제
                    userinfo.find(":contains(" + data.username + ")").remove();
            }
        }

    })
</script>

</body>
</html>
