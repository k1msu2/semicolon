<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<jsp:include page="header.jsp" />

<body>

	<div class="topnav">
		<a class="active" href="#home">AH!</a> <a href="#about">APT</a> <a
			href="#contact">HERE</a>
		<div class="search-container">
			<form action="/action_page.php">
				<input type="text" placeholder="아파트명" name="search">
				<button type="submit">검색</button>
			</form>
		</div>
	</div>


	<div class="map_wrap">
		<div id="map" style="width: 100%; height: 130%; position: relative; overflow: hidden;"></div>
		<div id="category">
			<ul>
				<li> &nbsp;서울시&nbsp;>
				 <a href="#" id = "provName1" onclick="showProvince()">&nbsp;구선택&nbsp;</a>
				 >
				 <a href="#" id = "townName1" onclick="showTown()">&nbsp;동선택&nbsp;</a>
				</li>
			</ul>
		</div>

		<ul id="category2">
			<li>1순위 > <a href="#" id = "cat1" onclick="showCat1()">카테고리</a>
			</li>
			<li>2순위 > <a href="#" id = "cat2" onclick="showCat2()">카테고리</a>
			</li>
			<li>3순위 > <a href="#" id = "cat3" onclick="showCat3()">카테고리</a>
			</li>
		</ul>
		
		<ul id="category3">
			<li><a href="#" id = "search" onclick="searchCat()">검색</a></li>
		</ul>
		
		
		<div class="dropdown" id="list1"><div class="dropdown-content" id="contentList1"></div></div>
		<div class="dropdown" id="list2"><div class="dropdown-content" id ="contentList2"></div></div>
		<div class="dropdown" id="list3"><div class="dropdown-content2" id = "contentList3"></div></div>
		<div class="dropdown" id="list4"><div class="dropdown-content2" id = "contentList4"></div></div>
		<div class="dropdown" id="list5"><div class="dropdown-content2" id = "contentList5"></div></div>
	</div>

	<!-- 변수 선언은 제일 나중에, 태그 로딩 후.. -->
	<script src="<c:url value="/resources/js/var.js"/>"></script>
	<script src="<c:url value="/resources/js/kakaoapi.js"/>"></script>
	<script src="<c:url value="/resources/js/h2api.js"/>"></script>
	<script src="<c:url value="/resources/js/h2catapi.js"/>"></script>

	
	<script>
		// 아파트 클러스터링 형식으로 출력
		window.onload = function(){
			// 강남구 역삼동을 센터로 디비 커넥션을 만들어줘야 리스트가 바로 나옴
		};
	</script>
	
		<script>

	</script>
</body>
</html>