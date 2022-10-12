<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function noBack(){window.history.forward();}
</script>
<body
onload="noBack();" 
    onpageshow="if(event.persisted) noBack();" 
    onunload="">
			
				
				이름 : ${ vo.name}<br>
				나이 : ${ vo.age }<br>
				ID : ${ vo.ID }<br>
				PW : ${ vo.PW }<br>
				E - Mail : ${ vo.mail }<br>
				
				
			<button onclick="location.href='/www/update?ID=${ID}'">수정</button><br>
			<button onclick="location.href='/www/delete'">삭제</button>
					
			
		

</body>
</html>