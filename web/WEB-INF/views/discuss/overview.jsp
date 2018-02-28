<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2018-02-21
  Time: 오전 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"
           uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <title>Discuss-Board overview</title>

    <style type="text/css">
        .forum-col {
            min-width: 16em;
        }

        .last-post-col {
            min-width: 12em;
        }

    </style>
</head>
<body>
<%--<nav class="navbar navbar-dark bg-dark">--%>
<%--<div class="container">--%>
<%--<h1><a href="0" class="navbar-brand">Discuss board</a></h1>--%>
<%--<form class="form-inline">--%>
<%--<input type="text" class="form-control mr-3 mb-2 mb-sm-0" placeholder="Search">--%>
<%--<button type="submit" class="btn btn-primary">Search</button>--%>
<%--</form>--%>
<%--</div>--%>
<%--</nav>--%>
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
                    <th scope="col" class="forum-col">forum</th>
                    <th scope="col">topics</th>
                    <th scope="col">posts</th>
                    <th scope="col" class="last-post-col">last post</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach var="lecture" items="${lectureList}">
                    <c:choose>
                        <c:when test="${lecture.lcategory eq 'basic'}">
                            <tr>
                                <td>
                                    <h3 class="h5 mb-0"><a href="/discuss/topics?lid=${lecture.lid}&lname=${lecture.lname}&lcategory=${lecture.lcategory}"
                                                           class="text-uppercase">${lecture.lname}</a></h3>
                                    <p class="mb-0">${lecture.lexplain}</p>
                                </td>
                                <td>
                                    <div>5</div>
                                </td>
                                <td>
                                    <div>18</div>
                                </td>
                                <td>
                                    <h4 class="h6 mb-0 font-weight-bold"><a href="#0"><span id="lasttitle">not yet</span></a></h4>
                                    <div>by <a href="#0"><span id="lastwriter">author name</span></a></div>
                                    <div id="lastdate">05 apr 2017, 20:07</div>
                                </td>
                                <script>
                                    var obj = JSON.parse(${lecture.lastjson})
                                    $('#lasttitle').html(obj.title);
                                    $('#lastwriter').html(obj.writer);
                                </script>
                            </tr>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <tr>
                    <td>
                        <h3 class="h5 mb-0"><a href="#0" class="text-uppercase">forum name</a></h3>
                        <p class="mb-0">
                            ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
                    </td>
                    <td>
                        <div>5</div>
                    </td>
                    <td>
                        <div>18</div>
                    </td>
                    <td>
                        <h4 class="h6 mb-0 font-weight-bold"><a href="#0">post name</a></h4>
                        <div>by <a href="#0">author name</a></div>
                        <div>05 apr 2017, 20:07</div>
                    </td>
                </tr>
                </tbody>
            </table>

            <h2 class="h4 text-white bg-info mb-0 p-4 rounded-top mt-3">Advanced</h2>
            <table class="table table-striped table-bordered table-responsive mb-xl-0">
                <thead class="thead-light">
                <tr>
                    <th scope="col" class="forum-col">forum</th>
                    <th scope="col">topics</th>
                    <th scope="col">posts</th>
                    <th scope="col" class="last-post-col">last post</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="lecture" items="${lectureList}">
                    <c:choose>
                        <c:when test="${lecture.lcategory eq 'advanced'}">
                            <tr>
                                <td>
                                    <h3 class="h5 mb-0"><a href="/discuss/topics?lid=${lecture.lid}&lname=${lecture.lname}&lcategory=${lecture.lcategory}"
                                                           class="text-uppercase">${lecture.lname}</a></h3>
                                    <p class="mb-0">${lecture.lexplain}</p>
                                </td>
                                <td>
                                    <div>5</div>
                                </td>
                                <td>
                                    <div>18</div>
                                </td>
                                <td>
                                    <h4 class="h6 mb-0 font-weight-bold"><a href="#0">${lecture.lecturer}</a></h4>
                                    <div>by <a href="#0">author name</a></div>
                                    <div>05 apr 2017, 20:07</div>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <tr>
                    <td>
                        <h3 class="h5 mb-0"><a href="#0" class="text-uppercase">forum name</a></h3>
                        <p class="mb-0">
                            ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
                    </td>
                    <td>
                        <div>5</div>
                    </td>
                    <td>
                        <div>18</div>
                    </td>
                    <td>
                        <h4 class="h6 mb-0 font-weight-bold"><a href="#0">post name</a></h4>
                        <div>by <a href="#0">author name</a></div>
                        <div>05 apr 2017, 20:07</div>
                    </td>
                </tr>
                </tbody>
            </table>

            <h2 class="h4 text-white bg-dark mb-0 p-4 rounded-top mt-3">Superior</h2>
            <table class="table table-striped table-bordered table-responsive mb-xl-0">
                <thead class="thead-light">
                <tr>
                    <th scope="col" class="forum-col">forum</th>
                    <th scope="col">topics</th>
                    <th scope="col">posts</th>
                    <th scope="col" class="last-post-col">last post</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="lecture" items="${lectureList}">
                    <c:choose>
                        <c:when test="${lecture.lcategory eq 'superior'}">
                            <tr>
                                <td>
                                    <h3 class="h5 mb-0"><a href="/discuss/topics?lid=${lecture.lid}&lname=${lecture.lname}&lcategory=${lecture.lcategory}"
                                                           class="text-uppercase">${lecture.lname}</a></h3>
                                    <p class="mb-0">${lecture.lexplain}</p>
                                </td>
                                <td>
                                    <div>5</div>
                                </td>
                                <td>
                                    <div>18</div>
                                </td>
                                <td>
                                    <h4 class="h6 mb-0 font-weight-bold"><a href="#0">${lecture.lecturer}</a></h4>
                                    <div>by <a href="#0">${lecture.lastjson}</a></div>
                                    <div>05 apr 2017, 20:07</div>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <tr>
                    <td>
                        <h3 class="h5 mb-0"><a href="#0" class="text-uppercase">forum name</a></h3>
                        <p class="mb-0">
                            ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
                    </td>
                    <td>
                        <div>5</div>
                    </td>
                    <td>
                        <div>18</div>
                    </td>
                    <td>
                        <h4 class="h6 mb-0 font-weight-bold"><a href="#0">post name</a></h4>
                        <div>by <a href="#0">author name</a></div>
                        <div>05 apr 2017, 20:07</div>
                    </td>
                </tr>
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
                                <h2 class="h4 card-title">members online</h2>
                                <ul class="list-unstyled mb-0">
                                    <li><a href="#0">forum member name</a></li>
                                    <li><a href="#0">forum member name</a></li>
                                    <li><a href="#0">forum member name</a></li>
                                    <li><a href="#0">forum member name</a></li>
                                    <li><a href="#0">forum member name</a></li>
                                    <li><a href="#0">forum member name</a></li>
                                    <li><a href="#0">forum member name</a></li>
                                </ul>
                            </div>
                            <div class="card-footer">
                                <dl class="row mb-0">
                                    <dt class="col-8">total:</dt>
                                    <dt class="col-4 mb-0">10</dt>
                                </dl>
                                <dl class="row mb-0">
                                    <dt class="col-8">total:</dt>
                                    <dt class="col-4 mb-0">7</dt>
                                </dl>
                                <dl class="row mb-0">
                                    <dt class="col-8">total:</dt>
                                    <dt class="col-4 mb-0">3</dt>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-xl-12">
                        <div class="card">
                            <div class="card-body">
                                <h2 class="h4 card-title">forum statistics</h2>
                                <dl class="row mb-0">
                                    <dt class="col-8">total forums:</dt>
                                    <dt class="col-4 mb-0">15</dt>
                                </dl>
                                <dl class="row mb-0">
                                    <dt class="col-8">total topics:</dt>
                                    <dt class="col-4 mb-0">1927</dt>
                                </dl>
                                <dl class="row mb-0">
                                    <dt class="col-8">total members:</dt>
                                    <dt class="col-4 mb-0">581</dt>
                                </dl>
                            </div>
                            <div class="card-footer">
                                <div>newset member:</div>
                                <div><a href="#0">forum member name</a></div>
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

<script>
    $(document).ready(function () {

        var obj = JSON.parse(${})

    });
</script>

<script src="../../../resources/lib/jquery-3.3.1.min.js"></script>
<script src="../../../resources/lib/bootstrap.bundle.min.js"></script>

</body>
</html>
