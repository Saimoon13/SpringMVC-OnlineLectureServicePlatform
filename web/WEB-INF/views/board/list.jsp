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

</head>
<body>

<!-- 머리글 -->
<header>
    <%@ include file="../subPage/header.jsp" %>

    <link rel="stylesheet" type="text/css" href="../../../resources/lib/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/CSS/list.css">
</header>

<div class="container my-3">
    <h1>게시판 메인 페이지</h1>

    <ul>
        <li><a href="register">새 글 작성</a></li>
    </ul>

    <hr/>
    <div class="row">
        <div class="col-12">
            <div class="input-group mb-3">
                <form class="form-inline mb-3" action="search" method="get">
                    <select class="form-group custom-select" name="searchType">
                        <option value="1">작성자</option>
                        <option value="2">제목</option>
                        <option value="3">제목 + 내용</option>
                    </select>
                    <%--<input class="form-group mx-sm-3 mb-2" type="text" name="searchKeyword" placeholder="검색어"/>--%>
                    <%--<input type="submit" value="검색"/>--%>
                    <input type="text" class="form-group form-control" aria-label="Text input with segmented dropdown button">
                </form>
            </div>

            <table class="table table-hover table-striped table-bordered table-responsive-lg">
                <thead class="thead table-primary">
                <tr>
                    <th scope="col" class="w-15">글번호</th>
                    <th scope="col" class="w-50">제목</th>
                    <th scope="col" class="w-15">작성자</th>
                    <th scope="col" class="w-20">수정시간</th>
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
                            <fmt:formatDate var="regdate"
                                            value="${board.regdate}"
                                            pattern="yyyy/MM/dd HH:mm:ss"/>
                                ${regdate}
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <ul class="pagination">
                <c:if test="${pageMaker.prev}">
                    <!-- 이전 버튼은 (startPage - 1)로 이동 -->
                    <li><a href="${pageMaker.startPage - 1}">이전</a></li>
                </c:if>

                <c:forEach var="num"
                           begin="${pageMaker.startPage}"
                           end="${pageMaker.endPage}">
                    <li><a href="${num}">${num}</a></li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <!-- 다음 버튼은 (endPage + 1)으로 이동 -->
                    <li><a href="${pageMaker.endPage + 1}">다음</a></li>
                </c:if>
            </ul>

            <form id="pageForm" action="list" method="get">
                <input type="hidden" id="page" name="page"
                       value="${pageMaker.criteria.page}"/>
                <input type="hidden" id="perPage" name="perPage"
                       value="${pageMaker.criteria.numsPerPage}"/>
            </form>

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


<script src="../../../resources/lib/jquery-3.3.1.slim.js"></script>
<script src="../../../resources/lib/bootstrap.bundle.min.js"></script>


</body>
</html>




