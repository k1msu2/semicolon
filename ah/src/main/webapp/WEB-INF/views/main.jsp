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
			style="width: 100%; height: 80%; position: relative; overflow: hidden;"></div>
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
	
	
	<button onclick="showGraph1('DMC마포청구')">DMC마포청구</button>
	<button onclick="showGraph1('강남더샵포레스트')">강남더샵포레스트</button>
	<div id="chartdiv">			
<!-- 		<div id="chartdiv1" style="display:none;"></div>
		<div id="chartdiv2" style="display:none;"></div> -->
		<div id="chartdiv1"></div>
		<div id="chartdiv2"></div>
		</div><!-- map div end -->
	</div>

	<!-- 변수 선언은 제일 나중에, 태그 로딩 후.. -->
	<script src="<c:url value="/resources/js/var.js"/>"></script>
	<script src="<c:url value="/resources/js/kakaoapi.js"/>"></script>
	<script src="<c:url value="/resources/js/h2api.js"/>"></script>
	<script src="<c:url value="/resources/js/h2catapi.js"/>"></script>
	
	
	<script>
	function showGraph1(aptname){
		
		//ajax 로 호출
		var request = new XMLHttpRequest();
		var formdata = new FormData();
		
		formdata.enctype='multipart/form-data';
		formdata.method='post';
		formdata.action='/ah/graph1/' + aptname;
		console.log(formdata.action);
		request.open('post', formdata.action, true);
		request.send(formdata);
	
		request.onload = function(event) {
			if (request.status == 200) {
				alert("test!!!");
				var str = request.responseText;
				var rdata= JSON.parse(str); // db 데이터로 둬야함.
				
				console.log(rdata);
				
				am4core.ready(function() {

					// Themes begin
					am4core.useTheme(am4themes_animated);
					// Themes end

					// Create chart instance
					var chart = am4core.create("chartdiv1", am4charts.XYChart);
							
					chart.data = rdata;
					
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
					series1.dataFields.valueY = "y84.6";
					series1.dataFields.value = "value84.6";
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
					series2.dataFields.valueY = "y84.9";
					series2.dataFields.value = "value84.9";
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

				});

				
			};
		}
			
		
	
	}
	function showGraph2(){
		//document.querySelector('#chartdiv2').style.display='block';
	}
	</script>
	
<%-- 	<jsp:include page="graph1.jsp" />
	<jsp:include page="graph2.jsp" />
 --%>	
	<script>
		window.onload = function() {
			// 강남구 역삼동을 센터로 디비 커넥션을 만들어줘야 리스트가 바로 나옴
			// 제일 첫화면을 뭘 넣을까.. 서울시 전체 지도 레이아웃??
		};
	</script>

</body>
</html>