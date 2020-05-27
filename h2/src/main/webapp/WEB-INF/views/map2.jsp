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
				<li id="BK9" data-order="0"> &nbsp;서울시&nbsp;>
				 <a href="#" id = "provName1" onclick="showProvince()">&nbsp;구선택&nbsp;</a>
				 >
				 <a href="#" id = "townName1" onclick="showTown()">&nbsp;동선택&nbsp;</a>
				</li>
			</ul>
		</div>

		<ul id="category2">
			<li id="BK9" data-order="0">1순위 > <a href="#" id = "cat1" onclick="showCat1()">카테고리</a>
			</li>
			<li id="BK9" data-order="0">2순위 > <a href="#" id = "cat2" onclick="showCat2()">카테고리</a>
			</li>
			<li id="BK9" data-order="0">3순위 > <a href="#" id = "cat3" onclick="showCat3()">카테고리</a>
			</li>
		</ul>
		
		<!-- 나중에 리스트는 innerHTML 로 등록 할 예정  -->
		<div class="dropdown" id="list1">
 			<div class="dropdown-content" id="contentList1">
 -->			</div>
		</div>
		
		<div class="dropdown" id="list2">
			<div class="dropdown-content" id ="contentList2">
			</div>
		</div>
		

		<div class="dropdown" id="list3">
			<div class="dropdown-content">
			 <a href="#" onclick="chooseCat1('지하철')">지하철</a>
			 <a href="#" onclick="chooseCat1('까페')">까페</a>
			 <a href="#" onclick="chooseCat1('마트')">마트</a>
			 <a href="#">Link 1</a>
			 <a href="#">Link 1</a>
			</div>
		</div>
		
		<div class="dropdown" id="list4">
			<div class="dropdown-content">
			 <a href="#" onclick="chooseCat2('지하철')">지하철</a>
			 <a href="#" onclick="chooseCat2('까페')">까페</a>
			 <a href="#" onclick="chooseCat2('마트')">마트</a>
			 <a href="#">Link 1</a>
			 <a href="#">Link 1</a>
			</div>
		</div>
		
		<div class="dropdown" id="list5">
			<div class="dropdown-content">
			 <a href="/h2/search/3/지하철" onclick="chooseCat3('지하철')">지하철</a>
			 <a href="/h2/search/3/까페" onclick="chooseCat3('까페')">까페</a>
			 <a href="/h2/search/3/마트" onclick="chooseCat3('마트')">마트</a>
			 <a href="#">Link 1</a>
			 <a href="#">Link 1</a>
			</div>
		</div>
	</div>
	<script> console.log("here1111");</script>

	<!-- 변수 선언은 제일 나중에, 태그 로딩 후.. -->
	<script src="<c:url value="/resources/js/kakaoapi.js"/>"></script>
	<script src="<c:url value="/resources/js/h2api.js"/>"></script>
	<script src="<c:url value="/resources/js/var.js"/>"></script>
	
	<c:if test="${!empty aptListAll}"> <jsp:include page="aptlist.jsp" /> </c:if>
	<c:if test="${!empty catListAll}"> <jsp:include page="catlist.jsp" /> </c:if>
	
	<script>
		// 아파트 클러스터링 형식으로 출력
		window.onload = function(){
			// 강남구 역삼동을 센터로??
			// 서울시를 센터로??
			// 제일 첫화면 렌더링할 함수 만들기
		};
	</script>
	
		<script>

	</script>
</body>
</html>