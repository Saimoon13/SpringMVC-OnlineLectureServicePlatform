<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2018-02-01
  Time: 오후 2:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>

    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>

    <script defer src="../../resources/fontawesome-all.js"></script>
    <link rel="stylesheet" href="../../resources/CSS/main.css?ver=5" type="text/css" media="screen" title="no title"
          charset="utf-8"/>

</head>
<body>

<!-- 머리글 -->
<header>
    <%--<%@ include file="subPage/header.jsp" %>--%>
    <jsp:include page="subPage/header.jsp">
        <jsp:param name="before" value="null"></jsp:param>
    </jsp:include>
</header>

<!-- carousel -->
<div class="startcarousel">

    <div id="demo" class="carousel slide" data-ride="carousel">

        <!-- Indicators -->
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>


        <!-- The slideshow -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../../resources/image/c++.jpg" alt="C++">
                <div class="carousel-caption">
                    <h3>Gang dongwon</h3>
                    <p>New C++ Lecutre Release!</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="../../resources/image/HTMLNew%20release.jpg" alt="HTML">
                <div class="carousel-caption">
                    <h3>Won bin</h3>
                    <p>New HTML Lecture Release!</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="../../resources/image/Bootstrap%20NewRelease.jpg" alt="Bootstrap">
                <div class="carousel-caption">
                    <h3>Namukkun</h3>
                    <p>New BOOTSTRAP Lecture Release!</p>
                </div>
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>

    </div>
    <!-- carousel -->
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">
            <div class="container">
                <div class="card">
                    <img class="card-img-top" src="../../resources/image/Main/basic.png">
                </div>
                <br>
            </div>
        </div> <!-- end col -->

        <div class="col-md-4">
            <div class="container">
                <div class="card">
                    <img class="card-img-top" src="../../resources/image/Main/advanced.png">
                </div>
            </div>
        </div> <!-- end col -->

        <div class="col-md-4">
            <div class="container">
                <div class="card">
                    <img class="card-img-top" src="../../resources/image/Main/superior.png">
                </div>
            </div>
        </div> <!-- end col -->

    </div> <!-- end cols -->
</div>

<jsp:include page="subPage/footer.jsp"/>

</body>
</html>
