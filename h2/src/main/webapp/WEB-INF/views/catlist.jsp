<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
<script>
			<c:forEach var="vo" items="${cafeListAll}" varStatus="status">
			addMarker(new kakao.maps.LatLng("${vo.lat}", "${vo.lng}"),
					"${vo.addr}", "${vo.name}", cafeImage);
			</c:forEach>
		</script>
</body>
</html>