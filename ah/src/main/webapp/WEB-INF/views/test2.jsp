<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.area {
    position: absolute;
    background: #fff;
    border: 1px solid #888;
    border-radius: 3px;
    font-size: 12px;
    top: -5px;
    left: 15px;
    padding:2px;
}

.info {
    font-size: 12px;
    padding: 5px;
}
.info .title {
    font-weight: bold;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1eb82a611b357dbfc3eb3e227b6ec2d3"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
    level: 8 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption),
    customOverlay = new kakao.maps.CustomOverlay({}),
    infowindow = new kakao.maps.InfoWindow({removable: true});

//{ "type": "Feature", "properties": { "OBJECTID": 424, "adm_nm": "서울특별시 강동구 길동", "adm_cd": "1125074", "adm_cd2": "1174068500" }, 
//"geometry": { "type": "MultiPolygon", "coordinates": [ [ [ [ 127.1

var areas = [];
$.get("/ah/resources/geojson/sigungu.geojson", function(data){
	var str = JSON.parse(data);
	//console.log(str);

	
	//[139]~[163].geometry.coordinates[0][0][0]
	//[139].geometry.coordinates[0]
	//[139].properties.SIG_KOR_NM
 	for(var i = 139; i <= 163 ; i++){
 		var coord = [];
 		//console.log(str.features[i].geometry.coordinates[0]);
		for(var j = 0; j <str.features[i].geometry.coordinates[0].length; j++){
			coord.push(new kakao.maps.LatLng(str.features[i].geometry.coordinates[0][j][1], str.features[i].geometry.coordinates[0][j][0]));	
		}
		var obj =  {
		        name : str.features[i].properties.SIG_KOR_NM,
		        path : coord
		};
		console.log(obj);
		areas.push(obj);
	}
		
 	for (var i = 0, len = areas.length; i < len; i++) {
 	    displayArea(areas[i]);
 	}
	
});
/* $.get("/ah/resources/geojson/sido.geojson", function(data) {
	var str = JSON.parse(data);
	//features[0].geometry.coordinates[0]
	//[0][0]
	//[1]
	console.log(str.features[8].geometry.coordinates[0]);
	console.log(str.features[8].geometry.coordinates[0].length);
	console.log(str.features[8].geometry.coordinates[0][199].length);
	
	for(var i = 0; i < 200 ; i++){
		coord.push(new kakao.maps.LatLng(str.features[8].geometry.coordinates[0][i][1], str.features[8].geometry.coordinates[0][i][0]) )
	}
	console.log(str.features[8].geometry.coordinates[0][0]);
	console.log(str.features[8].geometry.coordinates[0][0][0]);
	console.log(str.features[8].geometry.coordinates[0][0][1]);
    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
/*     var markers = $(features.geometry.coordinates).map(function(i, position) {
        return new kakao.maps.Marker({
            position : new kakao.maps.LatLng(position.lat, position.lng)
        });
    });

    // 클러스터러에 마커들을 추가합니다
    clusterer.addMarkers(markers); */
    
   // var obj = JSON.stringify(str.features[8].geometry.coordinates[0]);
    //localStorage.setItem('gameStorage', obj);
    //console.log( new kakao.maps.LatLng(37.5548768201904, 126.96966524449994));
/* 	areas = [
	    {
	        name : '서울',
	        path : coord
	    }
	  ];
	

	// 지도에 영역데이터를 폴리곤으로 표시합니다 
	console.log(areas[0]);
	displayArea(areas[0]);
}); */ 
</script>


<script>
function displayArea(area) {

    // 다각형을 생성합니다 
    var polygon = new kakao.maps.Polygon({
        map: map, // 다각형을 표시할 지도 객체
        path: area.path,
        strokeWeight: 2,
        strokeColor: '#004c80',
        strokeOpacity: 0.8,
        fillColor: '#fff',
        fillOpacity: 0.7 
    });

    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
    kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
        polygon.setOptions({fillColor: '#09f'});

        customOverlay.setContent('<div class="area">' + area.name + '</div>');
        
        customOverlay.setPosition(mouseEvent.latLng); 
        customOverlay.setMap(map);
    });

    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
    kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
        
        customOverlay.setPosition(mouseEvent.latLng); 
    });

    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
    // 커스텀 오버레이를 지도에서 제거합니다 
    kakao.maps.event.addListener(polygon, 'mouseout', function() {
        polygon.setOptions({fillColor: '#fff'});
        customOverlay.setMap(null);
    }); 

    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
    kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
        var content = '<div class="info">' + 
                    '   <div class="title">' + area.name + '</div>' +
                    '   <div class="size">총 면적 : 약 ' + Math.floor(polygon.getArea()) + ' m<sup>2</sup></area>' +
                    '</div>';

        infowindow.setContent(content); 
        infowindow.setPosition(mouseEvent.latLng); 
        infowindow.setMap(map);
    });
}
</script>
</body>
</html>