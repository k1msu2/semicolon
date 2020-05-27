<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
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
</body>
</html>