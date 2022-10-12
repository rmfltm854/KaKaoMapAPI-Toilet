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
	var name = f.name.value;
	var age = f.age.value;
	var ID = f.ID.value;
	var PW = f.PW.value;
	var repw = f.repw.value;
	var mail = f.mail.value;
	
	if(name==''){
		alert('작성자 이름을 입력하세요');
		f.name.focus();
		return ;
	}
	
	if(age==''){
		alert('나이를 입력하세요');
		f.age.focus();
		return;
	}
	
	if(ID==''){
		alert('ID를 입력하세요');
		f.id.focus();
		return;
	}
	if(PW==''){
		alert('PW를 입력하세요');
		f.pw.focus();
		return;
	}
	if(repw==''){
		alert('rePW를 입력하세요');
		f.repw.focus();
		return;
	}
	if(repw != PW){
		alert('비밀번호를 재확인해주세요 ');
		f.pw.focus();
		return;
	}
	if(mail==''){
		alert('E-MAil을 입력하세요');
		f.mail.focus();
		return;
	}

	
	f.action = 'JoinForm';
	f.submit();//전송
}
	</script>

</head>
<body>
				<h1>회원가입</h1>
	<form method = "post">	
		이름 :<input type="text" name = "name" placeholder="이름입력"><br>
		나이 : <input type="number" name = "age" placeholder="나이입력"><br>
		ID : <input type="text" name = "ID" placeholder="ID입력"><br>
		PW : <input type="password" name = "PW" placeholder="PW입력"><br>
		PW재확인 : <input type="password" name = "repw" placeholder="PW재입력"><br>
		E - Mail : <input type="email" name = "mail" placeholder="E-mail입력"><br>
		<input type="submit" value="회원가입"
			          onclick="send(this.form);" >
	</form>	

</body>
</html>