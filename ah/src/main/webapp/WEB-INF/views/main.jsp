<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<jsp:include page="header.jsp" />

<body>

	<!-- 	<div class="topnav">
		<a class="active" href="#home">AH!</a> <a href="#about">APT</a> <a
			href="#contact">HERE</a>
		<div class="search-container">
			<form action="/action_page.php">
				<input type="text" placeholder="아파트명" name="search">
				<button type="submit">검색</button>
			</form>
		</div>
	</div>
 -->
	<script>
		function showDetail() {
			if (document.querySelector('#shadow').classList.toggle('display')) {
				document.querySelector('.toggle').style.backgroundPosition = '-7px -157px';
				document.querySelector('.map_wrap').style.width = '100%';
				document.querySelector('.toggle').style.left = '-390px';
				document.querySelector('#map').style.left = '-390px';
				document.querySelector(".sidebar").style.width = "390px";
				/* document.querySelector("#map").style.marginRight = "250px"; */

			} else {
				document.querySelector('.toggle').style.backgroundPosition = '-5px -26px';
				document.querySelector('.map_wrap').style.width = '100%';
				document.querySelector('.toggle').style.left = '0px';
				document.querySelector('#map').style.left = '0px';
				document.querySelector(".sidebar").style.width = "0";
				/* document.querySelector("main").style.marginRight = "0"; */
			}
		}
	</script>

	<div class="map_wrap">
		<div id="map"></div>
		<div id="shadow" class="Shadow" style="height: 90%;">
			<span id="shadow.toggle" class="toggle" onclick="showDetail()"></span>
		</div>
		<div class="sidebar">영기야 여기야!!</div>

		<div id="category">
			<ul>
				<li>&nbsp;서울시&nbsp;> <a href="#" id="provName1"
					onclick="showProvince()">&nbsp;전 체&nbsp;</a> > <a href="#"
					id="townName1" onclick="showTown()">&nbsp;전 체&nbsp;</a>
				</li>
			</ul>
		</div>

		<ul id="category2">
			<li>1순위 > <a href="#" id="cat1" onclick="showCat1()">카테고리</a>
			</li>
			<li>2순위 > <a href="#" id="cat2" onclick="showCat2()">카테고리</a>
			</li>
			<li>3순위 > <a href="#" id="cat3" onclick="showCat3()">카테고리</a>
			</li>
		</ul>

		<ul id="category3">
			<li id="searchLoading"><a href="#" id="search"
				onclick="searchCat()">검색</a> <!-- &nbsp;<i class="fa fa-circle-o-notch fa-spin"></i> --></li>
		</ul>

		<div class="dropdown" id="list1">
			<div class="dropdown-content" id="contentList1"></div>
		</div>
		<div class="dropdown" id="list2">
			<div class="dropdown-content" id="contentList2"></div>
		</div>
		<div class="dropdown" id="list3">
			<div class="dropdown-content2" id="contentList3"></div>
		</div>
		<div class="dropdown" id="list4">
			<div class="dropdown-content2" id="contentList4"></div>
		</div>
		<div class="dropdown" id="list5">
			<div class="dropdown-content2" id="contentList5"></div>
		</div>

		<button onclick="showAptGraph('chartdiv1', 'e편한세상마포리버파크')">e편한세상마포리버파크</button>
		<button onclick="showAptGraph('chartdiv2', '래미안공덕3차')">래미안공덕3차</button>
		<button onclick="showGuGraph('chartdiv3', '강남구')">강남구</button>
		<button onclick="showDongGraph('chartdiv4', '강남구', '역삼동')">역삼동</button>
		
		<div id="chartdiv">
			<div id="chartdiv1"></div>
			<div id="chartdiv2"></div>
			<div id="chartdiv3"></div>
			<div id="chartdiv4"></div>
		</div>

	</div>

	<!-- 변수 선언은 제일 나중에, 태그 로딩 후.. -->
	<script src="<c:url value="/resources/js/var.js"/>"></script>
	<script src="<c:url value="/resources/js/kakaoapi.js"/>"></script>
	<script src="<c:url value="/resources/js/h2api.js"/>"></script>
	<script src="<c:url value="/resources/js/h2catapi.js"/>"></script>
	<script src="<c:url value="/resources/js/graph1.js"/>"></script>
	<script src="<c:url value="/resources/js/graph2.js"/>"></script>
	<script src="<c:url value="/resources/js/graph3.js"/>"></script>

	<script>
		window.onload = function() {
			
		};
	</script>

</body>
</html>