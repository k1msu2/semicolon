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
		<div id="map"
			style="width: 100%; height: 130%; position: relative; overflow: hidden;"></div>
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
				onclick="searchCat()">검색</a>
			<!-- &nbsp;<i class="fa fa-circle-o-notch fa-spin"></i> --></li>
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
		
			<!-- HTML -->
	<div id="chartdiv"></div>
	</div>


	<!-- 변수 선언은 제일 나중에, 태그 로딩 후.. -->
	<script src="<c:url value="/resources/js/var.js"/>"></script>
	<script src="<c:url value="/resources/js/kakaoapi.js"/>"></script>
	<script src="<c:url value="/resources/js/h2api.js"/>"></script>
	<script src="<c:url value="/resources/js/h2catapi.js"/>"></script>

	<!-- Chart code -->
	<script>
		am4core.ready(function() {

			// Themes begin
			am4core.useTheme(am4themes_animated);
			// Themes end

			// Create chart instance
			var chart = am4core.create("chartdiv", am4charts.XYChart);

			// Add data
			chart.data = [ {
				"date" : "2011-05",
				"ay" : 435,
				"aValue" : 1
			}, {
				"date" : "2012-01",
				"ay" : 387,
				"by" : 0,
				"aValue" : 1,
				"bValue" : 0
			}, {
				"date" : "2012-05",
				"ay" : 373,
				"aValue" : 1
			}, {
				"date" : "2011-05",
				"ay" : 435,
				"aValue" : 4,
				"bValue" : 3
			}, {
				"date" : "2012-01",
				"ay" : 387,
				"by" : 400,
				"aValue" : 8,
				"bValue" : 3
			}, {
				"date" : "2012-05",
				"ay" : 373,
				"aValue" : 16,
				"bValue" : 4
			}, {
				"date" : "2013-01",
				"ay" : 340,
				"by" : 347.5,
				"aValue" : 15,
				"bValue" : 10
			}, {
				"date" : "2013-05",
				"ay" : 360,
				"by" : 347.5,
				"aValue" : 0,
				"bValue" : 7
			}, {
				"date" : "2013-08",
				"ay" : 355,
				"by" : 370,
				"aValue" : 5,
				"bValue" : 5
			}, {
				"date" : "2013-09",
				"ay" : 370,
				"aValue" : 15,
				"bValue" : 10
			}, {
				"date" : "2014-07",
				"by" : 366,
				"aValue" : 15,
				"bValue" : 10
			}, {
				"date" : "2014-09",
				"ay" : 422,
				"by" : 422,
				"aValue" : 15,
				"bValue" : 10
			}, {
				"date" : "2015-05",
				"ay" : 398,
				"by" : 431.5,
				"aValue" : 15,
				"bValue" : 10
			}, {
				"date" : "2015-08",
				"ay" : 433,
				"by" : 448,
				"aValue" : 15,
				"bValue" : 10
			}, {
				"date" : "2015-09",
				"ay" : 450,
				"by" : 437.333,
				"aValue" : 15,
				"bValue" : 10
			}, {
				"date" : "2015-10",
				"ay" : 433,
				"by" : 434.5,
				"aValue" : 15,
				"bValue" : 10
			}, {
				"date" : "2016-08",
				"ay" : 493,
				"by" : 492,
				"aValue" : 15,
				"bValue" : 10
			}, {
				"date" : "2016-10",
				"ay" : 500,
				"by" : 507.5,
				"aValue" : 1,
				"bValue" : 10
			}, {
				"date" : "2017-04",
				"ay" : 525,
				"by" : 505,
				"aValue" : 5,
				"bValue" : 0
			}, {
				"date" : "2017-05",
				"ay" : 520,
				"by" : 517,
				"aValue" : 7,
				"bValue" : 1
			}, {
				"date" : "2017-11",
				"ay" : 550,
				"by" : 560,
				"aValue" : 11,
				"bValue" : 4
			}, {
				"date" : "2018-09",
				"ay" : 767,
				"aValue" : 5,
				"bValue" : 1
			}, {
				"date" : "2018-10",
				"ay" : 710,
				"by" : 772,
				"aValue" : 15,
				"bValue" : 10
			}, {
				"date" : "2019-03",
				"ay" : 740,
				"aValue" : 15,
				"bValue" : 10
			}, {
				"date" : "2019-06",
				"ay" : 750,
				"aValue" : 15,
				"bValue" : 10
			}, {
				"date" : "2020-02",
				"by" : 755,
				"aValue" : 15,
				"bValue" : 10
			} ];

			// Create axes
			var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
			dateAxis.renderer.grid.template.location = 0;
			dateAxis.renderer.minGridDistance = 50;
			dateAxis.renderer.grid.template.disabled = true;
			dateAxis.renderer.fullWidthTooltip = true;

			// Create value axis
			var yAxis = chart.yAxes.push(new am4charts.ValueAxis());

			// Create series
			var series1 = chart.series.push(new am4charts.LineSeries());
			series1.dataFields.dateX = "date";
			series1.dataFields.valueY = "ay";
			series1.dataFields.value = "aValue";
			series1.strokeWidth = 2;

			var bullet1 = series1.bullets.push(new am4charts.CircleBullet());
			series1.heatRules.push({
				target : bullet1.circle,
				min : 0,
				max : 5,
				property : "radius"
			});

			bullet1.tooltipText = "{date} 평균실거래가: [bold]{valueY}[/]";

			var series2 = chart.series.push(new am4charts.LineSeries());
			series2.dataFields.dateX = "date";
			series2.dataFields.valueY = "by";
			series2.dataFields.value = "bValue";
			series2.strokeWidth = 2;

			var bullet2 = series2.bullets.push(new am4charts.CircleBullet());
			series2.heatRules.push({
				target : bullet2.circle,
				min : 0,
				max : 5,
				property : "radius"
			});

			bullet2.tooltipText = "{date} 평균실거래가: [bold]{valueY}[/]";

			//scrollbars
			chart.scrollbarX = new am4core.Scrollbar();
			chart.scrollbarY = new am4core.Scrollbar();

		}); // end am4core.ready()
	</script>


	
	<script>
		window.onload = function() {
			// 강남구 역삼동을 센터로 디비 커넥션을 만들어줘야 리스트가 바로 나옴
			// 제일 첫화면을 뭘 넣을까.. 서울시 전체 지도 레이아웃??
		};
	</script>

</body>
</html>