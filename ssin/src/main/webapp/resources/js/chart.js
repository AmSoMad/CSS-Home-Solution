
	var ctx = document.getElementById('myChart');
	var ctx1 = document.getElementById('myChart1');
	var ctx2 = document.getElementById('myChart2');
	var ctx3 = document.getElementById('myChart3');
	
	var config = {
		type: 'line',
		data: {
			labels: [ // Date Objects
				'load'
				
			],
			datasets: [{
				label: 'MQ_2',
				backgroundColor: 'rgba(47, 157, 39, 1)',
				borderColor: 'rgba(47, 157, 39, 1)',
				fill: false,
				data: [
					sensor1
					
				],
			}]
		},
		options: {
			maintainAspectRatio: false,
			title: {
				text: 'Chart.js Time Scale'
			},
			scales: {
				yAxes: [{
					scaleLabel: {
						display: true,
						labelString: '차트'
					}
				}]
			},
		}
		
	};
	var config1 = {
			type: 'line',
			data: {
				labels: [ // Date Objects
					'load'
					
				],
				datasets: [{
					label: 'MQ_7',
					backgroundColor: 'rgba(255, 99, 132, 1)',
					borderColor: 'rgba(255, 99, 132, 1)',
					fill: false,
					data: [
						sensor2
						
					],
				}]
			},
			options: {
				maintainAspectRatio: false,
				title: {
					text: 'Chart.js Time Scale'
				},
				scales: {
					yAxes: [{
						scaleLabel: {
							display: true,
							labelString: '차트'
						}
					}]
				},
			}
			
		};
	var config2 = {
			type: 'line',
			data: {
				labels: [ // Date Objects
					'load'
					
				],
				datasets: [{
					label: '진동',
					backgroundColor: 'rgba(75, 192, 192, 1)',
					borderColor: 'rgba(75, 192, 192, 1)',
					fill: false,
					data: [
						sensor3
						
					],
				}]
			},
			options: {
				maintainAspectRatio: false,
				title: {
					text: 'Chart.js Time Scale'
				},
				scales: {
					yAxes: [{
						scaleLabel: {
							display: true,
							labelString: '차트'
						}
					}]
				},
			}
			
		};
	var config3 = {
			type: 'line',
			data: {
				labels: [ // Date Objects
					'load'
					
				],
				datasets: [{
					label: '초음파',
					backgroundColor: 'rgba(255, 193, 7, 1)',
					borderColor: 'rgba(255, 193, 7, 1)',
					fill: false,
					data: [
						sensor4
						
					],
				}]
			},
			options: {
				maintainAspectRatio: false,
				title: {
					text: 'Chart.js Time Scale'
				},
				scales: {
					yAxes: [{
						scaleLabel: {
							display: true,
							labelString: '차트'
						}
					}]
				},
			}
			
		};
	//데이터 추가
	//document.getElementById('addData').onclick = 
		function draw(){
			let today = new Date();   

			let hours = today.getHours(); // 시
			let minutes = today.getMinutes();  // 분
			let seconds = today.getSeconds();  // 초
			let milliseconds = today.getMilliseconds(); // 밀리초
			var times = hours + ':' + minutes + ':' + seconds;
			
		//라벨추가
		config.data.labels.push(times)
		config1.data.labels.push(times)
		config2.data.labels.push(times)
		config3.data.labels.push(times)
		//데이터셋 수 만큼 반복
		var dataset = config.data.datasets;
		var dataset1 = config1.data.datasets;
		var dataset2 = config2.data.datasets;
		var dataset3 = config3.data.datasets;
		for(var i=0; i<dataset.length; i++){
			//데이터셋의 데이터 추가
			dataset[i].data.push(sensor1);
			dataset1[i].data.push(sensor2);
			dataset2[i].data.push(sensor3);
			dataset3[i].data.push(sensor4);
			if((config.data.labels.length-1) > 30){
				config.data.labels.splice(0,1);//라벨 삭제
				config.data.datasets.forEach(function(dataset) {
					dataset.data.splice(0,1);
				});
				config1.data.labels.splice(0,1);//라벨 삭제
				config1.data.datasets.forEach(function(dataset1) {
					dataset1.data.splice(0,1);
				});
				config2.data.labels.splice(0,1);//라벨 삭제
				config2.data.datasets.forEach(function(dataset2) {
					dataset2.data.splice(0,1);
				});
				config3.data.labels.splice(0,1);//라벨 삭제
				config3.data.datasets.forEach(function(dataset3) {
					dataset3.data.splice(0,1);
				});
			}
			//)
		}
		if(pageBooleon == 0){
			if(myChart != null){
				myChart.update();	//차트 업데이트
			}
			if(myChart1 != null){
				myChart1.update();	//차트 업데이트
			}
			if(myChart2 != null){
				myChart2.update();	//차트 업데이트
			}
			if(myChart3 != null){
				myChart3.update();	//차트 업데이트
			}
		}
		if(pageBooleon ==1){
			myChart.update();
		}
		if(pageBooleon ==2){
			myChart1.update();
		}
		if(pageBooleon ==3){
			myChart2.update();
		}
		if(pageBooleon ==4){
			myChart3.update();
		}
		
		
		
	}
	//차트 그리기
	var myChart = new Chart(ctx, config);
	var myChart1 = new Chart(ctx1, config1);
	var myChart2 = new Chart(ctx2, config2);
	var myChart3 = new Chart(ctx3, config3);
