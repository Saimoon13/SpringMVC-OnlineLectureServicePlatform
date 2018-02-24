<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2018-02-08
  Time: 오전 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>


    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>

    <script defer src="../../resources/fontawesome-all.js"></script>
    <link rel="stylesheet" href="../../resources/CSS/header.css?d" type="text/css" media="screen" title="no title"
          charset="utf-8"/>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div id="app" class="container">
        <a class="navbar-brand" href="/">Naming</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div id="navbarNavDropdown" class="navbar-collapse collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/board/list">Board</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/lecture//">Lecture</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/discuss/" target="_blank">Discuss</a>
                </li>
            </ul>

            <ul class="navbar-nav" id="alignneeded">
                <!-- 로그인 -->
                <li class="nav-item">
                    <a class="nav-link" data-dismiss="modal" data-toggle="modal" data-target="#loginModal"
                       href="#loginModal"><i class="fas fa-sign-in-alt"></i> Login</a>
                </li>
                <!-- 로그인 모달-->
                <div class="modal fade" id="loginModal">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title text-center">Login</h4>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="uid" class="cols-sm-2 control-label">Your ID</label>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text"><i class="fas fas fa-user"
                                                                          aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="name" id="uid"
                                               placeholder="Enter your Name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="upw" class="cols-sm-2 control-label">Password</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text"><i class="fa fa-lock fa-lg"
                                                                              aria-hidden="true"></i></span>
                                            <input type="password" class="form-control" name="password" id="upw"
                                                   placeholder="Enter your Password"/>
                                        </div>
                                    </div>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">Login</button>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- 회원가입 -->
                <li class="nav-item">
                    <a class="nav-link" data-dismiss="modal" data-toggle="modal" data-target="#regiModal"
                       href="#regiModal">
                        <i class="fas far fa-user"></i> Register</a>
                </li>
                <!-- 회원가입 모달 -->
                <div class="modal fade" id="regiModal">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title text-center">Registration</h4>
                            </div>
                            <form action="/signup" method="POST" id="signup">
                                <!-- Modal body -->
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="id" class="cols-sm-2 control-label">Your ID</label>
                                        <div class="input-group mb-3">
                                        <span class="input-group-text"><i class="fas fas fa-user"
                                                                          aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="userid" id="id" path="userid"
                                                   placeholder="Enter your Name"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="pw" class="cols-sm-2 control-label">Password</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group mb-3">
                                            <span class="input-group-text"><i class="fa fa-lock fa-lg"
                                                                              aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" name="password" id="pw"
                                                       path="password" placeholder="Enter your Password"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="repw" class="cols-sm-2 control-label">Confirm Password</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group mb-3">
                                            <span class="input-group-text"><i class="fa fa-lock fa-lg"
                                                                              aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" name="confirm" id="repw"
                                                       placeholder="Confirm your Password"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="cols-sm-2 control-label">Your Email</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group mb-3">
                                            <span class="input-group-text"><i class="fa fa-envelope fa"
                                                                              aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="email" id="email"
                                                       path="email" placeholder="Enter your Email"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <p class="mt-3 mr-3"><span id="signupForm">ddddddddddddddddddd</span></p>
                                    <input type="submit" class="btn btn-primary" data-dismiss="modal"
                                            id="signupConfirm" value="Register">
                                    </input>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-search"></i>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <%--<a class="dropdown-item" href="#">Action</a>--%>
                        <%--<a class="dropdown-item" href="#">Another action</a>--%>
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for...">
                            <span class="input-group-btn">
                                <button class="btn btn-secondary" type="button">Go!</button>
                                </span>
                        </div>

                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

<script>

    $(document).ready(function () {

//        로그인

//        회원가입

        var idCheck = /^[a-z]+[a-z0-9]{5,19}$/; // 영문시작 6~20자 or 숫자
        var pwCheck = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/; // 8자 이상, 최소 문자1 숫자1
        var emCheck = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; // 이메일

        var signupConfirm = $('#signupConfirm'),
            id = $('#id'),
            pw = $('#pw'),
            repw = $('#repw'),
            email = $('#email');

        signupConfirm.click(function () {
            if (id.val() === '' || pw.val() === '' || email.val() === '') {
                $('#signupForm').html('Fill the all blanks');
                return false;
            } else {
                if (idCheck.test(id.val()) !== true) {
                    $('#signupForm').html('ID has to be more than 6 words');
                    id.focus();
                    return false;
                } else if (pwCheck.test(pw.val()) !== true) {
                    $('#signupForm').html('The password has to be more than 8 words including at least one number');
                    pw.focus();
                    return false;
                } else if (repw.val() !== pw.val()) {
                    $('#signupForm').html('The passwords are not the same.');
//                    pw.empty();
//                    repw.empty();
                    repw.focus();
                    return false;
                } else if (emCheck.test(email.val()) !== true) {
                    $('#signupForm').html('Fill a valid email');
                    email.focus();
                    return false;
                }
            }
            document.getElementById("signup").submit();
        })

    });

</script>

</body>
</html>
