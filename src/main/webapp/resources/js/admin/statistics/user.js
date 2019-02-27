

$(function(){
	Highcharts.chart('container', {

	    title: {
	        text: '이용자 현황'
	    },

	    xAxis: {
	        title: {
	            text: '기간'
	        }
	    },
	    
	    yAxis: {
	        title: {
	            text: '이용자'
	        }
	    },
	    legend: {
	        layout: 'vertical',
	        align: 'right',
	        verticalAlign: 'middle'
	    },

	    plotOptions: {
	        series: {
	            label: {
	                connectorAllowed: false
	            },
	            pointStart: 1
	        }
	    },

	    series: [{
	        name: '회원수',
	        data: [43934, 52503, 57177, 69658, 97031, 119931, 137133]
	    }, {
	        name: '가입',
	        data: [24916, 24064, 29742, 29851, 32490, 30282, 38121]
	    }, {
	        name: '탈퇴',
	        data: [11744, 17722, 16005, 19771, 20185, 24377, 32147]
	    }],

	    responsive: {
	        rules: [{
	            condition: {
	                maxWidth: 500
	            },
	            chartOptions: {
	                legend: {
	                    layout: 'horizontal',
	                    align: 'center',
	                    verticalAlign: 'bottom'
	                }
	            }
	        }]
	    }

	});

	
})


