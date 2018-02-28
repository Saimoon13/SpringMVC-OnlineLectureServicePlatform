<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2018-02-24
  Time: 오전 11:40
  To change this template use File | Settings | File Templates.
--%>
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
    <%--<%@ include file="../subPage/header.jsp" %>--%>
        <jsp:include page="../subPage/header.jsp">
            <jsp:param name="before" value="second"></jsp:param>
        </jsp:include>
</header>



<h2 class="text-center mb-half blue">Imagine your future!</h2>
<h5 class="text-center mb-1 light">What do you want to learn today? What's your dream job?</h5>
<h5 class="text-center mb-1">I want to...</h5>

<div class="container-fluid my-5">
    <div class="row text-center text-lg-left">

        <div class="col-lg-3 col-md-4 col-6">
            <a data-toggle="modal" data-target="#b1Modal" href="#b1Modal" class="d-block mb-4">
                <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4">
                <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4">
                <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4">
                <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
            </a>
        </div>
        <h5 class="col-lg-12 col-md-12 col-12 text-center mb-1 light">What do you want to learn today? What's your dream
            job?</h5>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4">
                <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4">
                <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4">
                <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4">
                <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
            </a>
        </div>
        <h5 class="col-lg-12 col-md-12 col-12 text-center mb-1 light">What do you want to learn today? What's your dream
            job?</h5>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4">
                <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4">
                <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4">
                <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4">
                <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
            </a>
        </div>
    </div>
</div>

<div class="modal fade" id="b1Modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header d-inline mb-auto">
                <h4 class="modal-title text-center">Card Image</h4>
                <p>Image at the top (card-img-top):</p>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="container align-content-center">
                    <div class="row">
                        <div class="card col-lg-12 col-md-12 col-12" style="width:400px">
                            <img class="card-img-top mt-3" src="http://placehold.it/400x300" alt="Card image"
                                 style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title">John Doe</h4>
                                <p class="card-text">Some example text some example text. John Doe is an architect and
                                    engineer</p>
                                <a href="/lecture/detail" class="btn btn-primary">See Profile</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<footer>
    <jsp:include page="../subPage/footer.jsp"></jsp:include>
</footer>

</body>
</html>
