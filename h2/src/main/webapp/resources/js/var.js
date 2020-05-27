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
	disableClickZoom : true
// 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
});