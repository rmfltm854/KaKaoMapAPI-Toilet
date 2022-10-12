<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<form action = "UpdateForm" method = "post">
				 	<input type="hidden" name="ID" value="${ vo.ID }">
				이름 : <input type = "text" value =  ${ vo.name} name = "name"><br>
				나이 : <input type = "number" value = ${ vo.age } name = "age"><br>
				ID : ${ vo.ID }<br>
				PW : <input type = "password" value = ${ vo.PW} name = "PW"><br>
				REPW : <input type = "password" name = "REPW"  ><br>
				E - Mail :<input type = "text" value =  ${ vo.mail} name = "mail"><br>
	<input type = "submit" value = "수정하기">

	</form>
	<body 
    onload="noBack();" 
    onpageshow="if(event.persisted) noBack();" 
    onunload="">

</body>
</html>