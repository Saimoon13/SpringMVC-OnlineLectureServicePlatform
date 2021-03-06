<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="../../../resources/CSS/discuss-overview.css?df" type="text/css" media="screen"
          title="no title"
          charset="utf-8"/>

    <title>Forum - Create new topic</title>

</head>
<body>
<header>
    <jsp:include page="../subPage/header.jsp">
        <jsp:param name="before" value="third"></jsp:param>
    </jsp:include>
</header>

<div class="container my-3">
    <nav class="breadcrumb">
        <a href="/discuss/" class="breadcrumb-item">Discuss</a>
        <a href="/discuss/topics?lid=${lid}&lname=${lname}&lcategory=${lcategory}" class="breadcrumb-item">${lname}</a>
        <c:choose>
            <c:when test="${empty topic.title}">
                <span class="breadcrumb-item active">${lname} New Topic</span>
            </c:when>
            <c:when test="${not empty topic.title}">
                <a href="/discuss/detail?tnumber=${topic.tnumber}&lname=${lname}&lcategory=${lcategory}&lid=${lid}" class="breadcrumb-item">${topic.title}</a>
                <span class="breadcrumb-item active">Update</span>
            </c:when>
            <c:otherwise>
                <span class="breadcrumb-item active">Unkown Error</span>
            </c:otherwise>
        </c:choose>
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
        </div>
    </div>
<c:choose>
    <c:when test="${empty topic.title}">
    <form class="mb-3" action="/discuss/post?lid=${lid}&lname=${lname}&lcategory=${lcategory}" method="post" >
        <div class="form-group">
            <label for="topic">Topic:</label>
            <input type="text" class="form-control" name="title" path="title"
                   id="topic" placeholder="Give your topic a title." value="${topic.title}" required>
        </div>
        <div class="form-group">
            <label for="comment">Comment:</label>
            <textarea class="form-control"  name="tcontent" path="tcontent"
                      id="comment" rows="10" placeholder="Write your comment here" required>${topic.tcontent}</textarea>
        </div>
        <button type="submit" class="btn btn-primary">Create topic</button>
        <button type="reset" class="btn btn-danger">Reset</button>
    </form>
    </c:when>
    <c:when test="${not empty topic.title}">
        <form class="mb-3" action="/discuss/updateconfirm?lid=${lid}&lname=${lname}&lcategory=${lcategory}&tnumber=${topic.tnumber}" method="post">
            <div class="form-group">
                <label for="topic">Topic:</label>
                <input type="text" class="form-control" name="title" path="title" value="${topic.title}"
                       placeholder="Give your topic a title." required>
            </div>
            <div class="form-group">
                <label for="comment">Comment:</label>
                <textarea class="form-control"  name="tcontent" path="tcontent"
                          rows="10" placeholder="Write your comment here" required>${topic.tcontent}</textarea>
            </div>
            <div class="form-check">
                <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" value="notification">
                    Notify me upon replies.
                </label>
            </div>
            <button type="submit" class="btn btn-primary">Update topic</button>
            <button type="reset" class="btn btn-danger">Reset</button>
        </form>
    </c:when>
    <c:otherwise>
        Unkown Error
    </c:otherwise>
</c:choose>
</div>

<jsp:include page="../subPage/footer.jsp"/>

<script src="../../../resources/lib/jquery-3.3.1.min.js"></script>>
<script src="../../../resources/lib/bootstrap.bundle.min.js"></script>

</body>
</html>
