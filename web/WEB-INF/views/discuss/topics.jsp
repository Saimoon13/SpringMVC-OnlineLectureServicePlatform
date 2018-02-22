<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2018-02-21
  Time: 오전 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<nav class="navbar navbar-dark bg-dark">
    <div class="container">
        <h1><a href="0" class="navbar-brand">Discuss board</a></h1>
        <form class="form-inline">
            <input type="text" class="form-control mr-3 mb-2 mb-sm-0" placeholder="Search">
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </div>
</nav>

<%--my margin top and bottom--%>
<div class="container my-3">
    <nav class="breadcrumb">
        <a href="#0" class="breadcrumb-item">Board index</a>
        <a href="#0" class="breadcrumb-item">Forum category</a>
        <span class="breadcrumb-item active">Forum name</span>
    </nav>
    <div class="row">
        <div class="col-12">
            <h2 class="h4 text-white bg-info mb-0 p-4 rounded-top">forum name</h2>
            <table class="table table-striped table-bordered table-responsive-lg">
                <thead class="thead-light">
                <tr>
                    <th scope="col" class="topic-col">Topic</th>
                    <th scope="col" class="created-col">Created</th>
                    <th scope="col">Statistics</th>
                    <th scope="col" class="last-post-col">last post</th>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <td>
                        <h3 class="h6"><span class="badge badge-primary">7 unread</span> <a href="#0"
                                                                                            class="text-uppercase">forum
                            post title with a complex and long question</a></h3>
                        <div class="small">Go to page: <a href="#0">1</a>, <a href="#0">2</a>, <a href="#0">3</a>
                            &hellip;
                            <a href="#0">7</a>, <a href="#0">8</a>, <a href="#0">9</a></div>
                    </td>
                    <td>
                        <div>by <a href="#0">Author name</a></div>
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
                <tr>
                    <td>
                        <h3 class="h6"><span class="badge badge-primary">7 unread</span> <a href="#0"
                                                                                            class="text-uppercase">forum
                            post title with a complex and long question</a></h3>
                        <div class="small">Go to page: <a href="#0">1</a>, <a href="#0">2</a>, <a href="#0">3</a>
                            &hellip;
                            <a href="#0">7</a>, <a href="#0">8</a>, <a href="#0">9</a></div>
                    </td>
                    <td>
                        <div>by <a href="#0">Author name</a></div>
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
                <tr>
                    <td>
                        <h3 class="h6"><span class="badge badge-primary">7 unread</span> <a href="#0"
                                                                                            class="text-uppercase">forum
                            post title with a complex and long question</a></h3>
                        <div class="small">Go to page: <a href="#0">1</a>, <a href="#0">2</a>, <a href="#0">3</a>
                            &hellip;
                            <a href="#0">7</a>, <a href="#0">8</a>, <a href="#0">9</a></div>
                    </td>
                    <td>
                        <div>by <a href="#0">Author name</a></div>
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
                <tr>
                    <td>
                        <h3 class="h6 mb-0"><a href="#0">Forum name title with a complex and long question</a></h3>
                    </td>
                    <td>
                        <div>by <a href="#0">Author name</a></div>
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
        <form class="form-inline float-lg-left d-block d-sm-flex">
            <div class="mb-2 mb-sm-0 mr-2">Display posts from previous:</div>
            <div class="form-group mr-2">
                <label class="sr-only" for="select-time">Time period</label>
                <select class="form-control form-control-sm" id="select-time">
                    <option value="all-posts" selected>All posts</option>
                    <option value="dat">1 day</option>
                    <option value="dat">1 week</option>
                    <option value="dat">1 month</option>
                    <option value="dat">1 year</option>
                </select>
            </div>
            <div class="mb-2 mb-sm-0 mr-2">Sort by:</div>
            <div class="form-group mr-2">
                <label class="sr-only" for="select-time">Sort by</label>
                <select class="form-control form-control-sm" id="select-sort">
                    <option value="author">All posts</option>
                    <option value="post-time" selected>Post time</option>
                    <option value="replies">1 Replies</option>
                    <option value="subject">Subject</option>
                    <option value="dat">Views</option>
                </select>
            </div>
            <div class="form-group mr-2">
                <label class="sr-only" for="select-time">Sort dircetion</label>
                <select class="form-control form-control-sm" id="select-direction">
                    <option value="ascending">Ascending</option>
                    <option value="descending" selected>Descending</option>
                </select>
            </div>
            <button type="submit" class="btn btn-sm btn-primary">Go</button>
        </form>
    </div>
    <a href="#0" class="btn btn-lg btn-primary">New topic</a>
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

<script src="../../../resources/lib/jquery-3.3.1.slim.js"></script>
<script src="../../../resources/lib/bootstrap.bundle.min.js"></script>

</body>
</html>