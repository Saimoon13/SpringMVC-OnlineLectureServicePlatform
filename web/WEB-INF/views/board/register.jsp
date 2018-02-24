<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>

    <link rel="stylesheet" type="text/css" href="../../../resources/lib/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/CSS/list.css">

</head>
<body>

<header>
    <%@ include file="../subPage/header.jsp" %>
</header>

<h1>새 글 작성 페이지</h1>

<form action="register" method="post">
    <label for="title">제목</label><br/>
    <input type="text" name="title" id="title" required />
    <br/>
    <label for="content">본문</label><br/>
    <textarea rows="5" cols="40" name="content" id="content" required></textarea>
    <br/>
    <label for="userid">아이디</label><br/>
    <input type="text" name="userid" id="userid" required />
    <br/>
    <input type="submit" value="작성 완료" />
</form>

<!-- 꼬리글 -->
<footer>
    <jsp:include page="../subPage/footer.jsp"></jsp:include>
</footer>

</body>
</html>







