<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>


	<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
   

    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    .customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
	.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
	.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	.ICON-stars {
    float: left;
    overflow: hidden;
    position: relative;
    width: 70px;
    height: 14px;
    margin: 1px 2px 0 0;
    background: url(//t1.daumcdn.net/localimg/localimages/07/2018/pc/icon/img_star.png) no-repeat 0 0;
}
	</style>
</head>


   
	  

<body>

<div id="map" style="width:100%;height:1200px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=서비스키"></script>

<script>

// 커스텀 오버레이에 표시할 컨텐츠 입니다
// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
// 별도의 이벤트 메소드를 제공하지 않습니다 

            
            var list = new Array();
        	<c:forEach items = "${list}" var="info">
        	var json = new Object();
        	json.name="${info.name}"
        	json.lat = "${info.lat}"
        	json.lng="${info.lng}"
        	json.distance = "${info.distance}"
        	
        	list.push(json);
        	</c:forEach>
        	console.log(list);
        	console.log(list[0]);
        	console.log(list[0].lat);
        	function GetStar(place) {
                var result;
                $.ajax({
                    type: "post",
                    url: "GetStar",
                    async: false,     //값을 리턴시 해당코드를 추가하여 동기로 변경
                    data: { title: place.title },
                    success: function (data) {
                        result = data;
                        result = encodeURIComponent(result);
                    }
                     
                });
                if(result == 1){
                	return "★☆☆☆☆(1점)";
                }else if(result == 2){
                	return "★★☆☆☆(2점)";
                }else if(result == 3){
                	return "★★★☆☆(3점)";
                }else if(result == 4){
                	return "★★★★☆(4점)";
                }else if(result == 5){
                	return "★★★★★(5점)";
                }else if(result == 0){
                	return "☆☆☆☆☆(0점)";
                }
                
               
               
               
            }
        	
        	


        	
        	 
             
        	
  
        	var mapContainer = document.getElementById('map'), // 지도의 중심좌표
            mapOption = { 
                center: new kakao.maps.LatLng(33.451475, 126.570528), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            }; 

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            if (navigator.geolocation) {
                
                // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                navigator.geolocation.getCurrentPosition(function(position) {
                    
                    var lat = position.coords.latitude, // 위도
                        lon = position.coords.longitude; // 경도
                    console.log(lat);
                    var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                        message = '<div style="padding:5px;">내위치</div>'; // 인포윈도우에 표시될 내용입니다
                    
                    // 마커와 인포윈도우를 표시합니다
                    displayMarker(locPosition, message);
                        
                  });
                
            } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
                
                var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
                    message = 'geolocation을 사용할수 없어요..'
                    
                displayMarker(locPosition, message);
            }
            // 지도에 마커와 인포윈도우를 표시하는 함수입니다
            function displayMarker(locPosition, message) {

                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({  
                    map: map, 
                    position: locPosition
                }); 
                
                var iwContent = message, // 인포윈도우에 표시할 내용
                    iwRemoveable = false;

                // 인포윈도우를 생성합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content : iwContent,
                    removable : iwRemoveable
                });
                
                // 인포윈도우를 마커위에 표시합니다 
                infowindow.open(map, marker);
                
                // 지도 중심좌표를 접속위치로 변경합니다
                map.setCenter(locPosition);      
            }    
           
            
            
            
 var positions = [];
            
        	for (var i = 1; i <list.length; i++ ) {
        		var content = {
        				title: list[i].name,
        			    latlng: new kakao.maps.LatLng(list[i].lat, list[i].lng),
        		}
        		positions.push(content);
        	};
        	console.log(positions);
        	
        		//${ pageContext.request.contextPath }/resources/Marker.png
        	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
        	
        	for(var i = 0; i < positions.length; i++) {
        	  // 마커 이미지의 이미지 크기 입니다
        	  var imageSize = new kakao.maps.Size(24, 35);
        	  // 마커 이미지를 생성합니다
        	  var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
        	  // 마커를 생성합니다
        	  var marker = new kakao.maps.Marker({
        	    map: map, // 마커를 표시할 지도
        	    position: positions[i].latlng, // 마커를 표시할 위치
        	    title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        	    image: markerImage // 마커 이미지
        	  });
        	  
        	
        	(function(marker, place,customOverlay) {
        		  // 마크 클릭 시
        		  
        		  kakao.maps.event.addListener(marker, 'click', function() {
        		    var customOverlay = new kakao.maps.CustomOverlay({
        		      // 오버레이에 띄울 내용
        		      content:
        		    	  '<div class="wrap">'+ 
                      '<div class="info">'+  
                      '<div class="title">'+  
                           place.title+ 
                          '</div>'+
                          '<div class="body">'+
                          
                          
                          GetStar(place)+
                          
                          
                           '<div class="desc">  '+ 
                               ' <span class = "title"><a href=ToiletReview?title='+place.title+
                               ' target="_blank" class="link">리뷰쓰기</a></span>'+
                           '</div> '+ 
                       '</div> '+ 
                  ' </div> '+
                  '</div>',   
              
               		  clickable: true,
        		      map: map,
        		      position: marker.getPosition()
        		     
        		     
        		     
        		    });
        		   console.log(place);
        		   console.log(GetStar(place));
        		    
        		    // 아무데나 클릭하게되면 overlay를 끄기
        		    kakao.maps.event.addListener(map,'click',function(mouseEvent){
        		      customOverlay.setMap(null);
        		    });
        		    console.log(customOverlay);
        		    customOverlay.setMap(map);
        		  })
        		})(marker, positions[i])
        	}
        	
     
</script>
</body>
</html>

  