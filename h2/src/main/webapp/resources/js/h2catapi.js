
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
