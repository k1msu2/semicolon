<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1eb82a611b357dbfc3eb3e227b6ec2d3&libraries=services&libraries=clusterer"></script>
</head>
<!--  
aptListAll
cafeListAll
martListAll
circleListAll
-->
<!-- 
${vo.id}
${vo.name}
${vo.addr}
${vo.lat}
${vo.lng}
${vo.aptname}
${vo.aptlat}
${vo.aptlng}
${vo.catlat}
${vo.catlng}
 -->
<body>
	<div>
		<a href="/h2/apt/강남구">아파트</a>
		<a href="/h2/cafe/500/강남구">까페</a>
	</div>

	<c:if test="${empty aptListAll}">
		아파트 데이터가 없습니다!!!!!
	</c:if>

	<c:if test="${empty cafeListAll}">
		까페 데이터가 없습니다!!!!!
	</c:if>
	<p></p>
	<div id="map" style="width: 100%; height: 400px;"></div>
	<script>
		var markers = []; // 객체
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.564214, 127.001699), // 지도의 중심좌표
			level : 8
		// 지도의 확대 레벨
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		var imageSize = new kakao.maps.Size(24, 35);
		var cafeImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		var clusterer = new kakao.maps.MarkerClusterer({
			map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
			averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
			minLevel : 7, // 클러스터 할 최소 지도 레벨
			disableClickZoom : true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
		});
	</script>

	<script>
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}

		// 마커를 생성하고 지도위에 표시하는 함수입니다
		function addMarker(position, addr, name, markerImage) {

			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			var iwContent = '<div style="padding:5px;">' + name + '</div><hr>'
					+ '<div style="padding:5px;">' + addr + '</div><hr>'
					+ '<div style="padding:5px;">' + position + '</div><hr>'

			var iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent
			});

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : position
			});
			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커 위에 인포윈도우를 표시합니다
				infowindow.open(map, marker);
			});
			kakao.maps.event.addListener(marker, 'click', makeOverListener(map,
					marker, infowindow));
			kakao.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));

			// 마커가 지도 위에 표시되도록 설정합니다
			//marker.setMap(map);
			// 생성된 마커를 배열에 추가합니다
			markers.push(marker);
			clusterer.addMarkers(markers);

		}

		// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
		function setMarkers(map) {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(map);
			}
		}

		// 마커를 생성하고 지도위에 표시하는 함수입니다
		function addMarkerCircle(position1, position2, name) {

			var centerPosition = position1;
			var drawingCircle = new kakao.maps.Circle({
				strokeWeight : 1, // 선의 두께입니다
				strokeColor : '#00a0e9', // 선의 색깔입니다
				strokeOpacity : 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
				strokeStyle : 'solid', // 선의 스타일입니다
				fillColor : '#00a0e9', // 채우기 색깔입니다
				fillOpacity : 0.2
			// 채우기 불투명도입니다 
			});
			var circleOptions = {
				center : centerPosition,
				radius : 500,
			};
			drawingCircle.setOptions(circleOptions);
			drawingCircle.setMap(map);

			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			/* 			var iwContent = '<div style="padding:5px;">' + name + '</div><hr>'
			 + '<div style="padding:5px;">' + addr + '</div><hr>'
			 + '<div style="padding:5px;">' + position + '</div><hr>'

			 var iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			 // 인포윈도우를 생성합니다
			 var infowindow = new kakao.maps.InfoWindow({
			 content : iwContent
			 }); */

			// 마커를 생성합니다
			var marker1 = new kakao.maps.Marker({
				position : position1,
				clickable : true
			});

			var marker2 = new kakao.maps.Marker({
				position : position2,
				clickable : true
			});
			// 마커에 클릭이벤트를 등록합니다
			/* kakao.maps.event.addListener(marker, 'click', function() {
				// 마커 위에 인포윈도우를 표시합니다
				infowindow.open(map, marker);
			}); */
			/* 			kakao.maps.event.addListener(marker, 'click', makeOverListener(map,
			 marker, infowindow));
			 kakao.maps.event.addListener(marker, 'mouseout',
			 makeOutListener(infowindow)); */

			// 마커가 지도 위에 표시되도록 설정합니다
			//marker1.setMap(map);
			//marker2.setMap(map);
			// 생성된 마커를 배열에 추가합니다
			//markers.push(marker1);
			//markers.push(marker2);
		}
	</script>


	<c:if test="${!empty aptListAll}">
		<script>
			<c:forEach var="vo" items="${aptListAll}" varStatus="status">
			addMarker(new kakao.maps.LatLng("${vo.lat}", "${vo.lng}"),
					"${vo.addr}", "${vo.name}");

			</c:forEach>
			/* setMarkers(map); */
			kakao.maps.event.addListener(clusterer, 'clusterclick', function(
					cluster) {

				// 현재 지도 레벨에서 1레벨 확대한 레벨
				var level = map.getLevel() - 1;

				// 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
				map.setLevel(level, {
					anchor : cluster.getCenter()
				});
			});
		</script>
	</c:if>

	<c:if test="${!empty cafeListAll}">
		<script>
			<c:forEach var="vo" items="${cafeListAll}" varStatus="status">
			addMarker(new kakao.maps.LatLng("${vo.lat}", "${vo.lng}"),
					"${vo.addr}", "${vo.name}", cafeImage);
			</c:forEach>
		</script>
	</c:if>

	<c:if test="${!empty circleListAll}">
		<script>
			<c:forEach var="vo" items="${circleListAll}" varStatus="status">
			addMarkerCircle(new kakao.maps.LatLng("${vo.aptlat}",
					"${vo.aptlng}"), new kakao.maps.LatLng("${vo.catlat}",
					"${vo.catlng}"), "${vo.aptname}");
			</c:forEach>
		</script>
	</c:if>


</body>
</html>