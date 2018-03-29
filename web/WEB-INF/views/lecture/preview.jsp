<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="../../../resources/lib/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>

    <script defer src="../../resources/fontawesome-all.js"></script>

</head>
<body>

<header>
    <jsp:include page="../subPage/header.jsp">
        <jsp:param name="before" value="second"></jsp:param>
    </jsp:include>
</header>

<h2 class="text-center mb-half blue mt-5 text-primary">Imagine your future!</h2>
<h2 class="text-center mb-3 light text-muted">What do you want to learn today? What's your dream job?</h2>
<h5 class="text-center mb-3">I want to get...</h5>

<ul class="nav justify-content-center">
    <li class="nav-item itemli basicclass">
        <a class="nav-link active" href="javascript:void(0);" onclick="fnMove('basic')">Basic</a>
    </li>
    <li class="nav-item itemli advancedclass">
        <a class="nav-link active" href="javascript:void(0);" onclick="fnMove('advanced')">Advanced</a>
    </li>
    <li class="nav-item itemli superiorclass">
        <a class="nav-link active" href="javascript:void(0);" onclick="fnMove('superior')">Superior</a>
    </li>
</ul>

<div class="container-fluid my-5">
    <div class="row text-center text-lg-left">
        <h5 class="col-lg-12 col-md-12 col-12 text-center mt-5 mb-3 light itemli-basic">Basic</h5>
        <c:forEach var="lecture" items="${lectureList}">
            <c:choose>
                <c:when test="${lecture.lcategory eq 'Basic'}">
                    <div class="col-lg-3 col-md-4 col-6 initiateModal basicclassBox">
                        <a data-toggle="modal" data-target="#lmodal" href="#lmodal" class="d-block mb-4 ">
                            <img class="img-fluid img-thumbnail sub-imagepath" src=${lecture.imagepath}>
                        </a>
                        <p hidden class="sub-lecturer">${lecture.lecturer}</p>
                        <p hidden class="sub-lid">${lecture.lid}</p>
                        <p hidden class="sub-lname">${lecture.lname}</p>
                        <p hidden class="sub-lexplain">${lecture.lexplain}</p>
                        <p hidden class="sub-lcategory">${lecture.lcategory}</p>
                    </div>
                </c:when>
            </c:choose>
        </c:forEach>

        <h5 class="col-lg-12 col-md-12 col-12 text-center mt-5 mb-3 light itemli-advanced">Advanced</h5>
        <c:forEach var="lecture" items="${lectureList}">
            <c:choose>
                <c:when test="${lecture.lcategory eq 'Advanced'}">
                    <div class="col-lg-3 col-md-4 col-6 initiateModal">
                        <a data-toggle="modal" data-target="#lmodal" href="#lmodal" class="d-block mb-4 ">
                            <img class="img-fluid img-thumbnail sub-imagepath" src=${lecture.imagepath}>
                        </a>
                        <p hidden class="sub-lecturer">${lecture.lecturer}</p>
                        <p hidden class="sub-lid">${lecture.lid}</p>
                        <p hidden class="sub-lname">${lecture.lname}</p>
                        <p hidden class="sub-lexplain">${lecture.lexplain}</p>
                        <p hidden class="sub-lcategory">${lecture.lcategory}</p>
                    </div>
                </c:when>
            </c:choose>
        </c:forEach>

        <h5 class="col-lg-12 col-md-12 col-12 text-center mt-5 mb-3 light itemli-superior">Superior</h5>
        <c:forEach var="lecture" items="${lectureList}">
            <c:choose>
                <c:when test="${lecture.lcategory eq 'Superior'}">
                    <div class="col-lg-3 col-md-4 col-6 initiateModal superiorclassBox">
                        <a data-toggle="modal" data-target="#lmodal" href="#lmodal" class="d-block mb-4">
                            <img class="img-fluid img-thumbnail sub-imagepath" src=${lecture.imagepath}>
                        </a>
                        <p hidden class="sub-lecturer">${lecture.lecturer}</p>
                        <p hidden class="sub-lid">${lecture.lid}</p>
                        <p hidden class="sub-lname">${lecture.lname}</p>
                        <p hidden class="sub-lexplain">${lecture.lexplain}</p>
                        <p hidden class="sub-lcategory">${lecture.lcategory}</p>
                    </div>
                </c:when>
            </c:choose>
        </c:forEach>

    </div>
</div>

<div class="modal fade" id="lmodal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header d-inline mb-auto">
                <h4 class="modal-title text-center">Card Image</h4>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="container align-content-center">
                    <div class="row">
                        <div class="card col-lg-12 col-md-12 col-12 detailmodal" style="width:400px">
                            <img class="card-img-top mt-3" src="http://placehold.it/400x300" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">John Doe</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and
                                    engineer</p>
                                <a href="#" class="btn btn-primary enroll">Enroll</a>
                                <a href="#" class="btn btn-primary mr-auto goDiscuss">Discuss</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    function fnMove(seq){
        var offset = $(".itemli-" + seq).offset();
        $('html, body').animate({scrollTop : offset.top-70}, 400);
    }

    if('${index}' !== ""){
        fnMove('${index}');
    }

    $(document).ready(function () {
        var initiateModal = $('.initiateModal');
        var detailmodal = $('.detailmodal');

        initiateModal.on('click', function () {
            var headmodal = $(this).children('.sub-lcategory').html();
            var imagepath = $(this).find('img').attr('src');
            var lecturer = $(this).children('.sub-lecturer').html();
            var lid = $(this).children('.sub-lid').html();
            var lname = $(this).children('.sub-lname').html();
            var lexplain = $(this).children('.sub-lexplain').html();

            $('.modal-header').children('h4').html(headmodal);
            detailmodal.find('img').attr('src', imagepath);
            detailmodal.find('h4').html(lname + ' by ' + lecturer);
            detailmodal.find('p').html(lexplain);
            detailmodal.find('.enroll').attr('href', '/lecture/detail?lid=' + lid);
            detailmodal.find('.goDiscuss').attr('href','/discuss/topics?lid='+lid + '&lname=' + lname + '&lcategory=' + headmodal.toLowerCase());
        });
    })
</script>

</body>
</html>
