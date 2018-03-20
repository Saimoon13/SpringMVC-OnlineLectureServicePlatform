<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>loginFail</title>
</head>
<body>
<form name='f' action='<spring:url value="login"/>' method='POST'>
    <table>
        <tr>
            <td>User:</td>
            <td>
                <input type='text' name='username' value=''>
            </td>
        </tr>
        <tr>
            <td>Password:</td>
            <td>
                <input type='password' name='password'/>
            </td>
        </tr>
        <tr>
            <td colspan='2'>
                <input name="submit" type="submit" value="Login"/>
            </td>
        </tr>
    </table>
</form>
</body>

</html>
