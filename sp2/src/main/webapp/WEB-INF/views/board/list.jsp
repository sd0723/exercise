<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
	<tr>
	<td>BNO</td>
	<td>TITLE</td>
	<td>WRITER</td>
	<td> REGDAET</td>
	</tr>
	<c:forEach items = "${list}" var = "vo">
	<tr>
		<td><c:out value="${bno}"/></td>
		<td><c:out value="${content}"/></td>
		<td><c:out value="${writer}"/></td>
		<td><c:out value="${regdate}"/></td>
	</tr>
	</c:forEach>
	</table>
</body>
</html>