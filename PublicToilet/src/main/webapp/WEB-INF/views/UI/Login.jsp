<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function send(f)
{
	
	var ID = f.ID.value;
	var PW = f.PW.value;
	
	
	if(ID==''){
		alert('id를 입력하세요');
		f.id.focus();
		return ;
	}
	
	if(PW==''){
		alert('비밀번호를 입력하세요');
		f.pw.focus();
		return;
	}
	
	f.action = 'LoginForm';
	f.submit();//전송
}

function noBack(){window.history.forward();}
</script>
</head>
<body onload="noBack();" 
    onpageshow="if(event.persisted) noBack();" 
    onunload="">
    
<form method = "post">
	ID : <input type = "text" name = "ID" placeholder="ID입력">
	PW : <input type = "password" name = "PW" placeholder="PW입력">
	
	<input type = "button" value = "로그인!!" onclick="send(this.form);">

</form>
</body>
</html>