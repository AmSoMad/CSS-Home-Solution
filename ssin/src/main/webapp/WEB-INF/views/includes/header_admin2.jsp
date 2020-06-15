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
/*       https://codepen.io/pirrera/pen/bqVeGx     */
/* Magic Stuff End -> */
	
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
  <body >
 

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
				<li class="nav-item"><a class="nav-link"
					href="//www.codeply.com">Link</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link">회원수 ${MemberCount } </a> 
				</li>			
				<li class="nav-item">
					<a class="nav-link" href="logout">관리자 로그아웃</a>
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
						data-toggle="collapse" data-target="#submenu1">회원정보▾</a>
						<ul class="list-unstyled flex-column pl-3 collapse" id="submenu1" aria-expanded="false">
							<li class="nav-item"><a class="nav-link" href="MemberList.bo">회원리스트 조회</a></li>
							<li class="nav-item"><a class="nav-link" href="MemberModify.bo">회원정보 수정</a></li>
							<li class="nav-item"><a class="nav-link" href="MemberDelete.bo">회원정보 삭제</a></li>
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