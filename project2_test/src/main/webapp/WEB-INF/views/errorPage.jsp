<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
		<a href="${pageContext.request.contextPath}/joinForm.do" target="_self"><h4>회원가입 페이지</h4></a>
	</c:if>

</body>
</html>