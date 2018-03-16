<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2018-02-21
  Time: 오전 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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

    <title>Forum - Topic overview</title>

    <style type="text/css">
        .topic-col {
            min-width: 16em;
        }

        .created-col,
        .last-post-col {
            min-width: 12em;
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
        <span class="breadcrumb-item active">${lname}</span>
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
            <%--<h2 class="h4 text-white bg-info mb-0 p-4 rounded-top">${lname}</h2>--%>
            <table class="table table-striped table-bordered table-responsive-lg">
                <thead class="thead-light">
                <tr>
                    <th scope="col" class="topic-col" style="width: 60%">Topic</th>
                    <th scope="col" class="created-col" style="width: 15%">Created</th>
                    <th scope="col" style="width: 10%">Statistics</th>
                    <th scope="col" class="last-post-col" style="width: 15%">Last Reply</th>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <td style="vertical-align: middle">
                        <h3 class="h6"><span class="badge badge-primary">Notice</span> <a href="#0"
                                                                                            class="text-uppercase">forum
                            post title with a complex and long question</a></h3>
                    </td>
                    <td>
                        <div>by <a href="#0">Admin</a></div>
                        <div>03 Apr 2017, 13:46</div>
                    </td>
                    <td>
                        <div>5 replies</div>
                        <div>137 views</div>
                    </td>
                    <td>
                        <div>by <a href="#0">author name</a></div>
                        <div>05 apr 2017, 20:07</div>
                    </td>
                </tr>
                <%--<tr>--%>
                    <%--<td>--%>
                        <%--<h3 class="h6 mb-0"><a href="/Discuss/detail">Forum name title with a complex and long--%>
                            <%--question</a></h3>--%>
                    <%--</td>--%>
                    <%--<td>--%>
                        <%--<div>by <a href="#0">Author name</a></div>--%>
                        <%--<div>03 Apr 2017, 13:46</div>--%>
                    <%--</td>--%>
                    <%--<td>--%>
                        <%--<div>5 replies</div>--%>
                        <%--<div>137 views</div>--%>
                    <%--</td>--%>
                    <%--<td>--%>
                        <%--<div>by <a href="#0">author name</a></div>--%>
                        <%--<div>05 apr 2017, 20:07</div>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <c:forEach var="topic" items="${topicList}">
                    <tr>
                        <td style="vertical-align: middle">
                            <h3 class="h6 mb-0"><a
                                    href="/discuss/detail?tnumber=${topic.tnumber}&lname=${lname}&lcategory=${lcategory}&lid=${lid}">${topic.title}, ${topic.tnumber}</a>
                            </h3>
                        </td>
                        <td>
                            <div>by <a href="#0">${topic.writer}</a></div>
                            <div><fmt:formatDate var="replydate" value="${topic.topicdate}"
                                                 pattern="yyyy/MM/dd HH:mm:ss"/>
                                    ${replydate}</div>
                        </td>
                        <td>
                            <div>${topic.rlycount} replies</div>
                            <div>${topic.views} views</div>
                        </td>
                        <td><fmt:formatDate var="lastrlydate" value="${topic.lastrlydate}"
                                            pattern="yyyy/MM/dd HH:mm:ss"/>
                            <c:if test="${empty topic.lastrlyname}">
                                <div>Empty</div>
                            </c:if>
                            <c:if test="${not empty topic.lastrlyname}">
                                <div>by <a href="#0">${topic.lastrlyname}</a></div>
                            </c:if>
                            <div>${lastrlydate}</div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="mb-3 clearfix">
        <nav aria-label="Navigate post pages" class="float-lg-right">
            <ul class="pagination pagination-sm mb-lg-0">
                <%--<li class="page-item"><a href="#0" class="page-link">1<span class="sr-only">(current)</span></a></li>--%>
                <%--<li class="page-item"><a href="#0" class="page-link">2</a></li>--%>
                <%--<li class="page-item"><a href="#0" class="page-link">3</a></li>--%>
                <%--<li class="page-item"><a href="#0" class="page-link">4</a></li>--%>
                <%--<li class="page-item"><a href="#0" class="page-link">5</a></li>--%>
                <%--<li class="page-item"><a href="#0" class="page-link">&hellip; 31</a></li>--%>
                <%--<li class="page-item"><a href="#0" class="page-link">Next</a></li>--%>
                <c:if test="${pageMaker.prev}">
                    <!-- 이전 버튼은 (startPage - 1)로 이동 -->
                    <li class="page-item"><a class="page-link" href="${pageMaker.startPage - 1}">이전</a></li>
                </c:if>

                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="page-item"><a class="page-link" href="${num}">${num}</a></li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <!-- 다음 버튼은 (endPage + 1)으로 이동 -->
                    <li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1}">다음</a></li>
                </c:if>
            </ul>
        </nav>

        <form id="pageForm" action="/discuss/topics" method="get">
            <input type="hidden" id="page" name="page"
                   value="${pageMaker.criteria.page}"/>
            <input type="hidden" id="perPage" name="perPage"
                   value="${pageMaker.criteria.numsPerPage}"/>
            <input type="hidden" id="lid" name="lid" path="lid" value="${lid}"/>
            <input type="hidden" id="lname" name="lname" path="lname" value="${lname}">
            <input type="hidden" id="lcategory" name="lcategory" path="lcategory" value="${lcategory}">
        </form>

        <form class="form-inline float-lg-left d-block d-sm-flex" method="get" action="/discuss/search">
            <div class="input-group-btn search-panel">
                <select class="form-control" data-toggle="dropdown" name="searchType">
                    <option value="title">Title</option>
                    <option value="content">Content</option>
                    <option value="username">Username</option>
                </select>
            </div>
            <input type="text" class="form-control ml-1" placeholder="Search term..." name="searchKeyword">
            <input type="hidden" name="lname" value="${lname}">
            <input type="hidden" name="lcategory" value="${lcategory}">
            <input type="hidden" name="lid" value="${lid}">
            <button type="submit" class="btn btn-outline-info ml-1"><i class="fas fa-search"></i></button>
        </form>
    </div>
    <%
        if (session.getAttribute("loginResult") != null) {
            String lname = (String) request.getAttribute("lname");
            String lcategory = (String) request.getAttribute("lcategory");
            String lid = (String) request.getAttribute("lid");

            out.print("<a href=\"/discuss/newtopic?lname=" + lname +
                    "&lcategory=" + lcategory + "&lid=" + lid + "\" class=\"btn btn-lg btn-primary\">New topic</a>");
        }
    %>

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

<script>
    $(document).ready(function () {
        $('.pagination li a').click(function () {
            // <a> 태그의 기본 동작(페이지 이동)을 막아버림
            event.preventDefault();

            // 이동할 페이지
            var target = $(this).attr('href');
            $('#page').val(target);
            $('#pageForm').submit();
        });
    });
</script>

<script src="../../../resources/lib/jquery-3.3.1.min.js"></script>
<script src="../../../resources/lib/bootstrap.bundle.min.js"></script>

</body>
</html>
