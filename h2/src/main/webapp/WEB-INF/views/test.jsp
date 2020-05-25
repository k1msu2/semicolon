<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		//돔은 자바스크립트 등의 프로그램이 HTML 요소를 조작할 수 있게 하는 인터페이스이다.
		//돔을 이요하면 body 요소의 바깥에서 body 요소 안에 있는 HTML 요소를 조작할 수 있다. 
		//자바스크립트의 실행 문맥은 렉시컬 환경 컴포넌트, 변수 환경 컴포넌트, 디스 바인딩 컴포넌트의 3가지 컴포넌트로 나뉨
		// 렉시컬 환경 컴포넌트 : 자바스크립트 실행 엔진이 자바스크립트 코드를 실행하기 위한 자원을 모아놓은 곳
		// 환경 레코드와 외부 렉시컬 환경 참조 컴포넌트로 구성, 환경레코드는 선언적 환경 레코드(식별자와 실행결과 저장)와 객체 환경 레코드(객체의 레퍼런스 관리)로 분리
		// 외부 렉시컬 환경 참조 컴포넌트는 전역변수가 아닌 회부 함수의 변수 및 함수에 접근 할 수 있다.
		// 이것을 통해 자바스크립트는 클로져라는 기능을 제공할 수 있다.
		// 클로져는 내부함수가 회부함수의 데이터에 접근하는 것을 말한다.
		// 디스 바인딩 컴포넌트는 키워드 this 를 관리하는 컴포넌트.

		function test() {
			var d = new Date();
			console.log(d.toLocaleString());
		}

		/* 		window.onload = function() {
		 var button = document.getElementById("button");
		 button.onclick = test;
		 }; */

		/* 		loop: while (true) {
		 if (confirm("종료하시겠습니까?"))
		 break loop; // 확인을 클릭해야만 빠져나옴.
		 } */

		function makeCounter() {
			var count = 0;
			return f;
			function f() {
				return count++;
			}
		}

		var counter = makeCounter();
		console.log(counter());
		console.log(counter());
		console.log(counter());

		var counter1 = makeCounter();
		var counter2 = makeCounter();
		console.log(counter1());
		console.log(counter2());
		console.log(counter1());
		console.log(counter2());

		function Person(name, age) {
			var _name = name;
			var _age = age;
			return {
				getName : function() {
					return _name;
				},
				getAge : function() {
					return _age;
				},
				setAge : function(x) {
					_age = x;
				}
			};
		}

		var person = Person("Tom", 18);
		console.log(person.getName());
		console.log(person.getAge());
		person.setAge(19);
		console.log(person.getAge());

		function makeMultiplier(x) {
			return function(y) {
				return x * y;
			};
		}

		var multi2 = makeMultiplier(2);
		var multi10 = makeMultiplier(10);
		console.log(multi2(3));
		console.log(multi10(3));

		console.log("-------------------");
		window.onload = function() {
			var elm = document.getElementsByTagName("input");
			console.log(elm.length);
			for (var i = 0; i < elm.length; i++)(function(_i) {
				elm[_i].onclick = function() {
					console.log(_i);
				};
			})(i);
		};
		
		var myApp = myApp || {};
		
		myApp.name = "Tom";
		myApp.showName = function() {console.log("test")};
		
		//sub name space
		myApp.view = {};
		myApp.controls = {};
		
		myApp.view.draw = function(){};
		myApp.controls.timeInterval = 16;
		
		console.log("----------------------");
		var x = "global x";
		(function(){
			var x = "local x";
			var y = "local y";
		})();
		
		console.log(x);
		//console.log(y);
		
		// 실행 함수를 사용하여 모듈을 정의하는 방법
		var Module = Module || {};
		(function(_Module){
			var name = "NoName";
			function getName(){
				return name;
			}
			_Module.showName = function(){
				console.log(getName());
			};
			_Module.setName = function(x){
				name = x;
				
			}
		})(Module);
		Module.setName("Tom222222");
		Module.showName(); // Tome
		
		function say(g, h){
			console.log(g + " " + h + " " + this.name);
		}
		
		var tom = {name : "Tom 333"};
		var becky = {name : "su2222"};
		say.apply(tom, ["hello!", "test"]);
		say.call(becky, "Hello!", "sui");
		var test = say.bind(becky);
		test("test", "bye");
		
		function partial(f){
			var args = arguments;
			return function(){
				var a = Array.prototype.slice.call(args, i);
				for(var i = 0, j = 0; i < a.length; i++){
					if(a[i] == undefined) a[i] = arguments[j++];	
				}
				return f.apply(this, a);
			};
		}
	
		var square = partial(Math.pow, undefined, 2);
		var exp = partial(Math.pow, Math.E, undefined);
		
		var obj = {
			say:function(){
				console.log(this);
				var f = function(){console.log(this);};
			}	
		};
	</script>
	

	<input type="button" value="0">
	<input type="button" value="1">
	<input type="button" value="2">

</body>
</html>