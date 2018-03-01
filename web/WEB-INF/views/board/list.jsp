<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"
           uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Insert title here</title>

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

    <style>
        .pagination li {
            display: inline-block;
        }
    </style>

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
    <link rel="stylesheet" type="text/css" href="../../../resources/CSS/list.css">
</head>
<body>

<!-- 머리글 -->
<header>
    <jsp:include page="../subPage/header.jsp">
        <jsp:param name="before" value="first"></jsp:param>
    </jsp:include>
</header>

<div class="container my-3">
    <h1>게시판 메인 페이지</h1>

    <ul>
        <li><a href="register">새 글 작성</a></li>
    </ul>

    <hr/>
    <div class="row">
        <div class="col-12">
            <table class="table table-hover table-striped table-bordered table-responsive-es">
                <thead class="thead table-primary">
                <tr>
                    <th scope="col" class="w-10">글번호</th>
                    <th scope="col" class="w-65">제목</th>
                    <th scope="col" class="w-15">작성자</th>
                    <th scope="col" class="w-10">수정시간</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="board" items="${boardList}">
                    <tr>
                        <td>${board.bno}</td>
                        <td>
                            <a href="detail?bno=${board.bno}">${board.title}</a>
                        </td>
                        <td>${board.userid}</td>
                        <td>
                            <fmt:formatDate var="replydate"
                                            value="${board.replydate}"
                                            pattern="yyyy/MM/dd HH:mm:ss"/>
                                ${replydate}
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 input-group">
                    <div class="row-fluid">
                        <form class="form-inline mb-3" action="search" method="get">
                            <div class="row pl-3">
                            <select class="form-control custom-select mr-1 col-5" name="searchType">
                                <option value="1">작성자</option>
                                <option value="2">제목</option>
                                <option value="3">제목 + 내용</option>
                            </select>
                            <input class="form-control col-6" type="text" name="searchKeyword" placeholder="Keyword"/>
                            </div>
                            <%--<input type="submit" class="btn btn-primary" value="Search"/>--%>
                            <%--<input type="text" class="form-group form-control"--%>
                            <%--aria-label="Text input with segmented dropdown button">--%>
                        </form>
                    </div>
                </div>
                <div class="col-md-6">
                    <nav aria-label="Navigate post pages" class="float-lg-right">
                        <ul class="pagination pagination-sm mb-lg-0">
                            <c:if test="${pageMaker.prev}">
                                <!-- 이전 버튼은 (startPage - 1)로 이동 -->
                                <li class="page-item"><a class="page-link" href="${pageMaker.startPage - 1}">이전</a></li>
                            </c:if>

                            <c:forEach var="num"
                                       begin="${pageMaker.startPage}"
                                       end="${pageMaker.endPage}">
                                <li class="page-item"><a class="page-link" href="${num}">${num}</a></li>
                            </c:forEach>

                            <c:if test="${pageMaker.next}">
                                <!-- 다음 버튼은 (endPage + 1)으로 이동 -->
                                <li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1}">다음</a></li>
                            </c:if>
                        </ul>
                    </nav>
                    <form id="pageForm" action="list" method="get">
                        <input type="hidden" id="page" name="page"
                               value="${pageMaker.criteria.page}"/>
                        <input type="hidden" id="perPage" name="perPage"
                               value="${pageMaker.criteria.numsPerPage}"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 꼬리글 -->
<footer>
    <jsp:include page="../subPage/footer.jsp"></jsp:include>
</footer>

<script>
    $(document).ready(function () {
        $('.pagination li a').click(function () {
            // <a> 태그의 기본 동작(페이지 이동)을 막아버림
            event.preventDefault();

            // 이동할 페이지
            var target = $(this).attr('href');
            $('#page').val(target);
            $('#pageForm').submit();
        });
    });
</script>


<script src="../../../resources/lib/bootstrap.bundle.min.js"></script>


</body>
</html>




