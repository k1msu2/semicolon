<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Chart code -->
	<script>
		am4core.ready(function() {

			// Themes begin
			am4core.useTheme(am4themes_animated);
			// Themes end

			// Create chart instance
			var chart = am4core.create("chartdiv2", am4charts.XYChart);

			// Add data
			
			chart.data = [ 
				{
					"date" : "2011-05",
					"y[1]" : "435",
					"aValue" : "1",
					"by" : "500",
					"bValue" : "2"
				}, 
				{
					"date" : "2011-06",
					"y[1]" : "100",
					"aValue" : "2",
					"by" : "200",
					"bValue" : "1"
				}
			];
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
			series1.dataFields.valueY = "y[1]";
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


	
</body>
</html>