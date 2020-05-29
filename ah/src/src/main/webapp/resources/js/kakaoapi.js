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
function addMarker(position, addr, name, no, markerImage) {

	// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	var iwContent = '<div style="padding:5px;">' + name + '</div><hr>'
			+ '<div style="padding:5px;">' + addr + '</div><hr>'
			+ '<div style="padding:5px;">' + no + '</div><hr>'

	var iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는
								// x버튼이 표시됩니다

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
	kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker,
			infowindow));
	kakao.maps.event.addListener(marker, 'mouseout',
			makeOutListener(infowindow));

	// 마커가 지도 위에 표시되도록 설정합니다
	// marker.setMap(map);
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

	centerPosition = position1;
	drawingCircle = new kakao.maps.Circle({
		strokeWeight : 1, // 선의 두께입니다
		strokeColor : '#00a0e9', // 선의 색깔입니다
		strokeOpacity : 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		strokeStyle : 'solid', // 선의 스타일입니다
		fillColor : '#00a0e9', // 채우기 색깔입니다
		fillOpacity : 0.2
	// 채우기 불투명도입니다
	});
	circleOptions = {
		center : centerPosition,
		radius : 500
	};
	drawingCircle.setOptions(circleOptions);
	drawingCircle.setMap(map);

	// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	/*
	 * var iwContent = '<div style="padding:5px;">' + name + '</div><hr>' + '<div
	 * style="padding:5px;">' + addr + '</div><hr>' + '<div
	 * style="padding:5px;">' + position + '</div><hr>'
	 * 
	 * var iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는
	 * x버튼이 표시됩니다
	 *  // 인포윈도우를 생성합니다 var infowindow = new kakao.maps.InfoWindow({ content :
	 * iwContent });
	 */

	// 마커를 생성합니다
	marker1 = new kakao.maps.Marker({
		position : position1,
		clickable : true
	});

	marker2 = new kakao.maps.Marker({
		position : position2,
		clickable : true
	});
	// 마커에 클릭이벤트를 등록합니다
	/*
	 * kakao.maps.event.addListener(marker, 'click', function() { // 마커 위에
	 * 인포윈도우를 표시합니다 infowindow.open(map, marker); });
	 */
	/*
	 * kakao.maps.event.addListener(marker, 'click', makeOverListener(map,
	 * marker, infowindow)); kakao.maps.event.addListener(marker, 'mouseout',
	 * makeOutListener(infowindow));
	 */

	// 마커가 지도 위에 표시되도록 설정합니다
	marker1.setMap(map);
	//map.setCenter(position1);
	// marker2.setMap(map);
	// 생성된 마커를 배열에 추가합니다
	markers.push(marker1);
	markers.push(drawingCircle);
	// markers.push(marker2);
}
