function drawGraph(chartname, rdata, df){
	am4core.ready(function() {

		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		// Create chart instance
		var chart = am4core.create(chartname, am4charts.XYChart);
				
		chart.data = rdata;
		
		// Create axes
		var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
		dateAxis.renderer.grid.template.location = 0;
		dateAxis.renderer.minGridDistance = 50;
		dateAxis.renderer.grid.template.disabled = true;
		dateAxis.renderer.fullWidthTooltip = true;

		// Create value axis
		var yAxis = chart.yAxes.push(new am4charts.ValueAxis());

		
		// Create series -> 배열로 받아오기
		var series = [];
		var bullet = [];
	
		for(var i=0; i<df.length; i++){
			series[i] = chart.series.push(new am4charts.LineSeries());
			series[i].dataFields.dateX = "date";
			series[i].dataFields.valueY = df[i].valuey;
			series[i].dataFields.value = df[i].value;
			series[i].strokeWidth = 2;

			bullet[i] = series[i].bullets.push(new am4charts.CircleBullet());
			series[i].heatRules.push({
				target : bullet[i].circle,
				min : 0,
				max : 5,
				property : "radius"
			});
			bullet[i].tooltipText = "{date} 평균실거래가: [bold]{valueY}[/]";
		}
		//scrollbars
		chart.scrollbarX = new am4core.Scrollbar();
		chart.scrollbarY = new am4core.Scrollbar();

	});
}



function getDataField(chartname, aptname, rdata){
	
	var request = new XMLHttpRequest();
	var formdata = new FormData();
	
	formdata.enctype='multipart/form-data';
	formdata.method='post';
	formdata.action='/ah/graph1/df/' + aptname;
	console.log(formdata.action);
	request.open('post', formdata.action, true);
	request.send(formdata);

	request.onload = function(event) {
		if (request.status == 200) {
			//alert("test2222");
			
			var str = request.responseText;
			var df= JSON.parse(str); // db 데이터로 둬야함.
			
			console.log(df);
			drawGraph(chartname, rdata, df);
		}
	}				
}

function showAptGraph(chartname, aptname){
	
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
			//alert("test!!!");
			
			var str = request.responseText;
			var rdata= JSON.parse(str); // db 데이터로 둬야함.
			
			console.log(rdata);
			getDataField(chartname, aptname, rdata);
			
		};
	}	
}

