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
<body>
	<div>
		<a href="/h2/apt/강남구">강남구 아파트</a><br>
		<a href="/h2/search/강남구">강남구 반경500m 내 까페 & 지하철</a>
	</div>

	<c:if test="${empty aptListAll}">
		아파트 데이터가 없습니다!!!!!
	</c:if>

	<c:if test="${empty cafeListAll}">
		까페 데이터가 없습니다!!!!!
	</c:if>
	<p></p>
	<div id="map" style="width: 100%; height: 400px;"></div>

	<c:if test="${!empty aptListAll}">
		<jsp:include page="aptlist.jsp" />
	</c:if>

	<c:if test="${!empty cafeListAll}">20
		<script>		
			<c:forEach var="vo" items="${cafeListAll}" varStatus="status">
				addMarker(new kakao.maps.LatLng("${vo.lat}", "${vo.lng}"),
					"${vo.addr}", "${vo.name}", "${vo.no}");
			</c:forEach>
		</script>
	</c:if>

	<c:if test="${!empty circleListAll}">
		<script>
			<c:forEach var="vo" items="${circleListAll}" varStatus="status">
				addMarkerCircle(new kakao.maps.LatLng("${vo.aptlat}", "${vo.aptlng}"), "${vo.aptname}");
			</c:forEach>
		</script>
	</c:if>

	<script src="<c:url value="/resources/js/kakaoapi.js"/>"></script>
	<script src="<c:url value="/resources/js/h2api.js"/>"></script>
	<script src="<c:url value="/resources/js/var.js"/>"></script>

</body>
</html>