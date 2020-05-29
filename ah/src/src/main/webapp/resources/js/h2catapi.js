function showCat1(){
	var request = new XMLHttpRequest();
	var formdata = new FormData();
	
	formdata.enctype='multipart/form-data';
	formdata.method='post';
	formdata.action='/ah/cat1';
	
	request.open('post', '/ah/cat1', true);
	request.send(formdata);

	request.onload = function(event) {
		if (request.status == 200) {
			var str = request.responseText;
			var catlist = JSON.parse(str);
			var listElement = document.querySelector('#contentList3');
			var str = '';
			console.log(catlist);
			for(i = 1; i < catlist.length; i++){
				str += "<a href='#' onclick='chooseCat1("+"\""+catlist[i].catname+"\")'>"+catlist[i].catname+"</a>";
			}
			listElement.innerHTML = str;
		};
	}	
	
	if(document.querySelector('#list3').classList.toggle('display'))
		document.querySelector('#list3').style.display='block';
	else 
		document.querySelector('#list3').style.display='none';
}
function showCat2(){
	
	var request = new XMLHttpRequest();
	var formdata = new FormData();
	
	formdata.enctype='multipart/form-data';
	formdata.method='post';
	formdata.action='/ah/cat2';
	
	request.open('post', '/ah/cat2', true);
	request.send(formdata);

	request.onload = function(event) {
		if (request.status == 200) {
			var str = request.responseText;
			var catlist = JSON.parse(str);
			var listElement = document.querySelector('#contentList4');
			var str = '';
			console.log(catlist);
			for(i = 1; i < catlist.length; i++){
				str += "<a href='#' onclick='chooseCat2("+"\""+catlist[i].catname+"\")'>"+catlist[i].catname+"</a>";
			}
			listElement.innerHTML = str;
		};
	}	
	
	
	if(document.querySelector('#list4').classList.toggle('display'))
		document.querySelector('#list4').style.display='block';
	else 
		document.querySelector('#list4').style.display='none';
}
function showCat3(){
	
	var request = new XMLHttpRequest();
	var formdata = new FormData();
	
	formdata.enctype='multipart/form-data';
	formdata.method='post';
	formdata.action='/ah/cat3';
	
	request.open('post', '/ah/cat3', true);
	request.send(formdata);

	request.onload = function(event) {
		if (request.status == 200) {
			var str = request.responseText;
			var catlist = JSON.parse(str);
			var listElement = document.querySelector('#contentList5');
			var str = '';
			console.log(catlist);
			for(i = 1; i < catlist.length; i++){
				str += "<a href='#' onclick='chooseCat3("+"\""+catlist[i].catname+"\")'>"+catlist[i].catname+"</a>";
			}
			listElement.innerHTML = str;
		};
	}	
	
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


function searchCat(){
			
	var guname = document.querySelector('#provName1').firstChild.textContent.trim();
	let dongname = document.querySelector('#townName1').firstChild.textContent.trim();
	let cat1name = document.querySelector('#cat1').firstChild.textContent.trim();
	let cat2name = document.querySelector('#cat2').firstChild.textContent.trim();
	let cat3name = document.querySelector('#cat3').firstChild.textContent.trim();

	// ajax - 선택 된 카테고리	
	var request = new XMLHttpRequest();
	var formdata = new FormData();
	
	formdata.enctype='multipart/form-data';
	formdata.method='post';
	formdata.action='/ah/cat123option';
	formdata.append('gu', guname.toString());
	formdata.append('dong', dongname.toString());
	formdata.append('cat1name', cat1name.toString());
	formdata.append('cat2name', cat2name.toString());
	formdata.append('cat3name', cat3name.toString());

	
	request.open('post', formdata.action , true);
	request.send(formdata);

	request.onload = function(event) {
		if (request.status == 200) {
			//alert("test");
			var str = request.responseText;
			var result1 = JSON.parse(str);
			console.log(result1);
			//카카오 맵			
			// 이전에 있던 마커 지우기
			setMarkers(null);
			for(i = 0; i < result1.length; i++){
				addMarkerCircle(new kakao.maps.LatLng(result1[i].aptlat, result1[i].aptlng),result1[i].aptname);
			}
			
		};
	}	
}