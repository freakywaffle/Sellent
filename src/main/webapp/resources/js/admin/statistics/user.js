

$(function(){
	Highcharts.chart('container', {
	    colors: [
	        '#ff0066', '#eeaaee', '#55BF3B', '#DF5353', '#7798BF', '#aaeeee'],
	    chart: {
	        backgroundColor: null,
	        style: {
	            fontFamily: 'Signika, serif'
	        }
	    },
	    title: {
	        text: '회원 현황'
	    },

	    xAxis: {
	        title: {
	            text: '기간'
	        }
	    },
	    
	    yAxis: {
	        title: {
	            text: '회원'
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
	            pointStart: 18
	        }
	    },

	    series: [{
	        name: '회원수',
	        data: [0, 3, 5, 5, 8, 13, 17]
	    }, {
	        name: '가입',
	        data: [0, 3, 3, 0, 5, 7, 5]
	    }, {
	        name: '탈퇴',
	        data: [0, 0, 1, 0, 2, 3, 1]
	    }],

	    responsive: {
	        rules: [{
	            condition: {
	                maxWidth: 700
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



$(function(){

	$("tspan").css("font-weight","bold")
	$(".highcharts-root").css("background","url('https://www.highcharts.com/samples/graphics/sand.png')")
	$(".highcharts-credits").css("display","none")
	$(".highcharts-button-box").css("display","none")
})

