<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	 

<%@include file="../views/includes/header.jsp" %>
	
			<div class="col main pt-5 mt-3">
				<h1 class="display-4 d-none d-sm-block">CSS-Home Web Solution</h1>
				<div class="lead d-none d-sm-block">실시간 센서 확인으로 집 안의 안전사고를 예방하세요.
				<button id="test1_Btn" onclick="test1_click();" class="button_1d" >테스트1</button> 
				<button id="test2_Btn" onclick="test2_click();" class="button_2d" >테스트2</button>
				<button id="test3_Btn" onclick="test3_click();" class="button_3d" >테스트3</button>
				<button id="test4_Btn" onclick="test4_click();" class="button_4d" >테스트4</button>
				<button id="test5_Btn" onclick="test5_click();" class="button_5d" >점검요청하기</button>
				<div>
					
				
				<div class="row mb-3">
					<div class="col-xl-3 col-sm-6 py-2">
						<div class="card bg-success text-white h-100">
							<div class="card-body bg-success">
								<div class="rotate">
									<i class="fa fa-user fa-4x"></i>
								</div>
								<h6 class="text-uppercase">MQ 2 - 금일 감지수 ${count_Day1 })
								</h6>
								<h1 class="display-4">
									<p id="Sensor1"></p>
									
								</h1>
								<!-- 여기다가 값 전송 테스트 -->
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 py-2">
						<div class="card text-white bg-danger h-100">
							<div class="card-body bg-danger">
								<div class="rotate">
									<i class="fa fa-list fa-4x"></i>
								</div>
								<h6 class="text-uppercase">MQ 7 - 금일 감지수 ${count_Day2 }								
								</h6>
								<h1 class="display-4">
									<p id="Sensor2"></p>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 py-2">
						<div class="card text-white bg-info h-100">
							<div class="card-body bg-info">
								<div class="rotate">
									<i class="fa fa-twitter fa-4x"></i>
								</div>
								<h6 class="text-uppercase">진동(층간소음) - 금일 감지수 ${count_Day3 }
								</h6>
								<h1 class="display-4">
									<p id="Sensor3"></p>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 py-2">
						<div class="card text-white bg-warning h-100">
							<div class="card-body">
								<div class="rotate">
									<i class="fa fa-share fa-4x"></i>
								</div>
								<h6 class="text-uppercase">초음파 - 금일 감지수 ${count_Day4 }
								</h6>
								<h1 class="display-4">
									<p id="Sensor4"></p>
								</h1>
							</div>
						</div>
					</div>
				</div>
				<!--/row-->

				<hr>
				<div class="row placeholders mb-3">
					<div class="col-6 col-sm-3 placeholder text-center">
						<div class="chart-container" style="position: relative; height:200px; width:300px">
							<canvas id="myChart"></canvas>
						</div>
						<h4><a class="nav-link" href="ViewDetails.bo">유해연기</a></h4>
						<span class="text-muted"> 700 이상</span>
					</div>
					<div class="col-6 col-sm-3 placeholder text-center">
						<div class="chart-container" style="position: relative; height:200px; width:300px">
							<canvas id="myChart1"></canvas>
						</div>
						<h4><a class="nav-link" href="ViewDetails.bo">일산화탄소</a></h4>
						<span class="text-muted"> 800 이상</span>
					</div>
					<div class="col-6 col-sm-3 placeholder text-center">
						<div class="chart-container" style="position: relative; height:200px; width:300px">
							<canvas id="myChart2"></canvas>
						</div>
						<h4><a class="nav-link" href="ViewDetails.bo">층간소음</a></h4>
						<span class="text-muted"> 100 이상</span>
					</div>
					<div class="col-6 col-sm-3 placeholder text-center">
						<div class="chart-container" style="position: relative; height:200px; width:300px">
							<canvas id="myChart3"></canvas>
						</div>
						<h4><a class="nav-link" href="ViewDetails.bo">침입감지</a></h4>
						<span class="text-muted"> 1000 이상</span>
					</div>
				</div>
				<hr>
				<h2 class="mt-5">센서별 내역</h2>
				
				<h4>최근 감지내역(3600건 조회내역)<button id="button222" onclick="button1_click();" class="btn btn-2" style="position: static; float: right;">데이터 다운로드</button></h4>
					
				<div> 
				<table class="table table-striped" id="SensorTable" >
				<thead>
					<tr>
						<th>유해연기  ${count_Add_5 }건</th>
						<th>일산화탄소 ${count_Add_6 }건</th>
						<th>층간소음 ${count_Add_7 }건</th>
						<th>침입감지 ${count_Add_8 }건</th>
						<th>반응시간 (단위 : sec)</th>
						<th>창    문 (발생유무)</th>
						<th>보일러실 (발생유무)</th>
						<th>안    방 (발생유무)</th>
						<th>집  내부 (발생유무)</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${OneHour}" var="sensor">
                        <tr>
						<td><c:out value="${sensor.mq2}" /></td>
						<td><c:out value="${sensor.mq7}" /></td>
						<td><c:out value="${sensor.vi}" /></td>
						<td><c:out value="${sensor.wave}" /></td>
						<td class="center"><fmt:formatDate
								pattern="yyyy-MM-dd HH:mm:ss" value="${sensor.time}" /></td>
						<td><font color="red"><c:if test="${sensor.mq2 > 700}">
									<c:out value="유해연기 유입됨 " />
								</c:if> </font></td>
						<td><font color="gray"> <c:if
									test="${sensor.mq7 > 800}">
									<c:out value="일산화탄소 감지 " />
								</c:if>
						</font></td>
						<td><font color="green"> <c:if
									test="${sensor.vi > 100}">
									<c:out value="층간소음 발생 " />
								</c:if>
						</font></td>
						<td><font color="pink"> <c:if
									test="${sensor.wave > 1000}">
									<c:out value="외부침입 감지됨 " />
								</c:if>
						</font></td>



					</tr>
                                </c:forEach>
                                
                      </tbody>         
                </table>    
                <script>
						function button1_click() {
							let today = new Date();   
							let hours = today.getHours(); // 시
							let minutes = today.getMinutes();  // 분
							let seconds = today.getSeconds();  // 초
							let milliseconds = today.getMilliseconds(); // 밀리초
							var times = 
							alert("최근1시간 데이터를 다운로드 합니다.");
							$('#SensorTable').TableCSVExport({
						        delivery: 'download',
						        filename: hours+"_"+minutes+"_"+seconds+'.csv'
						    });	
						}
						
						function test1_click() {
							$.ajax({
						           type : 'post',
						           url : 'http://192.168.3.18:8090/SensorTest1' //http://192.168.3.18:8090  http://192.168.35.196:8090 
						           }
						    	);
						}
						function test2_click() {
							$.ajax({
						           type : 'post',
						           url : 'http://192.168.3.18:8090/SensorTest2'  
						           }
						    	);
						}
						function test3_click() {
							$.ajax({
						           type : 'post',
						           url : 'http://192.168.3.18:8090/SensorTest3'  
						           }
						    	);
						}
						function test4_click() {
							$.ajax({
						           type : 'post',
						           url : 'http://192.168.3.18:8090/SensorTest4'  
						           }
						    	);
						}
						var ins = 0;
						function test5_click() {
							var msgInspection = prompt("점검요구사항을 작성해주세요", "");
							$.ajax({
						           type : 'get',
						           url : 'http://192.168.3.18:8090/inspection?contents='+msgInspection  ,
						           success:function(data){
						        	   ins++;
						        	   if (ins > 1) {
						        		   alert("이미 점검요청이 완료되었습니다.");
						        		   ins = 0;
										}else {
											alert("점검요청이 완료되었습니다.");		
										}
						    			
						    			
						    		}
						           }
						    	);
						}
				</script>
                </div>
				
						
	
				<a id="layouts"></a>
				<hr>

			
			</div>
			<!--/main col-->
		</div>
	</div>
	<!--/.container-->
				<script type="text/javascript">
					var pageBooleon = 0;
				</script>
				<script type="text/javascript" src="/resources/js/chart.js" ></script> 
				
<%@include file="../views/includes/footer.jsp" %>