<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="#">

<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
</head>
<script>
function send(){
	if (navigator.geolocation) {
		var positionOptions = {
				enableHighAccuracy	: true, 
				maximumAge		: 30000, 
				timeout			: 27000
		};

	    navigator.geolocation.watchPosition(function(position) {
	      var lat = position.coords.latitude;
	      var lng= position.coords.longitude;
	  
		let f = document.createElement('form');
	    const latEL = document.createElement('input');
	    latEL.setAttribute('type', 'hidden');
	    latEL.setAttribute('name', 'lat');
	    latEL.setAttribute('value', lat);
	
		const lngEL = document.createElement('input');
	    lngEL.setAttribute('type', 'hidden');
	    lngEL.setAttribute('name', 'lng');
	    lngEL.setAttribute('value', lng);
	
		f.appendChild(latEL);
		f.appendChild(lngEL);
		
	    f.setAttribute('method', 'get');
	    f.setAttribute('action', 'Toilet');
	    document.body.appendChild(f);
		
	    f.submit();
	});
 }
}
 </script>

<body>

<c:choose>
<c:when test="${Name == null}">
	<h1>누구나 화장실</h1>
	<form action = "Join">
		<input type = "submit" value = 회원가입>
	</form>
	
	<form action = "Login">
		<input type = "submit" value = 로그인>
	</form>
</c:when>
<c:otherwise>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a> ${Name} 님</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="nav justify-content-center">
        <li class="nav-item">
        <form>
          <a class="nav-link active" onclick = "send();">화장실</a>
        </form>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="UserInfo?ID=${ID}">회원정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="List">확인</a>
        </li>
      </ul>
    </div>
    	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  			<button class="btn btn-primary me-md-2" type="button" onclick="location.href='/www/LogOut?'">LogOut</button>
		</div>
  </div>
</nav>
	
</c:otherwise>
</c:choose>
    
    



</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>