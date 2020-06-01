// 구 클릭시, 구 별 가격 거래액 출력
function showGuGraph(chartname, gu){
	// ajax - /graph2/{gu} - rdata
	var request = new XMLHttpRequest();
	var formdata = new FormData();
	
	formdata.enctype='multipart/form-data';
	formdata.method='post';
	formdata.action='/ah/graph2/' + gu;
	console.log(formdata.action);
	request.open('post', formdata.action, true);
	request.send(formdata);

	request.onload = function(event) {
		if (request.status == 200) {
			//alert("test!!!");
			
			var str = request.responseText;
			var rdata= JSON.parse(str); // db 데이터로 둬야함.
			
			console.log(rdata);

			am4core.ready(function() {

				// Themes begin
				am4core.useTheme(am4themes_animated);
				
				var chart = am4core.create(chartname, am4charts.XYChart);


				var label = chart.plotContainer.createChild(am4core.Label);
				label.x = am4core.percent(97);
				label.y = am4core.percent(115);
				label.horizontalCenter = "right";
				label.verticalCenter = "middle";
				label.dx = -15;
				label.fontSize = 50;

				//play버튼 위치 및 작동
				var playButton = chart.plotContainer.createChild(am4core.PlayButton);
				playButton.x = am4core.percent(97);
				playButton.y = am4core.percent(115);
				playButton.dy = -2;
				playButton.verticalCenter = "middle";
				playButton.events.on("toggled", function(event) {
				  if (event.target.isActive) {
				    play();
				  }
				  else {
				    stop();
				  }
				})

				var stepDuration = 4000;

				var allData = rdata;
				  
				chart.padding(40, 40, 40, 40);

				var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
				categoryAxis.renderer.grid.template.location = 0;
				categoryAxis.dataFields.category = "dong";
				categoryAxis.renderer.minGridDistance = 1;
				categoryAxis.renderer.inversed = true;
				categoryAxis.renderer.grid.template.disabled = true;

				var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
				valueAxis.min = 5000;
				valueAxis.extraMax = 0.1;
				valueAxis.rangeChangeEasing = am4core.ease.linear;
				valueAxis.rangeChangeDuration = 1500;

				var series = chart.series.push(new am4charts.ColumnSeries());
				series.dataFields.categoryX = "dong";
				series.dataFields.valueY = "perprice";
				series.tooltipText = "{valueY.value}"
				series.columns.template.strokeOpacity = 0;
				series.columns.template.column.cornerRadiusTopRight = 10;
				series.columns.template.column.cornerRadiusTopLeft = 10;
				series.interpolationDuration = 1500;
				series.interpolationEasing = am4core.ease.linear;

				var labelBullet = series.bullets.push(new am4charts.LabelBullet());
				labelBullet.label.verticalCenter = "bottom";
				labelBullet.label.dy = -10;
				labelBullet.label.text = "{values.valueY.workingValue.formatNumber('#.')}";

				chart.zoomOutButton.disabled = true;

				// as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
				series.columns.template.adapter.add("fill", function (fill, target) {
				 return chart.colors.getIndex(target.dataItem.index);
				});



				//연도 바뀌는 쪽 소스

				//시작하는 년도
				var year = 2010;
				label.text = year.toString();

				var interval;

				function play() {
				  interval = setInterval(function(){
				    nextYear();
				  }, stepDuration)
				  nextYear();
				}

				function stop() {
				  if (interval) {
				    clearInterval(interval);
				  }
				}

				function nextYear() {
				  year++

				  //2010~2020년을 보여주기 위함이니까, 2020년까지 끝나면 2010년으로 다시 가줘
				  if (year > 2020) {
				    year = 2010;
				  }

				  var newData = allData[year];
				  var itemsWithNonZero = 0;
				  for (var i = 0; i < chart.data.length; i++) {
				    chart.data[i].perprice = newData[i].perprice;
				    if (chart.data[i].perprice > 0) {
				      itemsWithNonZero++;
				    }
				  }

				  if (year == 2010) {
				    series.interpolationDuration = stepDuration / 4;
				    valueAxis.rangeChangeDuration = stepDuration / 4;
				  }
				  else {
				    series.interpolationDuration = stepDuration;
				    valueAxis.rangeChangeDuration = stepDuration;
				  }

				  chart.invalidateRawData();
				  label.text = year.toString();

				  categoryAxis.zoom({ start: 0, end: itemsWithNonZero / categoryAxis.dataItems.length });
				}


				chart.data = JSON.parse(JSON.stringify(allData[year]));


				series.events.on("inited", function() {
				  setTimeout(function() {
				    playButton.isActive = true; // this starts interval
				  }, 2000)
				})



				categoryAxis.sortBySeries = series;

				}); // end am4core.ready()
			
		};
	}	
	
}