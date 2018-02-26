<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"
    uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>

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

</head>
<body>

<header>
    <jsp:include page="../subPage/header.jsp">
        <jsp:param name="before" value="first"></jsp:param>
    </jsp:include>
</header>

<div class="container">
    <div class="row">
        <div class="col-12">
            <table>
                <thead>
                <tr>
                    <th>Number</th>
                    <th>Title</th>
                    <th>Writer</th>
                    <th>Date</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>100</td>
                        <td>안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요</td>
                        <td>사람</td>
                        <td>2018.02.02</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>


<h1>검색 결과 페이지</h1>

<ul>
    <li><a href="register">새 글 작성</a></li>
</ul>

<hr/>

<form action="search" method="get">
    <select name="searchType">
        <option value="1">작성자</option>
        <option value="2">제목</option>
        <option value="3">제목 + 내용</option>
    </select>
    <input type="text" name="searchKeyword" placeholder="검색어" />
    <input type="submit" value="검색" />
</form>

<table>
    <thead>
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>수정시간</th>
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

</body>
</html>




