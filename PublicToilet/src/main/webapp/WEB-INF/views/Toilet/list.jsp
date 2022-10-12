<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	console.log(list);
</script>
	<table border="1" align="center">
	
		<tr>
			<th>Name</th>
			<th>lat</th>
			<th>lng</th>
		</tr>
		
 		<c:forEach var="list" items="${ list }">
			<tr>
				<td>${ list.name}</td>
				<td>${ list.lat}</td>
				<td>${ list.lng }</td>
				
			</tr>
		</c:forEach>
	</table>
</body>
</html>