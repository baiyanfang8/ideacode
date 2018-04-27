<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>

<html>
<body>
    <c:forEach items="${requestScope.users}" var="user">
        ${user.id}
        ${user.name}
        ${user.age}
        </body>
</html>
