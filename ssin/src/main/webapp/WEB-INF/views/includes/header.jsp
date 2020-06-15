<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/jquery.table2CSV.js"></script>
<script type="text/javascript" src="../js/jquery.TableCSVExport.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
	
 <link rel="manifest" href="../js/manifest.json" />
  <link rel="stylesheet" href="../css/styles_Stellar.css" />
  <link rel="stylesheet" href="../data/flot-data.js" />
  <link rel="stylesheet" href="../data/morris-data.js" />
  <!-- <script type="text/javascript" src="https://www.google.com/jsapi"></script> -->
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">


<% 
int count1 = 0; 
int count2 = 0;
int count3 = 0;
int count4 = 0;
int count1_a = 0; 
int count2_a = 0;
int count3_a = 0;
int count4_a = 0;
%>
	<script type="text/javascript" >
	//크롬 -> 설정 -> 사이트 설정 -> 소리 -> 해당사이트 주소 추가
	var audioFile = new Audio('/resources/Sound/start.m4a');
	var mq2_Sound = new Audio('/resources/Sound/mq2.m4a');
	var mq7_Sound = new Audio('/resources/Sound/mq7.m4a');
	var vi_Sound = new Audio('/resources/Sound/vi.m4a');
	var wave_Sound = new Audio('/resources/Sound/wave.m4a');
	audioFile.currentTime = 0;
	mq2_Sound.currentTime = 0.5;
	mq7_Sound.currentTime = 0.5;
	vi_Sound.currentTime = 0.5;
	wave_Sound.currentTime = 0.5;
	
		$(window).load(function() {    
			  audioFile.play();
			$('#loading').show();  
			setTimeout(function() {
				$('#loading').hide();  
				}, 5000);
		    });
		
		
    document.addEventListener("DOMContentLoaded", function() {setInterval(updateSenser1,1000);});
    document.addEventListener("DOMContentLoaded", function() {setInterval(updateSenser2, 1000);});
    document.addEventListener("DOMContentLoaded", function() {setInterval(updateSenser3, 1000);});
    document.addEventListener("DOMContentLoaded", function() {setInterval(updateSenser4, 1000);});
    document.addEventListener("DOMContentLoaded", function() {setInterval(draw, 1000);});
   
	var sensor1=600;
	var sensor2=600;
	var sensor3=40;
	var sensor4=0;
	var count1 = 0;
	var count2 = 0;
	var count3 = 0;
	var count4 = 0;

    function updateSenser1() {
    	$.ajax({
    		url:"http://192.168.3.18:8090/GetSensor_1",//http://192.168.3.18:8090  http://192.168.35.196:8090
    		type:"get",
    		cache:false,
    		success:function(data){
    			sensor1 = Number(data);
    			$("#Sensor1").html(data);
    			data=null;
    		}
    		
    	})		;
		if(sensor1 > 700 ){
       		
       		count1 ++;
       		if(count1 > 5){
       			mq2_Sound.play();
       			//alert("유해연기 유입중!");
       			count1 = 0;
       		}
       	}
    	
	}
    function updateSenser2() {
    	$.ajax({
    		url:"http://192.168.3.18:8090/GetSensor_2",
    		type:"get",
    		cache:false,
    		success:function(data){
    			sensor2 = Number(data);
    			$("#Sensor2").html(data);
    			data=null;
    		}
    		
    	})		;
		if(sensor2 > 800){
       		
       		count2 ++;
       		if(count2 > 5){
       			mq7_Sound.play();
       			//alert("일산화탄소 감지!");
       			count2 = 0;
       		}
       	}
    	
	}
    function updateSenser3() {
    	$.ajax({
    		url:"http://192.168.3.18:8090/GetSensor_3",
    		type:"get",
    		cache:false,
    		success:function(data){
    			sensor3 = Number(data);
    			$("#Sensor3").html(data);
    			data=null;
    		}
    		
    	})		;
		if(sensor3 > 100 ){
       		
       		count3 ++;
       		if(count3 > 5){
       			vi_Sound.play();
       			//alert("층간소음발생!");
       			count3 = 0;
       		}
       	}
    	
	}
    function updateSenser4() {
    	$.ajax({
    		url:"http://192.168.3.18:8090/GetSensor_4",
    		type:"get",
    		cache:false,
    		success:function(data){
    			sensor4 = Number(data);
    			$("#Sensor4").html(data);
    			data=null;
    		}
    		
    	})		;
    	if(sensor4 > 1000 ){
       		
       		count4 ++;
       		if(count4 > 5){
       			wave_Sound.play();
       			//alert("침입자 발생!");
       			count4 = 0;
       		}
       	}
	}
    </script> 


	 <style>
      .chart{
        border: 1px solid orange;
        float: left;
        margin: 30px;
      }
	      #loading {
		 width: 100%;   
		 height: 100%;   
		 top: 0px;
		 left: 0px;
		 position: fixed;   
		 display: block;   
		 opacity: 0.7;   
		 background-color: #fff;   
		 z-index: 99;   
		 text-align: center; }  
		  
		#loading-image {   
		 position: absolute;   
		 top: 50%;   
		 left: 50%;  
		 z-index: 100; } 
		 .type {
	    border-collapse: collapse;
	    text-align: left;
	    line-height: 1.5;
	    border-left: 1px solid #ccc;
	    margin: 20px 10px;

	}
	
	.type thead th {
	    padding: 10px;
	    font-weight: bold;
	    border-top: 1px solid #ccc;
	    border-right: 1px solid #ccc;
	    border-bottom: 2px solid #c00;
	    background: #dcdcd1;
	
	}
	.type tbody th {
	    width: 150px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-right: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	    background: #ececec;
	  
	}
	.type td {
	    width: 350px;
	    padding: 10px;
	    vertical-align: top;
	    border-right: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	 
	}
	.btn {
		  flex: 1 1 auto;
		  margin: 10px;
		  padding: 30px;
		  text-align: center;
		  text-transform: uppercase;
		  transition: 0.5s;
		  background-size: 200% auto;
		  color: white;
		 /* text-shadow: 0px 0px 10px rgba(0,0,0,0.2);*/
		  box-shadow: 0 0 20px #eee;
		  border-radius: 10px;
		 }
		
		/* Demo Stuff End -> */
		
		/* <- Magic Stuff Start */
		
		.btn:hover {
		  background-position: right center; /* change the direction of the change here */
		}
		.btn-2 {
		  background-image: linear-gradient(to right, #fbc2eb 0%, #a6c1ee 51%, #fbc2eb 100%);
		}
		
		/* Sass 를 css롤 변환  및 pug파일을 html로 변환한 데이터 ㅎ ㅏ... 개뻘짖했었따...*/


		.button_1d {
		color: #28a746 !important;
		text-transform: uppercase;
		background: #ffffff;
		padding: 20px;
		border: 4px solid #28a746 !important;
		border-radius: 6px;
		display: inline-block;
		transition: all 0.3s ease 0s;
		}
		
		.button_1d:hover {
		color: #494949 !important;
		border-radius: 50px;
		border-color: #494949 !important;
		transition: all 0.3s ease 0s;
		}
		.button_2d {
		color: #dc3546 !important;
		text-transform: uppercase;
		background: #ffffff;
		padding: 20px;
		border: 4px solid #dc3546 !important;
		border-radius: 6px;
		display: inline-block;
		transition: all 0.3s ease 0s;
		}
		
		.button_2d:hover {
		color: #494949 !important;
		border-radius: 50px;
		border-color: #494949 !important;
		transition: all 0.3s ease 0s;
		}
		.button_3d {
		color: #17a3b8 !important;
		text-transform: uppercase;
		background: #ffffff;
		padding: 20px;
		border: 4px solid #17a3b8 !important;
		border-radius: 6px;
		display: inline-block;
		transition: all 0.3s ease 0s;
		}
		
		.button_3d:hover {
		color: #494949 !important;
		border-radius: 50px;
		border-color: #494949 !important;
		transition: all 0.3s ease 0s;
		}
		.button_4d {
		color: #ffc107 !important;
		text-transform: uppercase;
		background: #ffffff;
		padding: 20px;
		border: 4px solid #ffc107 !important;
		border-radius: 6px;
		display: inline-block;
		transition: all 0.3s ease 0s;
		}
		
		.button_4d:hover {
		color: #494949 !important;
		border-radius: 50px;
		border-color: #494949 !important;
		transition: all 0.3s ease 0s;
		}		
		.button_5d {
		color: #000000 !important;
		text-transform: uppercase;
		background: #ffffff;
		padding: 20px;
		border: 4px solid #000000 !important;
		border-radius: 6px;
		display: inline-block;
		transition: all 0.3s ease 0s;
		}
		
		.button_5d:hover {
		color: #494949 !important;
		border-radius: 50px;
		border-color: #ff0000 !important;
		transition: all 0.3s ease 0s;
		}	

		
    </style>
	
    <meta charset="utf-8">
    <title>씬이나</title>
    <meta name="description" content="A Bootstrap 4 admin dashboard theme that will get you started. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards. The top navbar is controlled by a separate hamburger toggle button." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/styles_Stellar.css" />
		
  </head>
  <body>
   <div id="loading"><img id="loading-image" src="/resources/img/805.gif" alt="Loading..." /></div>

	<nav
		class="navbar fixed-top navbar-expand-md navbar-dark bg-primary mb-3">
		<div class="flex-row d-flex">
			<button type="button" class="navbar-toggler mr-2 "
				data-toggle="offcanvas" title="Toggle responsive left sidebar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a class="navbar-brand" href="#"
				title="Free Bootstrap 4 Admin Template">씬이나 CSS-Home Dashboard</a>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsingNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse" id="collapsingNavbar">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="index">Home
						<span class="sr-only">Home</span>
				</a></li>
			
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link">누적수치</a>
				</li>			
				<li class="nav-item">
					<a class="nav-link">유해연기 ${count_Add_1 }</a>
				</li>
								<li class="nav-item">				
					<a class="nav-link">일산화탄소 ${count_Add_2 }</a>
				</li>
								<li class="nav-item">
					<a class="nav-link">층간소음 ${count_Add_3 }</a>
				</li>
				<li class="nav-item">
					<a class="nav-link">침입감지 ${count_Add_4 }</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/member/memberviewdetail">내정보 수정</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="logout">로그아웃</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid" id="main">
		<div class="row row-offcanvas row-offcanvas-left">
			<div class="col-md-3 col-lg-2 sidebar-offcanvas bg-light pl-0"
				id="sidebar" role="navigation">
				<ul class="nav flex-column sticky-top pl-0 pt-5 mt-3">
					<li class="nav-item"><a class="nav-link" href="index">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#submenu1"
						data-toggle="collapse" data-target="#submenu1">센서별 상세 현황▾</a>
						<ul class="list-unstyled flex-column pl-3 collapse" id="submenu1" aria-expanded="false">
							<li class="nav-item"><a class="nav-link" href="ViewDetails.bo">MQ2(유해연기)</a></li>
							<li class="nav-item"><a class="nav-link" href="ViewDetails.bo">MQ7(일산화탄소)</a></li>
							<li class="nav-item"><a class="nav-link" href="ViewDetails.bo">진동(층간소음)</a></li>
							<li class="nav-item"><a class="nav-link" href="ViewDetails.bo">초음파(침입감지)</a></li>
						</ul></li>
						<li class="nav-item"><a class="nav-link" href="#submenu2"
						data-toggle="collapse" data-target="#submenu2">고객센터▾</a>
						<ul class="list-unstyled flex-column pl-3 collapse" id="submenu2" aria-expanded="false">
							<li class="nav-item"><a class="nav-link" href="board.bo">고객게시판</a></li>
							<li class="nav-item"><a class="nav-link" href="inspection.bo">점검요청</a></li>
							</ul></li>
				</ul>
			</div>
			<!--/col-->