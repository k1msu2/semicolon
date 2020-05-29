// gu list
function showProvince(){
	
	//alert("showProvince");
	//ajax - gu 정보 가져오기
	var request = new XMLHttpRequest();
	var formdata = new FormData();
	
	formdata.enctype='multipart/form-data';
	formdata.method='post';
	formdata.action='/ah/gu';
	
	request.open('post', '/ah/gu', true);
	request.send(formdata);

	request.onload = function(event) {
		if (request.status == 200) {
			//alert("test!!!");
			var str = request.responseText;
			// 지역구 리스트 리턴
			var gulist = JSON.parse(str);
			// 지역구 리스트 출력
			//console.log(gulist);
			var listElement = document.querySelector('#contentList1');
			var str = '';
			console.log(gulist);
			for(i = 0; i < gulist.length; i++){
				str += "<a href='#' onclick='showGuCenter("+"\""+gulist[i].gu+"\""+","+gulist[i].lat+","+gulist[i].lng+")'>"+gulist[i].gu+"</a>";
			}
			listElement.innerHTML = str;
			
		};
	}
			
	
	if(document.querySelector('#list1').classList.toggle('display'))
		document.querySelector('#list1').style.display='block';
	else 
		document.querySelector('#list1').style.display='none';

}

// 구 단위로 클릭했을 때
// 리스트에서  gu 클릭했을때 지도의 중심의 위치 map 만 변하도록.
function showGuCenter(gu, lat, lng) {	
	
	//alert("showGuCenter");
	// 리스트 닫기
	chooseProvince(gu, lat, lng);
	
	//contentList1 text 데이터 가져오기	
	var request = new XMLHttpRequest();
	var formdata = new FormData();
	
	formdata.enctype='multipart/form-data';
	formdata.method='post';
	formdata.action='/ah/gu/'+gu;
	
	request.open('post', '/ah/gu/'+gu, true);
	request.send(formdata);

	request.onload = function(event) {
		if (request.status == 200) {
			var str = request.responseText;
			// 지역구 리스트 리턴
			var donglist = JSON.parse(str);
			console.log(donglist);
			// 지역구 리스트 출력
			var listElement = document.querySelector('#contentList2');
			// db gu list 출력
			var str = '';
			for(i = 0; i < donglist.length; i++){
				str += "<a href='#' onclick='chooseTown("+"\""+donglist[i].dong+"\""+","+donglist[i].lat+","+donglist[i].lng+")'>"+donglist[i].dong+"</a>";
			}
			
			console.log(str);
			listElement.innerHTML = str;			
			document.querySelector('#townName1').innerHTML='&nbsp;전 체&nbsp;';

		};
	}

}

function showTown(){
	// 리스트 삭제
	if(document.querySelector('#list2').classList.toggle('display'))
		document.querySelector('#list2').style.display='block';
	else 
		document.querySelector('#list2').style.display='none';
	// 맵 위치 변경
}

//list
function chooseProvince(gu, lat, lng){
	map.setLevel(7, {anchor: new kakao.maps.LatLng(lat, lng)});
	map.setCenter(new kakao.maps.LatLng(lat, lng));
	
	document.querySelector('#provName1').innerHTML= '&nbsp;' + gu + '&nbsp;';
	// 리스트 삭제
	if(document.querySelector('#list1').classList.toggle('display'))
		document.querySelector('#list1').style.display='block';
	else 
		document.querySelector('#list1').style.display='none';
	// 맵 위치 변경
}
//리스트에서  gu 클릭했을때 지도의 중심의 위치 map 만 변하도록.
//리스트 클릭할 떄
function chooseTown(dong, lat, lng) {
	map.setLevel(4, {anchor: new kakao.maps.LatLng(lat, lng)});
	map.setCenter(new kakao.maps.LatLng(lat, lng));

	document.querySelector('#townName1').innerHTML='&nbsp;' + dong + '&nbsp;';
	// 리스트 삭제
	if(document.querySelector('#list2').classList.toggle('display'))
		document.querySelector('#list2').style.display='block';
	else 
		document.querySelector('#list2').style.display='none';
	
}


