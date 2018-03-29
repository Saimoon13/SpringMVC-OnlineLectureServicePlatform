<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../../resources/lib/bootstrap.min.css">
    <link rel="stylesheet" href="../../../resources/CSS/lecture.css?l">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Untitled Document</title>

    <script src="../../../resources/lib/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
            integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
            integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
            crossorigin="anonymous"></script>

</head>

<header>
    <jsp:include page="../subPage/header.jsp">
        <jsp:param name="before" value="second"></jsp:param>
    </jsp:include>
</header>

<body>
<div id="wrapper">

    <!-- Sidebar -->
    <div id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <li class="sidebar-brand">
                <a href="#" class="bg-primary">
                    ${lectureList.get(0).lname}
                </a>
            </li>

            <c:forEach var="lecture" items="${lectureList}">
                <li class="sublecture">
                    <a href="#">${lecture.lindex}. ${lecture.subname}</a>
                    <p hidden class="sub-lecturer">${lecture.lecturer}</p>
                    <p hidden class="sub-adress">${lecture.adress}</p>
                    <p hidden class="sub-explain">${lecture.lexplain}</p>
                    <p hidden class="sub-index">${lecture.lindex}</p>
                    <p hidden class="sub-subname">${lecture.subname}</p>
                </li>
            </c:forEach>
        </ul>
    </div>

    <div id="page-content-wrapper">
        <div class="container-fluid">
            <a href="#menu-toggle" class="btn btn-secondary mb-3" id="menu-toggle"><i class="fas fa-align-justify"></i></a>
            <div class="videowrapper">
                <iframe width="420" height="315" id="youtubesrc" src="https://www.youtube.com/embed/OGFgdro160I"
                        allowfullscreen></iframe>
            </div>
            <h1 id="stringCombined">Simple Sidebar</h1>
            <p id="lexpain">This template has a responsive menu toggling system. The menu will appear collapsed on
                smaller screens,
                and will appear non-collapsed on larger screens. When toggled using the button below, the menu will
                appear/disappear. On small screens, the page content will be pushed off canvas.</p>
            <p>Make sure to keep all page content within the <code>#page-content-wrapper</code>.</p>

        </div>
    </div>

</div>

<%--<jsp:include page="../subPage/footer.jsp"/>--%>

<script>
    $(document).ready(function () {

        $("#wrapper").toggleClass("toggled");

        <!-- Menu Toggle Script -->
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        })

        $('#test').html($(window).width());

        function checkWidth() {
            var windowsize = $(window).width();
            if (windowsize > 700) {
                $("#wrapper").addClass("toggled");
            } else if (windowsize < 701) {
                $("#wrapper").removeClass("toggled");
            }
        }
        $(window).resize(checkWidth);

        $('.sublecture').on('click', function () {
            var lecturer = $(this).children('.sub-lecturer').html();
            var adress = $(this).children('.sub-adress').html();
            var explain = $(this).children('.sub-explain').html();
            var index = $(this).children('.sub-index').html();
            var subname = $(this).children('.sub-subname').html();

            var stringCombined = "Lecture " + index + " - " + subname + " by " + lecturer;

            $('#youtubesrc').attr('src', adress);
            $('#stringCombined').html(stringCombined);
            $('#lexpain').html(explain);
        })
    });
</script>


</body>
</html>