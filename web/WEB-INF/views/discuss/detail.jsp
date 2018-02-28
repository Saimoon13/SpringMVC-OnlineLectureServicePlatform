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
                    <th scope="col" class="created-col" style="width: 75%;">Message</th>
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
                    <th scope="col" class="topic-col">Author</th>
                    <th scope="col" class="created-col">Message</th>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <td class="author-col">
                        <div>by <a href="#0">Author name</a></div>
                    </td>
                    <td class="post-col d-lg-flex justify-content-lg-between">
                        <div><span class="font-weight-bold">Post subject:</span>forum post title with a complex and long
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
                        <p>ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
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
    <form class="mb-3">
        <div class="form-group">
            <label for="comment">Reply to this post:</label>
            <textarea class="form-control" id="comment" rows="10" placeholder="Write your comment here"
                      required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Reply</button>
        <button type="reset" class="btn btn-danger">Reset</button>
    </form>

    <div>
        <div class="d-lg-flex align-items-lg-center mb-3">
            <form class="form-inline d-block d-sm-flex mr-2 mb-3 mb-lg-0">
                <div class="form-group mr-2 mb-3 mb-md-0">
                    <label for="email" class="mr-2">Email:</label>
                    <input type="email" class="form-control" placeholder="Example@email.com" id="email" required>
                </div>
                <div class="form-group mr-2">
                    <label for="password" class="mr-2">Password:</label>
                    <input type="password" class="form-control" id="password" required>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
            <span class="mr-2">or ...</span>
            <a href="#0" class="btn btn-success">Create account</a>
        </div>
        <p class="small"><a href="#0">Have you forgotten your account details?</a></p>
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

</body>
</html>
