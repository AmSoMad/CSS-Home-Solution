<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@include file="../views/includes/header.jsp" %>
 
<!--div class="row row-offcanvas row-offcanvas-left" 에 묶여있는 body단.-->

				<div class="col main pt-5 mt-3">
				<div class="row mb-3">
				<div class="col-xl-3 col-sm-6 py-2">
					<div class="card-body bg-success">
						<div class="card bg-success text-white h-100">
							<div class="card-body bg-success">
								<div class="rotate">
									<i class="fa fa-user fa-4x"></i>
								</div>
								<h6 class="text-uppercase">MQ 2</h6>
								<h1 class="display-4">
									<p id="Sensor1"></p>
								</h1>
							</div>
								<!-- 여기다가 값 전송 테스트 -->
							</div>
						</div>
				</div>
				</div>
				<div class="chart-container" style="position: relative; height:200px; width:300px">
							<canvas id="myChart"></canvas>
						</div>
						<h4>Responsive</h4>
						<span class="text-muted">Device agnostic</span>
				</div>
			<!--/main col-->
				<script type="text/javascript" src="/js/sensor.js" ></script> 
<%@include file="../views/includes/footer.jsp" %>