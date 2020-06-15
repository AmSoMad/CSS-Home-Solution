<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
   
<%@include file="../../views/includes/header2.jsp" %>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://www.google.com/jsapi"></script>
<!--div class="row row-offcanvas row-offcanvas-left" 에 묶여있는 body단.-->

				<div class="col main pt-5 mt-3">
				<div class="row mb-1">
				<div class="col-xl-11 col-sm-1 py-2">
					 <div style="text-align:center; width: 100%;">
					        <font size=3 class="btn btn-2">update : <span id="clock"></span> 5분간격으로 요약정리된 데이터 입니다.</font><br>
					    </div>
					<div id="Line_Controls_Chart" style="width: 100%;" class="chart-container">
				        <!-- 라인 차트 생성할 영역 -->
				        <div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
				        <!-- 컨트롤바를 생성할 영역 -->
				  	<div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
				    </div>
				    
				    
					
					
<!-- 						<div class="card bg-success text-white h-100"> -->
<!-- 							<div class="card-body bg-success"> -->
<!-- 								<div class="rotate"> -->
<!-- 									<i class="fa fa-user fa-4x"></i> -->
<!-- 								</div> -->
<!-- 								<h6 class="text-uppercase">MQ 2</h6> -->
<!-- 								<h1 class="display-4"> -->
<!-- 									<p id="Sensor1"></p> -->
<!-- 								</h1> -->
<!-- 							</div> -->
<!-- 								여기다가 값 전송 테스트 -->
<!-- 							</div> -->
						
				</div>
				
				</div>
				<!-- 테이블 -->
				<div> 
				<button id="button222" onclick="button2_click();" class="btn btn-2" style="position: static; float: right;">데이터 다운로드</button>
				<button id="button333" onclick="button3_click();" class="btn btn-2" style="position: static; float: right;">1시간전데이터 삭제</button>
				
				<table class="table table-striped" id="SensorTable1" >
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
				<c:forEach items="${chartTable_Data}" var="sensor">
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
						function button2_click() {
							let today = new Date();   
							let hours = today.getHours(); // 시
							let minutes = today.getMinutes();  // 분
							let seconds = today.getSeconds();  // 초
							let milliseconds = today.getMilliseconds(); // 밀리초
							var times = 
							alert("모든 데이터를 5분간격으로(평균) 요약한 데이터를 다운로드합니다.");
							$('#SensorTable1').TableCSVExport({
						        delivery: 'download',
						        filename: hours+"_"+minutes+"_"+seconds+'_5분간격전체.csv'
						    });	
						}
						function button3_click() {
							userInput = prompt("1시간전 데이터를 삭제할까요? 맞다면 '네' 라고 입력해주세요."+"");
							if(userInput == "네"){
								document.location.href="Delete.bo" ;
							}else{
								alert("삭제를 취소합니다.")
							}
							
						}
				</script>
                </div>
				
				
				</div>
			<!--/main col-->
					<script type="text/javascript">
					var pageBooleon = 1;
				</script>
				
				<script>
					//차트 작성-----------------------------------------------------------------------
  var chartDrowFun = {
    chartDrow : function(){
	var queryObject = "";
    	var queryObjectLen = "";
    	$.ajax({
           type : 'post',
           url : 'http://192.168.3.18:8090/GetSensor_6', //http://192.168.3.18:8090  http://192.168.35.196:8090 
           async:false,
           dataType : 'json',
           success : function(data) {
                queryObject = eval('(' + JSON.stringify(data,null, 2) + ')');
				//queryObject = data;
				console.log(queryObject);
                queryObjectLen = queryObject.length;
               //alert('Total lines : ' + queryObjectLen + 'EA');
           },
           error : function(xhr, type) {
	       //alert('server error occoured')
	      alert('server msg : ' + xhr.status)
           }
    	});
   	//날짜형식 변경하고 싶으시면 이 부분 수정.
        var chartDateformat 	= 'yyyy년MM월dd일';
       // var chartDateformat 	= 'M.dd. HH:MM';
        //라인차트의 라인 수
        var chartLineCount    = 10;
        //컨트롤러 바 차트의 라인 수
        var controlLineCount	= 10;
        function drawDashboard() {
          var data = new google.visualization.DataTable();
          data.addColumn('datetime', '날짜');
          data.addColumn('number', '유해연기');
          data.addColumn('number', '일산화탄소');
          data.addColumn('number', '층간소음');
          data.addColumn('number', '침입감지');

          //alert('data생성-------------------' + queryObjectLen);
			//이건 원본
			//           for (var i = 0; i < queryObjectLen; i++) {			
			//               var mdatecreated = queryObject.dustlist[i].mdatecreated;			
			//               var Drnpm10Value = queryObject.dustlist[i].Drnpm10Value;	
			//               var Drnpm25Value = queryObject.dustlist[i].Drnpm25Value;	
			//               var pm10Value = queryObject.dustlist[i].pm10Value;	
			//               var pm25Value = queryObject.dustlist[i].pm25Value;
			// 	        alert(mdatecreated + ' ' + Drnpm10Value + ' ' + Drnpm25Value + ' ' + pm10Value + ' ' + pm25Value);		
			//               data.addRows([ [ new Date(mdatecreated), Drnpm10Value, Drnpm25Value, pm10Value, pm25Value ] ]);		
			//           }			          
          //alert('data생성-------------------' + queryObjectLen);
			//리스트로 받은객체 for문으로 데이터 추가
          for (var i = 0; i < queryObjectLen; i++) {
              var chartDate = queryObject[i].time;
              var chart_Mq1 = queryObject[i].mq2;
              var chart_Mq7 = queryObject[i].mq7;
              var chart_Vi = queryObject[i].vi
              var chart_Wave = queryObject[i].wave;
              data.addRows([ [ new Date(chartDate), chart_Mq1, chart_Mq7, chart_Vi, chart_Wave] ]);
          }

          var chart = new google.visualization.ChartWrapper({
              chartType   : 'LineChart',
              containerId : 'lineChartArea', //라인 차트 생성할 영역
              options     : {
                  isStacked   : 'percent',
                  focusTarget : 'category',
                  height      : 500,
                  width	      : '100%',
                  legend      : { position: "top", textStyle: {fontSize: 13}},
                  pointSize   : 5,
                  tooltip     : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
                  hAxis	: {format: chartDateformat, gridlines:{count:chartLineCount,units: {
                      years : {format: ['yyyy년']},
                      months: {format: ['MM월']},
                      days  : {format: ['dd일']},
                      hours : {format: ['HH시']},
                  	  minutes:{format: ['mm분']},
                  	  seconds:{format: ['ss초']}}
                      },textStyle: {fontSize:12}},
                 vAxis : {minValue: 50,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
                 animation  : {startup: true,duration: 1000,easing: 'in' },
                 annotations: {pattern: chartDateformat,
                      textStyle: {
                      fontSize: 15,
                      bold: true,
                      italic: true,
                      color: '#871b47',
                      auraColor: '#d799ae',
                      opacity: 0.8,
                      pattern: chartDateformat
                      }
                  }
              }
          });  //var chart 괄호

          var control = new google.visualization.ControlWrapper({
              controlType: 'ChartRangeFilter',
              containerId: 'controlsArea',  //control bar를 생성할 영역
              options: {
                  ui:{
                        chartType: 'LineChart',
                        chartOptions: {
                        chartArea: {'width': '60%','height' : 80},
                        hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
                        gridlines:{count:controlLineCount,units: {
                             years : {format: ['yyyy년']},
                             months: {format: ['MM월']},
                             days  : {format: ['dd일']},
                             hours : {format: ['HH시']}}
                        }}
                      }
                  },
                  filterColumnIndex: 0
              }
          });//var control 괄호

          var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
          date_formatter.format(data, 0);

          var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
          window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
          dashboard.bind([control], [chart]);
          dashboard.draw(data);

        }
        google.charts.setOnLoadCallback(drawDashboard);

      }

    }



$(document).ready(function(){
    google.charts.load('current', {
       'packages':['line','controls']
    });
    chartDrowFun.chartDrow(); //chartDrow() 실행

});

	
					
  </script>
				
				<script type="text/javascript" src="/resources/js/chart.js" ></script> 
<%@include file="../../views/includes/footer.jsp" %>