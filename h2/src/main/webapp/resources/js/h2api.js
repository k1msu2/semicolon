function reqDeleteReview(review_id) {
	var request = new XMLHttpRequest();
	var formdata = new FormData();
	
	formdata.enctype='multipart/form-data';
	formdata.method='post';
	formdata.action='/javas/jobreviewdelete';
	
	formdata.append('review_id', review_id);
	request.open('post', '/javas/jobreviewdelete', true);
	request.send(formdata);

	request.onload = function(event) {
		if (request.status == 200) {
			var str = request.responseText;
			reqReviewList();	
		}
	}
}

function chooseCat1(name) {
	var request = new XMLHttpRequest();
	var formElement = document.getElementById("reviewform");
	var formdata = new FormData(formElement);
	
	formdata.enctype='multipart/form-data';
	formdata.method='post';
	formdata.action='/h2/gu/'+name;
	
	console.log(name);
	
	request.open('post', '/javas/jobreviewupdate', true);
	request.send(formdata);

	request.onload = function(event) {
		if (request.status == 200) {
			var str = request.responseText;
			reqReviewList();
		}
	}
}

function showProvince(){
	
	var request = new XMLHttpRequest();
	var formElement = document.getElementById("reviewform");
	
	if(document.querySelector('#list1').classList.toggle('display'))
		document.querySelector('#list1').style.display='block';
	else 
		document.querySelector('#list1').style.display='none';
}
function showTown(){
	if(document.querySelector('#list2').classList.toggle('display'))
		document.querySelector('#list2').style.display='block';
	else 
		document.querySelector('#list2').style.display='none';
}
function chooseProvince(name){
	document.querySelector('#provName1').innerHTML= '&nbsp;' + name + '&nbsp;';
	// 리스트 삭제
	if(document.querySelector('#list1').classList.toggle('display'))
		document.querySelector('#list1').style.display='block';
	else 
		document.querySelector('#list1').style.display='none';
	// 맵 위치 변경
}
function chooseTown(name){
	document.querySelector('#townName1').innerHTML='&nbsp;' + name + '&nbsp;';
	// 리스트 삭제
	if(document.querySelector('#list2').classList.toggle('display'))
		document.querySelector('#list2').style.display='block';
	else 
		document.querySelector('#list2').style.display='none';
	// 맵 위치 변경
}
function showCat1(){
	if(document.querySelector('#list3').classList.toggle('display'))
		document.querySelector('#list3').style.display='block';
	else 
		document.querySelector('#list3').style.display='none';
}
function showCat2(){
	if(document.querySelector('#list4').classList.toggle('display'))
		document.querySelector('#list4').style.display='block';
	else 
		document.querySelector('#list4').style.display='none';
}
function showCat3(){
	if(document.querySelector('#list5').classList.toggle('display'))
		document.querySelector('#list5').style.display='block';
	else 
		document.querySelector('#list5').style.display='none';
}
function chooseCat1(name){
	document.querySelector('#cat1').innerHTML= name;
	if(document.querySelector('#list3').classList.toggle('display'))
		document.querySelector('#list3').style.display='block';
	else 
		document.querySelector('#list3').style.display='none';
}
function chooseCat2(name){
	document.querySelector('#cat2').innerHTML=name;
	if(document.querySelector('#list4').classList.toggle('display'))
		document.querySelector('#list4').style.display='block';
	else 
		document.querySelector('#list4').style.display='none';
}
function chooseCat3(name){
	document.querySelector('#cat3').innerHTML=name;
	if(document.querySelector('#list5').classList.toggle('display'))
		document.querySelector('#list5').style.display='block';
	else 
		document.querySelector('#list5').style.display='none';
}

// 리스트에서  gu 클릭했을때 지도의 중심의 위치 map 만 변하도록.
function showGu(gu) {
	var request = new XMLHttpRequest();
	var formdata = new FormData();
	
	formdata.enctype='multipart/form-data';
	formdata.method='post';
	formdata.action='/h2/gu/'+ gu;
	
	request.open('post', '/h2/gu/'+ gu, true);
	request.send(formdata);			

	request.onload = function(event) {
		if (request.status == 200) {
			var str = request.responseText;
			// 좌표 리턴하고 카카오 맵 다시 렌더링
			var pos = JSON.parse(str);
			// 맵 출력 부분
			map.setLevel(6, {anchor: new kakao.maps.LatLng(pos.lat, pos.lng), animate: true});
			map.setCenter(new kakao.maps.LatLng(pos.lat, pos.lng));
			
			// 지역구명 변경
			chooseProvince(gu);
			
		};
	}
}