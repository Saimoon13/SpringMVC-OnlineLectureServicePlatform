<%@ page import="domain.Member" %><%--
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
    <link rel="stylesheet" href="../../resources/CSS/header.css?ver=6" type="text/css" media="screen" title="no title"
          charset="utf-8"/>
</head>
<body class="pt-5">

<!-- Login modal -->
<div class="modal fade" id="loginModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title text-center">Login</h4>
            </div>

            <!-- Modal body -->
            <form action="/login" method="post" id="login">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="uid" class="cols-sm-2 control-label">Your ID</label>
                        <div class="input-group mb-3">
                                        <span class="input-group-text"><i class="fas fas fa-user"
                                                                          aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="userid" id="uid" path="userid"
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
                                       path="password" placeholder="Enter your Password"/>
                            </div>
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <p class="mt-3 mr-3"><span id="loginForm">Please Fill the blank</span></p>
                        <button type="button" class="btn btn-primary" data-dismiss="modal"
                                id="loginConfirm">Login
                        </button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Register modal -->
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

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div id="app" class="container">
        <a class="navbar-brand" href="/">Naming</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <%
            String criterion = null;
            criterion = request.getParameter("before");

            System.out.println(criterion+"criterion");
        %>
        <div id="navbarNavDropdown" class="navbar-collapse collapse">
            <ul class="navbar-nav mr-auto">
                    <%
                        if (criterion.equals("second")) {
                            out.print("<li class=\"nav-item active\">");
                        } else {
                            out.print("<li class=\"nav-item\">");
                        }
                    %>
                    <a class="nav-link" href="/lecture/">Lecture</a>
                </li>
                    <%
                        if (criterion.equals("third")) {
                            out.print("<li class=\"nav-item active\">");
                        } else {
                            out.print("<li class=\"nav-item\">");
                        }
                    %>
                    <a class="nav-link" href="/discuss/">Discuss</a>
                </li>
            </ul>

            <ul class="navbar-nav" id="alignneeded">
                <!-- Login -->
                <%
                    Member member = (Member) session.getAttribute("loginResult");
                    if(member == null) {
                        out.print("<li class=\"nav-item nav-item-login\">\n" +
                                "<a class=\"nav-link\" data-dismiss=\"modal\" data-toggle=\"modal\" data-target=\"#loginModal\"\n" +
                                "href=\"#loginModal\"><i class=\"fas fa-sign-in-alt\"></i> Login</a>\n" +
                                "</li>");
                    } else {
                        out.print("<li class=\"nav-item nav-item-register\">\n" +
                                "<a id=\"useridResult\" class=\"nav-link\"nav-item\">" +
                                "Welcome! " + member.getUserid() +"</a>\n" +
                                "</li>");
                    }
                %>

                <!-- Register -->
                <%
                    if(member == null) {
                        out.print("<li class=\"nav-item\">\n" +
                                "<a class=\"nav-link\" data-dismiss=\"modal\" data-toggle=\"modal\" data-target=\"#regiModal\"\n" +
                                "href=\"#regiModal\">\n" +
                                "<i class=\"fas far fa-user\"></i> Register</a>\n" +
                                "</li>");
                    } else {
                        out.print("<li class=\"nav-item\">\n" +
                                "<a class=\"nav-link\" href=\"/logout/\">\n" +
                                "<i class=\"fas fa-sign-out-alt\"></i> Logout</a>\n" +
                                "</li>");
                    }
                %>
            </ul>
        </div>
    </div>
</nav>

<script>
    $(document).ready(function () {
        var userid = $('#useridResult').html();
        console.log(userid);
        if(userid !== undefined){
            userid = userid.replace("Welcome! ","");
            var socket = new WebSocket("ws://localhost:8282/webSocketServer");
            socket.onopen = function (event) {
                var message = {
                    type: 0,
                    username: userid
                };
                socket.send(JSON.stringify(message));
                console.log(userid + " : header Message");
            }
        }
        var signupConfirm = $('#loginConfirm'),
            uid = $('#uid'),
            upw = $('#upw');

        signupConfirm.click(function () {
            if (uid.val() === '' || upw.val() === '') {
                $('#loginForm').html('Fill the all blanks');
                return false;
            } else {
                $('#loginForm').html('sdffffffffffffffffffffffffffff');
                document.getElementById("login").submit();

            }
        })

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
