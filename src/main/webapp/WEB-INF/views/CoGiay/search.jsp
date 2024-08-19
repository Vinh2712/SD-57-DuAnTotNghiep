<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
<br>
<form:form modelAttribute="searchCG" method="post" action="/CoGiay/list">
    <p>

        <form:input path="keyword"/>
        <button class="btn btn-primary" type="submit">Search</button>
        <a href="${pageContext.request.contextPath}/CoGiay/list">
            <button class="btn btn-primary">Back</button>
        </a>
    </p>

</form:form>
